;
;=======================================================================
;
; Modular Z80 DarkStar (NE Z80) SysBios
;
;=======================================================================
;
; Original code:
; Z80 Nuova Elettronica Monitor 390 su eprom 2532 (4k)
;
; Disassembled and reconstructed by
; Piergiorgio Betti <pbetti@lpconsul.net> on 2005 01 26
;
; Latest non modular BIOS is DARKSTAR-MONITOR-0.9.0.asm
; dated 20140531
; - Following addition of MultiF-Board doing complete rewrite of the
;   monitor/BIOS has been started.
;   Major goals:
;   o Modularization: Now monitor can grow up to 256kb instead of 4kb
;     :-)
;   o Specialized images fitted in memory page (4kb) or multiples
;   o Full support for new hardware
;   o I/O rewrite for MODE 2 interrupts
;   Minor goals:
;   o Full code clean-up & reorganization
; ---------------------------------------------------------------------
; ---------------------------------------------------------------------
; Revisions:
; 20140905 - Modified hexadecimal constants to 0xxH format to be widely
;            accepted by different assemblers
; 20150714 - Changed to have timeouts on floppy operations that could
;            produce system locks. (I.e. in absence of floppy in drive)
; 20150714 - Modified to implement serial XON/XOFF and RTS/CTS
; ---------------------------------------------------------------------

; ---------------------------------------------------------------------
; SYSBIOS
;
; This is the BIOS non-resident portion of the new (banked)
; BIOS/Monitor for the NE Z80 (aka DarkStar)
;
; ---------------------------------------------------------------------
;
; Full BIOS memory scheme:
;
;	+-----------------+
;	+    SysCommon    +   <-- Resident portion. Common to all images
;	+   FC00 - FFFF   +
;	+-----------------+
;	+-----------------+   +-----------------+   +-----------------+
;	+     SysBios     +   +   BootMonitor   +   +     [Other]     +
;	+   F000 - FBFF   +   +   F000 - FBFF   +   +   F000 - FBFF   +
;	+-----------------+   +-----------------+   +-----------------+
;
;	         ^                     ^                     ^
;	         |                     |                     |
;	         ---------------------------------------------
;	                      Variable section
;
; The above are always assembled at ORG F000 and linked and allocated
; in the EEPROM in this way:
;
;	+-----------------+
;	+    SysCommon    +
;	+   FC00 - FFFF   +
;	+     SysBios     +     <-- EEPROM page 1 ($C1000)
;	+   F000 - FBFF   +
;	+-----------------+
;	+-----------------+
;	+    SysCommon    +
;	+   FC00 - FFFF   +
;	+   BootMonitor   +     <-- EEPROM page 0 ($C0000)
;	+   F000 - FBFF   +
;	+-----------------+
;
; ---------------------------------------------------------------------


; Common equates for BIOS/Monitor

include Common.inc.asm
include services.inc.asm

;-------------------------------------
; External symbols
	extern	bbconout, bbconin, bbconst
	extern	bbcrtcini, bbcrtfill, bbcurset, bbsetcrs
	extern	bbfread, bbfhome, bbcpboot
	extern	bbhdinit, bbdriveid, bbu0ini, bbu1ini
	extern	bbuplchr, bbpsndblk, bbprcvblk
	extern	bbprnchr, bbrdvdsk, bbvcpmbt
 	extern	bbhdboot, bbsetdsr, bbgetdsr
 	extern	bbeidck, bbldpart, bbsysint

 	extern	bbdsksel, bbdmaset, bbtrkset, bbsecset, bbhdrd

	extern	delay, mmpmap, mmgetp
	extern	intren, print, inline

;-------------------------------------

	dseg

	name	'SYSMON'

zdsmntr	equ	$		; start of monitor code

bmstack	equ	(bbpag << 12) - 1
hdidbuf	equ	(trnpag << 12)

inicol	equ	23			; column for init test

boot:
	if not bbdebug
	jp	booti			; skip bank id
	else
	jr	booti
	endif

sysbidb:
	defb	'SYSBIOSB'

;;
;; BOOT - Bring up system
;;
booti:
	di				; disable interrupts
	ld	b,bbpag << 4
	ld	c,mmuport
	ld	a,eepage0		; mount rom and start
	if not bbdebug
	out	(c),a
	endif
	; Reset memory
	ld	e,16			; ram page counter (15 + 1 for loop)
	ld	c,mmuport		; MMU I/O address
	xor	a
	ld	b,a
	ld	d,a
mmurslp:
	dec	e
	jr	z, mmursend
	out	(c),d
	inc	d			; phis. page address 00xxxh, 01xxxh, etc.
	add	a,$10
	ld	b,a			; logical page 00h, 10h, etc.
	jr	mmurslp
mmursend:
	if not bbdebug
	ld	d,eepage0		; EEPROM page 0 (here) @ F000h
	out	(c),d
	endif
	; Reset bios position after reset
	out	(menaprt),a  		; enable ram
	;
	ld	sp,$0080		; go on
	ld	hl,$0000
	ld	(curpbuf),hl
	xor	a			; initialize our buffers
	ld	(tmpbyte),a
	ld	(cdisk),a
	ld	(colbuf),a
	ld	(miobyte),a
	ld	(dselbf),a
	ld	(copsys),a
	ld	(cnfbyte),a
	cpl
	ld	(ram3buf),a
	ld	hl,$ffff
	ld	(fsekbuf),hl
	ld	a,$c3
	ld	($0066),a
	ld	hl,boot
	ld	($0067),hl
	ld	a,$c9
; 	ld	($0008),a
	ld	($0038),a
	ld	hl,cnfbyte		; enable XON protocol by default (UART0)
	set	1,(hl)

	; now size banked memory
	ld	b,mmutstpage << 4	; save actual test page
	ld	c,mmuport
	ld	hl,mmutstaddr
	in	a,(c)
	ex	af,af'

	ld	e,$bf-$0f		; number of pages to check
	ld	d,$0f			; first page
bnkpnxt:
	out	(c),d			; setup page

	ld	a,(hl)			; test if writable
	cpl
	ld	(hl),a
	cp	(hl)
	cpl
	ld	(hl),a
	jr	nz,bnktohpag

	inc	d			; next page
	dec	e
	jr	nz,bnkpnxt
bnktohpag:
	ex	af,af'			; restore test page
	out	(c),a

	ld	a,d			; save size
	ld	(hmempag),a
	;
	ld	hl,bmstack
	ld	sp,hl
 	ld	(btpasiz),hl

 	; NOW prior to go on we must place BIOS images in ram

	ld	a,(hmempag)		; highest ram page
	ld	e,4			; # of pages
	sub	e
	ld	d,bbimgp		; base sysbios page
shdwpag:
 	ld	b,trnpag << 4		; mount source page on transient
	ld	c,mmuport
	out	(c),d			; transient mounted
	inc	d
	ld	b,bbappp << 4		; app page for destination
	out	(c),a			; destination in place
	inc	a
	exx				; save
	ld	hl, trnpag << 12	; source
	ld	de, bbappp << 12	; dest
	ld	bc, 4096		; one page
	ldir
	exx				; restore
	dec	e			; finished ?
	jr	z,shdwdone
	jr	shdwpag
shdwdone:
	ld	b,bbpag << 4		; put bootmonitor to final place
	ld	a,(hmempag)		; highest ram page
	sub	4
	out	(c),a
	jp	onshadow		; jump to shadow

onshadow:
	ld	b,bbappp << 4		; reset app page
	ld	d,bbappp
	out	(c),d
	ld	b,trnpag << 4		; and transient page
	ld	d,trnpag
	out	(c),d

 	; init fifo queues and remaining hw
	ld	b,fifsize
	ld	hl,fifou0		; uart 0
	call	fifoini
	;
	xor	a
	out	(fdcdrvrcnt),a		; resets floppy selection
	out	(crtprntdat),a
	out	(altprnprt),a
	cpl
	out	(crtprntdat),a
	out	(altprnprt),a
	ld	a, ppuini		; init parallel port for rx
	out	(ppcntrp), a
	ld	a,blifastline		; blink, fast, line shaped cursor
	ld	(cursshp),a
	;
	call	bbcrtcini		; Initialize CRTC
		; workaround for "slow" init video boards
	ld	de, 1000		; sleep 1 sec.
	call	delay
	call	bbcrtcini		; Initialize CRTC (again)
		;
	call	bbcurset		; and cursor shape
	;
	ld	c,SI_LOGO		; display logo
	call	bbsysint
	;
	; tell user whats going on from now
	ld	hl,msetsha		; on shadow
	call	print
 	ld	hl,msysres		; initialising
 	call	print
 	call	bbnksiz			; tell how many memory
	;
	ld	h,11
	ld	l,inicol
	call	bbsetcrs
 	call	bbhdinit		; IDE init
	or	a
	jr	nz,ideinok
; 	call	bbldpart
 	call	bbdriveid
	or	a
	jr	nz,ideinok
	ld	hl,mrdy
	call	print
	; get hd params from scratch
	ld	b, trnpag
	call	mmgetp
	push	af			; save current
	;
	ld	a,(hmempag)		; bios scratch page (phy)
	ld	b,trnpag		; transient page
	call	mmpmap			; mount it
	;
; 	ld	a,' '+$80
	ld	hl,hdidbuf + 54		; drive id string is @ BLDOFFS + 54
	ld	b,10                    ; and 20 bytes long
	call	hdbufprn
	call	print
	pop	af			; remove scratch
	ld	b,trnpag		; transient page
	call	mmpmap			; mount it
; 	call	bbldpart		; load partition table
	jr	ideiok
ideinok:
	ld	hl,mnot
	call	print
ideiok:
	ld	h,12
	ld	l,inicol
	call	bbsetcrs
	ld	a,u0defspeed		; uart 0 init
	ld	(uart0br),a
	call	bbu0ini
	call	dsustat
	call	inline
	defb	"16x550 0",0
	ld	h,13
	ld	l,inicol
	call	bbsetcrs
	ld	a,u1defspeed		; uart 1 init
	ld	(uart1br),a
	call	bbu1ini
	call	dsustat
	call	inline
	defb	"16x550 1",0
	;
	ld	h,14
	ld	l,inicol
	call	bbsetcrs
	call	bbeidck
	ld	b,a			; temp save
	and	$0f			; mask result
	cp	eep29ee
	jr	nz,is29x
	ld	hl,mepee		; 29ee
	jr	gotetype
is29x:	cp	eep29xe
	jr	nz,is29c
	ld	hl,mepxe		; 29xe
	jr	gotetype
is29c:	cp	eep29c
	jr	nz,isuns
	ld	hl,mepc			; 29ee
	jr	gotetype
isuns:	ld	hl,mepuns
gotetype:
	call	print
	ld	b,a
	and	eeproglock
	jr	nz,islckd
	ld	hl,mpron
	jr	isprog
islckd:	ld	hl,mprof
isprog:	call	print
	; rtc
	ld	h,15
	ld	l,inicol
	call	bbsetcrs
	ld	d,55			; set test value
	ld	e,DSR_SCRATCH
	call	bbsetdsr
	ld	e,DSR_SCRATCH		; get test value
	call	bbgetdsr
	ld	a,d
	cp	55			; ?
	jr	nz,nokrtc
	ld	hl,mrdy
	jr	okrtc
nokrtc:	ld	hl,mnot
okrtc:	call	print
	call	inline
	defb	cr,lf,lf,0
	;
	ld	a,ctc0tchi		; chan 0 prescaler
	ld	(ctc0tc),a
	ld	a,syshertz		; chan 1 prescaler
	ld	(ctc1tc),a
	;
	call	intren			; enable interrupts
	;
	ld	c,SI_EFFECT
	ld	e,EF_REVON
	call	bbsysint
	call	inline
	defb " READY ",0
	ld	c,SI_EFFECT
	ld	e,EF_REVOFF
	call	bbsysint
	; finally print bios greetings
	jp	ugreet
;;
;; New code for direct access to bootloaders
;;
bootm:
	ld	hl,(btpasiz)		; The same as USRCMD
	ld	sp,hl
	ld	hl,usrcmd
	push	hl
	ld	($0001),hl
	ld	a,$c3
	ld	($0000),a
	;
bmpro:
	call	bbhdinit
	call	bbldpart		; load partition table
	ld	hl,mbmenu		; display the menu
	call	print
	call	dogetchr		; get user choice
	push	af
	call	outcrlf
	pop	af
	cp	cr			; go to monitor ?
	jp	z,welcom		; yes
	cp	'A'			; is  a valid drive ?
	jp	m,bmpro			; no < A
	cp	'Q'
	jp	p,bmpro			; no > P
	sub	'A'			; makes a number
	ld	(fdrvbuf),a		; is valid: store in monitor buffer
	ld	(cdisk),a		; and in CP/M buf
	cp	'C'-'A'			; is floppy ?
	jp	m,bbcpboot		; yes
	cp	'O'-'A'			; is hard disk ?
	jp	m,hdboot		; yes

	; ... fall through
dovcpmb:
	call	bbvcpmbt
	jp	z,bldoffs+2
	jr	blerr

docpmb:
	call	bbcpboot
	jr	blerr
hdboot:
	call	bbhdboot
	ld	a,d
	or	a
	jr	nz,nobler
	ld	hl,mhderr
	jr	pberr
blerr:
	ld	hl,mbterr
	jr	pberr
nobler:
	ld	hl,mbtnbl
pberr:	call	print
	jr	bootm

;;
;; Display command help
;;
cmdhelp:
	ld	hl,mhelp
	call	print
	jp	usrcmd

;;
;; initialize fifo queue
;;
;; HL = base address
;;  B = size

fifoini:
	push	bc
	xor	a
	ld	(hl),a			; cnt
	inc	hl
	ld	(hl),a			; nout
	inc	hl
	ld	a,b
	dec	a
	ld	(hl),a			; mask for MOD ops
	inc	hl
	xor	a
fifinl:	ld	(hl),a			; actual buffer
	inc	hl
	djnz	fifinl
	pop	bc
	ret

;;
;; UART init result
;;
dsustat:
	or	a
	jr	z,dsuok
	ld	hl,mnot
	call	print
	ret
dsuok:	ld	hl,mrdy
	call	print
	ret

;;
;; Print string fro IDE buffer
;;
hdbufprn:
	inc	hl		;Text is low byte high byte format
	ld	c,(hl)
	call	bbconout
	dec	hl
	ld	c,(hl)
	call	bbconout
	inc	hl
	inc	hl
	dec	b
	jp	nz,hdbufprn
	ret

;;
;; Size memory and report
;;
bbnksiz:
	ld	hl,$0000
	ld	de,$0004
	ld	a,(hmempag)
	inc	a			; correct count for last 4k
	ld	b,a
bbnksiz1:
	add	hl,de
	djnz	bbnksiz1
	push	hl
	ld	h,9
	ld	l,inicol
	call	bbsetcrs
	pop	hl
	ld	c,SI_B2D
	ld	e,BD_NOZERO
	call	bbsysint
	call	inline
	defb	'k',0
	ld	h,10			; rom (fake)
	ld	l,inicol
	call	bbsetcrs
	call	inline
	defb	"256k",0
	ret



;;
;; USRCMD - display prompt and process user commands
;;
ugreet:
	call	outcrlf
	ld	hl,mverstr
	call	print
welcom:
; 	ld	hl,mbwcom
; 	call	print
	jr	usrcmd
ucprompt:
	ld	hl,urestr		; reject string
	call	print
usrcmd:
	ld	hl,(btpasiz)
	ld	sp,hl
	ld	hl,usrcmd
	push	hl
	ld	($0001),hl
	ld	a,$c3
	ld	($0000),a
	call	outcrlf
	call	doprompt
	sub	$41			; convert to number
	jr	c,ucprompt		; minor 0
	cp	$1a
	jr	nc,ucprompt		; greater than jump table
	add	a,a
	ld	e,a
	ld	d,$00
	ld	b,$02
	ld	hl,ucmdtab
	add	hl,de
	ld	a,(hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	jp	(hl)

;;
;; Echo input
;;
kecho:
	call	bbconin
	cp	3			; ^C stop test
	jp	z,welcom
	ld	c,a
; 	CP	$20
; 	JR	NC,KDOE
; 	CP	$08
; 	JR	Z,KDOE
; 	PUSH	AF
; 	CALL	SPACER
; 	POP	AF
; 	CALL	H2AJ1
; 	LD	C,'-'
; 	CALL	BBCONOUT
; 	JR	KECHO
kdoe:	call	bbconout
	jr	kecho

;;
;;
;; PDNLOAD- prompt user for parallel download
;;
pdnload:
	call	outcrlf
	ld	hl, sdlpr
	call	print
	call	askfrom
	ex	de,hl
	call	asksize
	ld	c,l
	ld	b,h
	call	outcrlf
	ld	hl, strwait
	call	print
	call	bbpsndblk		; send data
	ld	d,c			; save result
	ld	hl,mtx
	call	print
	ld	d,a
	or	a
	jr	z,pdnlok
	ld	hl, mnot		; error
	call	print
	jp	usrcmd
pdnlok:
	ld	hl,mrdy			; success
	call	print
	jp	usrcmd

;;
;; pupload data through parallel link
;;
;; use:
;;	none
;; unclean register usage: ALL
pupload:
	call	outcrlf
	ld	hl, strwait
	call	print

	call	bbuplchr		; in hi byte of upload offset
	ld	h,a
	call	bbuplchr		; in lo byte of upload offset
	ld	l,a
	call	bbuplchr		; in hi byte of data size
	ld	b,a
	call	bbuplchr		; in lo byte of data size
	ld	c,a

	push	bc
	push	hl
	ld	hl, strload
	call	print
	pop	hl
	call	h2a
	call	inline
	defb	cr,lf,lf,0
	pop	bc

	ex	de,hl			; put offset in DE
	call	bbprcvblk		; upload data block
	push	bc			; save result
	ld	hl,mrx
	call	print
	pop	bc
	ld	a,c
	or	a
	jr	z,puplok
	ld	hl, mnot		; error
	call	print
	jp	usrcmd
puplok:
	ld	hl,mrdy			; success
	call	print
	jp	usrcmd

;;
;; FILLMEM - fill memory with a given values
;
fillmem:
	call	askfrom
	push	hl
	call	askto
	ex	de,hl
	call	askdata
	ld	c,l
	pop	hl
	dec	hl
flme1:
	inc	hl
	ld	(hl),c
	call	cphlde
	jr	c,flme1
	jp	usrcmd
;;
;; MEMCOMP - compare two ram regions
memcomp:
	call	askfrom
	push	hl
	call	askto
	ex	de,hl
	call	asksize
	ld	c,l
	ld	b,h
	pop	hl
memcp0:
	ld	a,b
	or	c
	ret	z
	ld	a,(de)
	inc	de
	cpi
	jr	z,memcp0

	dec	hl
	dec	de

	push	bc
	push	hl
	push	af
	call	crlfh2ab
	ld	a,(hl)
	call	h2aslsh
	pop	af
	call	h2anib
	pop	hl
	pop	bc
	jr	memcp0

;;
;; MEMDUMP - prompt user and dump memory area
;
memdump:
	call	askfrom
	push	hl
	call	askto
	ex	de,hl
	pop	hl
	;
mdp6:	call	crlfh2ab
	ld	a,l
	call	dmpalib
	push	hl
mdp2:	ld	a,(hl)
	call	h2anib
	call	chkeor
	jr	c,mdp1
	call	spacer
	ld	a,l
	and	$0f
	jr	nz,mdp2
mdp7:	pop	hl
	ld	a,l
	and	$0f
	call	dmpalia
mdp5:	ld	a,(hl)
	ld	c,a
	ld	a,(miobyte)
	bit	5,a			; serial output?
	jr	z,mdp8
	res	7,c
mdp8:	ld	a,c
	cp	$20
	jr	c,mdp3
	cp	$7f			; to protect serial output...
	jr	z,mdp3
	jr	mdp4
mdp3:	ld	c,$2e
mdp4:	call	bbconout
	call	chkbrk
	ld	a,l
	and	$0f
	jr	nz,mdp5
	jr	mdp6
mdp1:	sub	e
	call	dmpalib
	jr	mdp7
;;
;; DMPALIB - beginning align (spacing) for a memdump
dmpalib:
	and	$0f
	ld	b,a
	add	a,a
	add	a,b
;;
;; DMPALIB - ascii align (spacing) for a memdump
dmpalia:
	ld	b,a
	inc	b
alibn:	call	spacer
	djnz	alibn
	ret

;;
;; GOEXEC - execute from user address
;
goexec:
	call	askto
	jp	(hl)

;;
;; PORTIN - input a byte from given port (display it in binary)
;
portin:
	call	askport
	call	outcrlf
	ld	c,l
	in	e,(c)
	call	bindisp
	ret

;;
;; PORTOUT - output a byte to a give port
portout:
	call	askport
	ld	c,l
	push	bc
	call	askdata
	call	outcrlf
	pop	bc
	ld	e,l
	out	(c),e
	ret

;;
;; MEMMOVE - move data in memory
;
memmove:
	call	askfrom
	push	hl
	call	askto
	ex	de,hl
	call	asksize
	ld	c,l
	ld	b,h
	pop	hl
	;
	call	cphlde
	ret	z			; nothing to do
	jr	c,mmback
	ldir
	ret
mmback:
	add	hl,bc
	dec	hl
	ex	de,hl
	add	hl,bc
	dec	hl
	ex	de,hl
	lddr
	ret


;;
;; RWMEM - lets user alter memory content
;
rwmem:
	call	askfrom
rwm01:
	call	outcrlf
	ld	e,8
rwm00:
	ld	a,(hl)
	push	hl
	call	h2aseco
	call	get2hex
	ld	d,l
	pop	hl
	ld	(hl),d
	inc	hl
	ld	c,','
	call	bbconout
	dec	e
	jr	z,rwm01
	jr	rwm00

ouradd	equ	$9000

;;
;; MEMTEST - test ram region
;;
memtest:
	pop	hl			; Identify our page
	push	hl
	ld	a,h
	and	$f0			; logical page
	ld	b,a			; on B
	rrc	b			; move on low nibble
	rrc	b
	rrc	b
	rrc	b
	call	mmgetp			; physical page in A
	ld	(ouradd),a

	call	outcrlf
	ld	e,0			; page count
	ld	c,mmuport
	ld	b,$80			; test page
etloop:
	out	(c),e
	push	de
	ld	hl,$8000
	ld	de,$8fff
mtnxt:	ld	a,(hl)
	push	af
	cpl
	ld	(hl),a
	xor	(hl)
	call	nz,mterr
	pop	af
	ld	(hl),a
	call	chkeor
	jr	c,etpage
	jr	mtnxt
mterr:
	pop	de
	exx
	call	outcrlf
	exx
	ld	a,e
	exx
	call	h2anib
	call	spacer
	exx
	ld	e,a
	call	crlfh2ab
	call	bindisp
	jr	etexi
etpage:
	pop	de
etpag1:	inc	e
	ld	a,e
	call	etprpg
	ld	a,(ouradd)
	cp	e
	jr	z,etpag1
	ld	a,(hmempag)
	cp	e
	jr	nz,etloop
	call	outcrlf

etexi:	ld	e,$08		; reset page
	ld	c,mmuport
	ld	b,$80
	out	(c),e
	ret

etprpg:
	push	bc
	push	de
	push	hl
	ld	hl,$0000
	ld	de,$0004
	inc	a
	ld	b,a
etprpg1:
	add	hl,de
	djnz	etprpg1
	ld	c,SI_B2D
	ld	e,BD_ZERO
	call	bbsysint
	ld	c,cr
	call	bbconout
	pop	hl
	pop	de
	pop	bc
	ret

;;
;; BINDISP - display E in binary form
;
bindisp:
	ld	b,$08
bdnxt:	ld	a,e
	rlca
	ld	e,a
	ld	a,$18
	rla
	ld	c,a
	call	bbconout
	djnz	bdnxt
	pop	de
	ret
;;
;; DOPROMPT - display prompt and wait for cmd key (uppercase)
;
doprompt:
	call	mprompt
;; get a char in uppercase, and display too...
dogetchr:
	call	getcup
coutch:	push	bc
	ld	c,a
	call	bbconout
	ld	a,c
	pop	bc
	ret

;; test user break
chkbrk:
	call	chkeor
	jp	c,usrcmd
	call	bbconst
	or	a
	ret	z
	jp	usrcmd

;;
;; inc HL and do a 16 bit compare between HL and DE
chkeor:
	inc	hl
	ld	a,h
	or	l
	scf
	ret	z
	ld	a,e
	sub	l
	ld	a,d
	sbc	a,h
	ret

;
;; User command reject string
urestr:
	db	" **",0
;
;; TOGGLEIO - toggle i/o on video/serial
toggleio:
	ld	hl,miobyte
	bit	5,(hl)
	jr	z,togpr
	res	5,(hl)
	jr	togju
togpr:	set	5,(hl)
togju:	jp	ugreet

;;
;; MATHHLDE - perform 16 bit add & sub between HL and DE
;
mathhlde:
	call	inline
	defb	" HL: ",0
	call	get4hex
	push	hl
	call	inline
	defb	" DE: ",0
	call	get4hex
	ex	de,hl
	call	inline
	defb	" = ",0
	call	inline
	defb	"HL+DE: ",0
	pop	hl
	push	hl
	add	hl,de
	call	h2a
	call	inline
	defb	" HL-DE: ",0
	pop	hl
	or	a
	sbc	hl,de
	call	h2a
	jp	outcrlf

;;
;; Select rom image and run immediately
;;
selrom:
	ld	c,SI_ROMSEL
	call	bbsysint
	ld	e,l
	ld	c,SI_ROMRUN
	call	bbsysint
	ret

;;
;; cp HL,DE
cphlde:
	or	a
	sbc	hl,de
	add	hl,de
	ret

;;
;; HL2ASC - convert & display HL 2 hex ascii
crlfh2a:
	call	outcrlf
h2a:	ld	a,h
	call	h2anib
	ld	a,l
h2anib:	push	af
	rrca
	rrca
	rrca
	rrca
	call	h2a00
	pop	af
h2a00:	call	nib2asc
	call	bbconout
	ret

; entry point to display HEX and a ":"
h2aseco:
	call	h2anib
	ld	c,':'
	jr	prsign

; entry point to display HEX and a "-"
h2aslsh:
	call	h2anib
	ld	c,'-'
	jr	prsign

mprompt:
	ld	c,'-'
prsign:
	call	bbconout
	ret

;;
;; HL2ASCB - convert & display HL 2 ascii leave a blank after
crlfh2ab:
	call	crlfh2a
spacer:	ld	c,$20
	call	bbconout
	ret

;;
;;
;; COIUPC- convert reg A uppercase
getcup:
	call	bbconin
	cp	$60
	jp	m,getcup0
	cp	$7b
	jp	p,getcup0
	res	5,a
getcup0:
	ret

;;
;; NIB2ASC convert lower nibble in reg A to ascii in reg C
;
nib2asc:
	and	$0f
	add	a,$90
	daa
	adc	a,$40
	daa
	ld	c,a
	ret

;;
;; emit cr,lf sequence
;;
outcrlf:
	call	inline
	defb	$0d,$0a,0
	ret
;;
;; get 2 hex digit
get2hex:
	push	de
	ld	d,2
	jr	get4he0
;;
;; get 4 hex digit
get4hex:
	push	de
	ld	d,4
get4he0:
	push	bc
	ld	c,SI_EDIT
	ld	e,SE_HEX
	call	bbsysint
	pop	bc
	pop	de
	or	a
	jp	nz,usrcmd
	ret

;;
;; ask for port
askport:
	call	inline
	defb	" Port: ",0
	call	get2hex
	ret

;;
;; ask for data
askdata:
	call	inline
	defb	" Data: ",0
	call	get2hex
	ret

;;
;; ask for data
asksize:
	call	inline
	defb	" Size: ",0
	call	get4hex
	ret

;;
;; ask from
askfrom:
	call	inline
	defb	" From: ",0
	call	get4hex
	ret

;;
;;ask to
askto:
	call	inline
	defb	" To: ",0
	call	get4hex
	ret


;-----------------------------------------------------------------------

ucmdtab:
	defw	toggleio	; (A) alternate serial/video i/o
	defw	bootm		; (B) boot menu
	defw	mathhlde	; (C) sum & subtract HL, DE
	defw	memdump		; (D) dump memory
	defw	kecho		; (E) keyboard echo
	defw	fillmem		; (F) fill memory
	defw	goexec		; (G) go exec a sub
	defw	cmdhelp		; (H) help
	defw	portin		; (I) port input
	defw	ucprompt	; (J) n/a
	defw	boot		; (K) restart system
	defw	ucprompt	; (L) n/a
	defw	memmove		; (M) move memory block
	defw	ucprompt	; (N) n/a
	defw	portout		; (O) output to a port
	defw	ucprompt	; (P) n/a
	defw	ucprompt	; (Q) n/a
	defw	selrom		; (R) select rom image
	defw	rwmem		; (S) alter memory
	defw	memtest		; (T) test ram region
	defw	pupload		; (U) parallel Upload
	defw	memcomp		; (V) compare mem blocks
	defw	pdnload		; (W) parallel DoWnload
	defw	ucprompt	; (X) n/a
	defw	ucprompt	; (Y) n/a
	defw	ucprompt	; (Z) n/a
;;

mhelp:	defb	cr,lf,lf
	defb	"A - Alternate console",cr,lf
	defb	"B - Boot menu",cr,lf
	defb	"C - HL/DE sum, subtract",cr,lf
	defb	"D - Dump memory",cr,lf
	defb	"E - Echo test",cr,lf
	defb	"F - Fill memory",cr,lf
	defb	"G - Go to execute address",cr,lf
	defb	"H - This help",cr,lf
	defb	"I - Input from port",cr,lf
	defb	"K - Reinit system",cr,lf
	defb	"M - Move memory",cr,lf
	defb	"O - Output to port",cr,lf
	defb	"R - Select ROM image",cr,lf
	defb	"S - Alter memory",cr,lf
	defb	"T - Test ram",cr,lf
	defb	"U - Upload from parallel",cr,lf
	defb	"V - Compare memory",cr,lf
	defb	"W - Download to parallel"
	defb	cr,lf,0
;;
sdlpr:	defb	"Download",':',0
strwait:
	defb	"Waiting host...  ",0
strload:
	defb	"loading at: ",0
;
mverstr:
	if not bbdebug
	defb	"Z80 DarkStar",cr,lf
	defb	"Banked monitor  v",monmaj,'.',monmin,'.',subrel,cr,lf,0
	else
	defb	"Z80 DarkStar",cr,lf
	defb	"Banked monitor  v",monmaj,'.',monmin,'.',subrel," [experimental]",cr,lf,0
	endif
	; Boot messages
msetsha:
	defb	"BIOS image shadowed.",cr,lf,0
mtx:	defb	"Tx",' ',0
mrx:	defb	"Rx",' ',0
mfol:	defb	':',' ',0
mnot:	defb	"fail",0
mrdy:	defb	"ok",' ',0
mpron:	defb	"un"
mprof:	defb	"locked",0
mepee:	defb	"29EE020",' ',0
mepxe:	defb	"29xE020",' ',0
mepc:	defb	"29C020",' ',0
mepuns:	defb	"Unsupported",' ',0
msysres:
 	defb	"Initializing...",cr,lf,lf
	defb	"Ram .................: ",cr,lf
	defb	"Rom .................: ",cr,lf
	defb	"IDE disk ............: ",cr,lf
	defb	"Serial console ......: ",cr,lf
	defb	"Serial aux ..........: ",cr,lf
	defb	"Eeprom type .........: ",cr,lf
	defb	"Real Time Clock......: ",cr,lf
	defb	0

mbmenu:	defb	cr,lf
; 	defb	"BOOT from:",cr,lf,lf
; 	defb	" A-B = Floppy",cr,lf
; 	defb	" C-N = IDE Volume",cr,lf
; 	defb	" O-P = Virtual on parallel",cr,lf
; 	defb	"<RET> = Monitor prompt",cr,lf,lf
	defb	'-','>',0
mhderr:	defb	"No Volume, "
mbterr:	defb	"Boot error!",cr,lf,0
mbtnbl:	defb	"No bootloader!",cr,lf,0

;-------------------------------------
; Needed modules


;-------------------------------------
bmfillo:
	defs	zdsmntr + $0bff - bmfillo
; bmfilhi:
; 	defb	$00
;
; ; end of code - this will fill with zeroes to the end of
; ; the non-resident image

if	mzmac
wsym bootmonitor.sym
endif
;
;
	end
;
