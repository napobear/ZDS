/************************* START OF XFER MODULE 3 ***************************/

#include "zmp.h"
#include "zmodem.h"

#ifdef   AZTEC_C
#include "libc.h"
#else
#include <stdio.h>
#endif

#include <setjmp.h>
#include <string.h>

#include "zmxfer.h"

extern int opabort ( void );
extern int readline(int);

extern jmp_buf jb_stop;				/* buffer for longjmp */

extern char *ltoa();
extern char Myattn[];

extern unsigned Txwindow;			/* Control the size of the transmitted window */
extern unsigned Txwspac;	      		/* Spacing between zcrcq requests */
extern unsigned Txwcnt;	      			/* Counter used to space ack requests */
extern int Noeofseen;
extern int Totsecs;		      		/* total number of sectors this file */
extern char *Txbuf;
extern int Filcnt; 		      		/* count of number of files opened */
extern unsigned Rxbuflen;			/* Receiver's max buffer length */
extern int Rxflags;
extern long Bytcnt;
extern long Lastread;		      		/* Beginning offset of last buffer read */
extern int Lastn;		         	/* Count of last buffer read or -1 */
extern int Dontread;		      		/* Don't read the buffer, it's still there */
extern long Lastsync;		      		/* Last offset to which we got a ZRPOS */
extern int Beenhereb4;		   		/* How many times we've been ZRPOS'd same place */
extern int Incnt;              			/* count for chars not read from the Cpmbuf */

extern int minprdy ( void );

/*
 * Get the receiver's init parameters
 */

int getzrxinit()
{
	static int n;

	for ( n = 10; --n >= 0; ) {
		if ( opabort() )
			return NERROR;

		switch ( zgethdr ( Rxhdr, 1 ) ) {
			case ZCHALLENGE:	/* Echo receiver's challenge numbr */
				stohdr ( Rxpos );
				zshhdr ( ZACK, Txhdr );
				continue;

			case ZCOMMAND:		/* They didn't see out ZRQINIT */
				stohdr ( 0L );
				zshhdr ( ZRQINIT, Txhdr );
				continue;

			case ZRINIT:
				Rxflags = 0377 & Rxhdr[ZF0];
				Txfcs32 = ( Wantfcs32 && ( Rxflags & CANFC32 ) );
				Zctlesc |= Rxflags & TESCCTL;
				Rxbuflen = ( 0377 & Rxhdr[ZP0] ) + ( ( 0377 & Rxhdr[ZP1] ) << 8 );
				return ( sendzsinit() );

			case ZCAN:
			case TIMEOUT:
				return NERROR;

			case ZRQINIT:
				if ( Rxhdr[ZF0] == ZCOMMAND )
					continue;

			default:
				zshhdr ( ZNAK, Txhdr );
				continue;
		}
	}

	return NERROR;
}

/* Send send-init information */

int sendzsinit()
{
	int tries;

	stohdr ( 0L );						/* All flags are undefined */
	strcpy ( Txbuf, Myattn );				/* Copy Attn string */

	for ( tries = 0; tries < 20; tries++ ) {
		if ( opabort() )
			return NERROR;

		zsbhdr ( ZSINIT, Txhdr );			/* Send binary header */
		zsdata ( Txbuf, strlen ( Txbuf ) + 1, ZCRCW );	/* Send string */

		if ( zgethdr ( Rxhdr, 0 ) == ZACK )
			return OK;

		zperr ( "Bad ACK: ZSINIT", FALSE );
	}

	return NERROR;
}

/* Send file name and related info */

int zsendfile ( char * buf, int blen )
{
	static int c;

	for ( ;; ) {
		if ( opabort() )
			return NERROR;

		Txhdr[ZF0] = 0;	/* file conversion request */
		Txhdr[ZF1] = 0;	/* file management request */
		Txhdr[ZF2] = 0;	/* file transport request */
		Txhdr[ZF3] = 0;
		zsbhdr ( ZFILE, Txhdr );
		zsdata ( buf, blen, ZCRCW );
again:
		c = zgethdr ( Rxhdr, 1 );

		switch ( c ) {
			case ZRINIT:
				while ( ( c = readline ( INTRATIME ) ) > 0 )
					if ( c == ZPAD ) {
						goto again;
					}

			/* **** FALL THRU TO **** */
			default:
				continue;

			case ZCAN:
			case TIMEOUT:
			case ZABORT:
			case ZFIN:
				return NERROR;

			case ZSKIP:
				return c;

			case ZRPOS:
				/*
				 * Suppress zcrcw request otherwise triggered by
				 * lastyunc==Bytcnt
				 */
				Lastsync = ( Bytcnt = Txpos = Rxpos ) - 1L;

				lseek ( Fd, Rxpos, 0 ); /* absolute offset */

				clrline ( KBYTES );
				Incnt = 0;
				Dontread = FALSE;
				c = zsndfdata();
				Sending = FALSE;
				return c;
		}
	}
}

/* Send the data in the file */

int zsndfdata()
{
	static int c, e, n;
	static int newcnt;
	static long tcount;
	static int junkcount;      		/* Counts garbage chars received by TX */

	tcount = 0L;
	Blklen = 128;

	if ( Baudrate > 300 )
		Blklen = 256;

	if ( Baudrate > 1200 )
		Blklen = 512;

	if ( Baudrate > 2400 )
		Blklen = KSIZE;

	if ( Rxbuflen && Blklen > Rxbuflen )
		Blklen = Rxbuflen;

	Lrxpos = 0L;
	junkcount = 0;
	Beenhereb4 = FALSE;
	Sending = Firstsec = TRUE;
somemore:

	if ( NULL ) {
waitack:
		junkcount = 0;
		c = getinsync ( 0 );

		if ( QuitFlag )
			return NERROR;

gotack:

		if ( setjmp ( jb_stop ) ) {	/* come here if rx stops us */
rxint:
			c = getinsync ( 1 );
		}

		switch ( c ) {
			default:
			case ZCAN:
				return NERROR;

			case ZSKIP:
				return c;

			case ZACK:
			case ZRPOS:
				break;

			case ZRINIT:
				return OK;
		}

		/*
		 * If the reverse channel can be tested for data,
		 *  this logic may be used to detect error packets
		 *  sent by the receiver, in place of setjmp/longjmp
		 *  minprdy() returns non 0 if a character is available
		 */
		while ( minprdy() ) {
			if ( QuitFlag )
				return NERROR;

			switch ( readline ( 1 ) ) {
				case CTRLC:
				case CAN:
				case ZPAD:
					goto rxint;

				case XOFF:		/* Wait a while for an XON */
				case XOFF|0200:
					readline ( 100 );
			}
		}
	}

	if ( setjmp ( jb_stop ) ) {			/* rx interrupt */
		c = getinsync ( 1 );

		if ( c == ZACK )
			goto gotanother;

		purgeline();
		/* zcrce - dinna wanna starta ping-pong game */
		zsdata ( Txbuf, 0, ZCRCE );
		goto gotack;
	}

	newcnt = Rxbuflen;
	Txwcnt = 0;
	stohdr ( Txpos );
	zsbhdr ( ZDATA, Txhdr );

	do {
		if ( QuitFlag )
			return NERROR;

		if ( Dontread ) {
			n = Lastn;
		} else {
			n = filbuf ( Txbuf, Blklen );
			Lastread = Txpos;
			Lastn = n;
		}

		Dontread = FALSE;

		if ( n < Blklen )
			e = ZCRCE;
		else if ( junkcount > 3 )
			e = ZCRCW;
		else if ( Bytcnt == Lastsync )
			e = ZCRCW;
		else if ( Rxbuflen && ( newcnt -= n ) <= 0 )
			e = ZCRCW;
		else if ( Txwindow && ( Txwcnt += n ) >= Txwspac ) {
			Txwcnt = 0;
			e = ZCRCQ;
		} else
			e = ZCRCG;

		zsdata ( Txbuf, n, e );
		Txpos += ( long ) n;
		Bytcnt = Txpos;
		crcrept ( Crc32t );			/* praps report crc mode */
		lreport ( KBYTES, Bytcnt );

		if ( e == ZCRCW )
			goto waitack;

		/*
			 * If the reverse channel can be tested for data,
			 *  this logic may be used to detect error packets
			 *  sent by the receiver, in place of setjmp/longjmp
			 *  minprdy() returns non 0 if a character is available
			 */

		while ( minprdy() ) {
			if ( QuitFlag )
				return NERROR;

			switch ( readline ( 1 ) ) {
				case CAN:
				case CTRLC:
				case ZPAD:
					c = getinsync ( 1 );

					if ( c == ZACK )
						break;

					purgeline();
					/* zcrce - dinna wanna starta ping-pong game */
					zsdata ( Txbuf, 0, ZCRCE );
					goto gotack;

				case XOFF: 	/* Wait a while for an XON */
				case XOFF|0200:
					readline ( 100 );

				default:
					++junkcount;

			}

gotanother:
			;
		}

		if ( Txwindow ) {
			while ( ( tcount = Txpos - Lrxpos ) >= Txwindow ) {
				if ( QuitFlag )
					return NERROR;

				if ( e != ZCRCQ )
					zsdata ( Txbuf, 0, e = ZCRCQ );

				c = getinsync ( 1 );

				if ( c != ZACK ) {
					purgeline();
					zsdata ( Txbuf, 0, ZCRCE );
					goto gotack;
				}
			}
		}
	} while ( n == Blklen );

	for ( ;; ) {
		if ( QuitFlag )
			return NERROR;

		stohdr ( Txpos );
		zsbhdr ( ZEOF, Txhdr );

		switch ( getinsync ( 0 ) ) {
			case ZACK:
				continue;

			case ZRPOS:
				goto somemore;

			case ZRINIT:
				return OK;

			case ZSKIP:
				return c;

			default:
				return NERROR;
		}
	}
}

/*
 * Respond to receiver's complaint, get back in sync with receiver
 */

int getinsync ( int flag )   /* flag means that there was an error */
{
	static int c;
	unsigned u;

	for ( ;; ) {
		if ( opabort() )
			return NERROR;

		c = zgethdr ( Rxhdr, 0 );
		c = c < FRTYPES ? c : FRTYPES - 1;
		sprintf ( Buf, "Got %s", frametypes[c + FTOFFSET] );
		zperr ( Buf, flag );

		switch ( c ) {

			case ZCAN:
			case ZABORT:
			case ZFIN:
			case TIMEOUT:
				return NERROR;

			case ZRPOS:

				/* ************************************* */
				/*  If sending to a modem beuufer, you   */
				/*   might send a break at this point to */
				/*   dump the modem's buffer.		 */

				if ( Lastn >= 0 && Lastread == Rxpos ) {
					Dontread = TRUE;
				} else {

					u = lseek ( Fd, Rxpos, 0 ); /* absolute offset */

					clrline ( KBYTES );
					Incnt = 0;
				}

				Bytcnt = Lrxpos = Txpos = Rxpos;

				if ( Lastsync == Rxpos ) {
					if ( ++Beenhereb4 > 4 )
						if ( Blklen > 256 )
							Blklen /= 2;
				}

				Lastsync = Rxpos;
				return c;

			case ZACK:
				Lrxpos = Rxpos;

				if ( flag || Txpos == Rxpos )
					return ZACK;

				continue;

			case ZRINIT:
			case ZSKIP:
				return c;

			case NERROR:
			default:
				zsbhdr ( ZNAK, Txhdr );
				continue;
		}
	}
}

/* Say "bibi" to the receiver, try to do it cleanly */

void saybibi()
{
	for ( ;; ) {
		stohdr ( 0L );		/* CAF Was zsbhdr - minor change */
		zshhdr ( ZFIN, Txhdr );	/*  to make debugging easier */

		switch ( zgethdr ( Rxhdr, 0 ) ) {
			case ZFIN:
				mcharout ( 'O' );
				mcharout ( 'O' );

			case ZCAN:
			case TIMEOUT:
				return;
		}
	}
}

char * ttime ( long fsize )
{
	static int efficiency, cps, seconds;
	static char buffer[10];

	efficiency = Zmodem ? 9 : 8;
	cps = ( Baudrate / 100 ) * efficiency;
	seconds = ( int ) ( fsize / cps );
	sprintf ( buffer, "%d:%02d", seconds / 60, seconds % 60 );
	return buffer;
}

void tfclose()          /* close file if still open */
{

	if ( Fd >= 0 )
		close ( Fd );

	Fd = -1;
}


void slabel() /*print send mode labels on the 25th line*/
{
	sprintf ( Buf, "SEND FILE Mode:  Press ESC to Abort..." );
	putlabel ( Buf );
}

/************************** END OF MODULE 7A *********************************/

