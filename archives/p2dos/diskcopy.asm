;
; disk test
;

rsym bios.sym

;DSELBF	EQU	$004E
;CR	EQU	$0D
;--------------------
	org $0100


START:	JP	RECOVER

SCRTCH:	DEFS	128			; local stack area
SPAREA	EQU	$

	; include routines to print ascii values
include ../ASM/bit2040.asm

;START:	jp	STEP4
;
NDRIVE	EQU	1
SECSIZ	EQU	512
SECNUM	EQU	11
NTRACK	EQU	160
NTRYS	EQU	5

BS	EQU	08H		;ASCII 	backspace
TAB	EQU	09H		;	tab
LF	EQU	0AH		;	line feed
FORMF	EQU	0CH		;	form feed
CR	EQU	0DH		;	carriage return
ESC	EQU	1BH		;       escape
CTLX	EQU	'X' and	1fh	;	control	x - delete line
CTLC	EQU	'C' and	1fh	;	control	c - warm boot
EOF	EQU	'Z' and	1fh	;	control	z - logical eof
QUOTE	EQU	27H		;	quote
TILDE	EQU	7EH		;	tilde
DEL	EQU	7FH		;	del

BDOSA	EQU	5
CTLC	EQU	'C' and	1fh	;	control	c - warm boot


STMSG1:	defb	" Trk.: ",0
STMSG2:	defb	" Sec.: ",0
RSTMOK:	defb	"  Read -> ",0
WSTMOK:	defb	" Write -> ",0
VSTMOK:	defb	"Verify -> ",0
ESTMOK:	defb	"ERROR! -> ",0
SGON:	DEFB	"Z80 DarkStar - Fast Diskette copy program.",CR,LF
	DEFB	"(c) 2006 Piergiorgio Betti <pbetti@lpconsul.net>",CR,LF
MCRLF:	DEFB	CR,LF,0
SDCHO:	DEFB	"Select SOURCE drive : ",$00
DDCHO:	DEFB	"Select DESTINATION drive : ",$00
MEQUAL:	DEFB	"** Source and destination cannot be the same.",CR,LF,0
MCONF:	DEFB	CR,LF,"Press any key to start, CTRL+C to abort.  ",0
MBFSZ:	DEFB	"Buffer size   : ",0
MTRSZ:	DEFB	"Stored tracks : ",0
MCOMP:	DEFB	CR,LF,"Copy complete.",CR,LF,0

;
;       begin the load operation
;
RECOVER:
	LD	SP,SPAREA		; init stack
	LD	HL,SGON
	CALL	ZSDSP
	LD	A,(TMPBYTE)
	BIT	7,A
	JR	Z,RAFSVD
	LD	A,1
	LD	(RAFS),A		; save RAF status
RAFSVD:
	LD	A,(TMPBYTE)
	RES	7,A
	LD	(TMPBYTE),A		; ... and clear it
; 	CALL	TTYI
; 	CP	CTLC
; 	JP	Z,EXIT

	; get source drive
DRVID:	LD	HL,SDCHO		; ask for drive id
	CALL	ZSDSP			;
	CALL	GCHR			;
	CP	$03			; CTRL+C ?
	JP	Z,EXIT			; exit
	CP	'A'			; is A -> P ?
	JP	M,DRVID			;
	CP	'Q'			;
	JP	P,DRVID			; no
	SUB	'A'			; makes number
	LD	(RDSK),A
	CALL	LFEED

	; get destination drive
DDRVID:	LD	HL,DDCHO		; ask for drive id
	CALL	ZSDSP			;
	CALL	GCHR			;
	CP	$03			; CTRL+C ?
	JP	Z,EXIT			; exit
	CP	'A'			; is A -> P ?
	JP	M,DDRVID			;
	CP	'Q'			;
	JP	P,DDRVID		; no
	SUB	'A'			; makes number
	LD	(DDSK),A
	CALL	LFEED
	LD	HL,DDSK
	LD	A,(RDSK)		; are equals ?
	CP	(HL)
	JR	NZ,CONFIRM
	LD	HL,MEQUAL
	CALL	ZSDSP
	JR	DRVID

CONFIRM:
	LD	HL,MCONF
	CALL	ZSDSP
	CALL	GCHR			;
	CP	$03			; CTRL+C ?
	JP	Z,EXIT			; exit
	CALL	LFEED
	CALL	LFEED

	; how many blocks ?
	LD	DE,ENDSTO
	LD	HL,(6)			; bios base
	SBC	HL,DE			; available space in HL

	PUSH	HL			; save in stack
	LD	HL,MBFSZ
	CALL	ZSDSP
	POP	BC			; move size in BC
	PUSH	BC			; saves again
	CALL	BN2A16			;
	LD	HL,OVAL16		;
	CALL	ZSDSP			;
	CALL	LFEED
	POP	BC			; re-get
	LD	DE,SECSIZ*SECNUM	; block (track) size
	CALL	LDIV16			; calculate
	LD	A,C
	LD	(ABLK),A
	CALL	BIN2A8
	LD	HL,MTRSZ
	CALL	ZSDSP
	LD	HL,OVAL16		;
	CALL	ZSDSP			;
	CALL	LFEED
	CALL	LFEED

	; read start
	LD	HL,0			; init read counters
	LD	(RTRK),HL
	LD	(DTRK),HL
	LD	(VTRK),HL
	INC	HL
	LD	(RSEC),HL
	LD	(DSEC),HL
	LD	(VSEC),HL
	LD	HL,ENDSTO
	LD	(RDMA),HL
	XOR	A
	LD	(CBLK),A

STEP1:
	CALL	TTYQ
	CP	CTLC
	JP	Z,EXIT

	LD	BC,(RDMA)
	CALL	SETSEK
	CALL	READHST

	CALL	RAVMSG
STEP2:
; 	CALL	GCHR
	LD	HL,(RDMA)	; next DMA addr.
	LD	DE,SECSIZ
	ADD	HL,DE
	LD	(RDMA),HL

	LD	HL,RSEC
	INC	(HL)
	LD	A,(RSEC)
	CP	SECNUM+1	; EOT ?
	JR	Z, STEP3	; NXT TRK
	JR	STEP1		; NXT SEC
STEP3:
	LD	HL,RTRK		; EOD ?
	INC	(HL)
	LD	A,(RTRK)
	CP	NTRACK
	JR	Z,WRITEIMG

	LD	HL,CBLK		; buffer full ??
	INC	(HL)
	LD	A,(ABLK)
	CP	(HL)
	JR	Z,WRITEIMG

	LD	A,1
	LD	(RSEC),A	; LOOP
	JP	STEP1

	; write start
WRITEIMG:
; 	CALL	LFEED
; 	CALL	WBGSAV
	LD	A,NTRYS
	LD	(TRYC),A
	LD	HL,ENDSTO
	LD	(RDMA),HL
	XOR	A
	LD	(CBLK),A
WRTRET:
	LD	A,1
	LD	(DSEC),A	; LOOP
	CALL	WBGSAV
STEP4:
	CALL	TTYQ
	CP	CTLC
	JP	Z,EXIT

	LD	BC,(RDMA)
	CALL	WSETSEK
	CALL	WRITEHST

	CALL	WAVMSG
STEP5:
; 	CALL	GCHR
	LD	HL,(RDMA)	; next DMA addr.
	LD	DE,SECSIZ
	ADD	HL,DE
	LD	(RDMA),HL

	LD	HL,DSEC
	INC	(HL)
	LD	A,(DSEC)
	CP	SECNUM+1	; EOT ?
	JR	Z, STEP6	; NXT TRK
	JR	STEP4		; NXT SEC
STEP6:
	CALL	VERIFY
	OR	A
	JR	NZ,WRTRET
	LD	HL,DTRK		; EOD ?
	INC	(HL)
	LD	A,(DTRK)
	CP	NTRACK
	JR	Z,CPYCMP

	LD	HL,CBLK		; buffer empty ??
	INC	(HL)
	LD	A,(ABLK)
	CP	(HL)
	JR	Z,NXTBUF

	; CALL CHKTRK QUI!!!!!!!!
	LD	A,1
	LD	(DSEC),A	; LOOP
	CALL	WBGSAV
	JP	STEP4

	; perform another cycle
NXTBUF:
; 	CALL	VERIFY
	LD	HL,ENDSTO
	LD	(RDMA),HL
	XOR	A
	LD	(CBLK),A
	LD	A,1
	LD	(RSEC),A	; LOOP
; 	CALL	LFEED
	JP	STEP1

CPYCMP:
; 	CALL	VERIFY
	LD	HL,MCOMP
	CALL	ZSDSP
	JP	EXIT1
RECOVEND:
	JP	EXIT

LFEED:
	LD	HL,MCRLF
	CALL	ZSDSP
	RET

VERIFY:
	LD	HL,(BDMA)
	LD	(RDMA),HL
; 	XOR	A
; 	LD	(CBLK),A
	LD	A,1
	LD	(VSEC),A	; LOOP
VSTEP1:
	CALL	TTYQ
	CP	CTLC
	JP	Z,EXIT

	LD	BC,BUFDMA
	CALL	VSETSEK
	CALL	READHST

	LD	HL,BUFDMA
	LD	DE,(RDMA)
	LD	BC,SECSIZ
CTBUF:	LD	A,(DE)
	CPI
	JR	NZ,CTNOK
	INC	DE
	LD	A,B
	OR	C
	JR	NZ,CTBUF
	JR	VSTEP2
CTNOK:
	LD	HL,ESTMOK
	CALL	VAVMS1
	LD	C,LF
	CALL	TTYO
	CALL	LFEED
	LD	A,(TRYC)
	DEC	A
	JP	Z,EXIT
	LD	(TRYC),A
	CALL	WBGRST
	LD	A,1
	RET

VSTEP2:
	CALL	VAVMSG
; 	CALL	GCHR
	LD	HL,(RDMA)	; next DMA addr.
	LD	DE,SECSIZ
	ADD	HL,DE
	LD	(RDMA),HL

	LD	HL,VSEC
	INC	(HL)
	LD	A,(VSEC)
	CP	SECNUM+1	; EOT ?
	JR	Z, VSTEP3	; NXT TRK
	JR	VSTEP1		; NXT SEC
VSTEP3:
	XOR	A
	RET
; 	LD	HL,VTRK		; EOD ?
; 	INC	(HL)
; 	LD	A,(VTRK)
; 	CP	NTRACK
; 	RET	Z
;
; 	LD	HL,CBLK		; buffer full ??
; 	INC	(HL)
; 	LD	A,(ABLK)
; 	CP	(HL)
; 	RET	Z
;
; 	LD	A,1
; 	LD	(VSEC),A	; LOOP
; 	JP	VSTEP1


SETSEK:
; 	LD	BC,BUFDMA		; set DMA to buffer
	CALL	BSETDMA
	LD	A,(RDSK)		; set disk
	LD	C,A
	CALL	BSELDSK			; ... hw
	CALL	SELDSK			; ... logical
	LD	BC,(RTRK)		; set track
	CALL	BSETTRK
	LD	A,(RSEC)		; set sector
	DEC	A
	LD	(HSTLGS),A
	RET

WSETSEK:
; 	LD	BC,BUFDMA		; set DMA to buffer
	CALL	BSETDMA
	LD	A,(DDSK)		; set disk
	LD	C,A
	CALL	BSELDSK			; ... hw
	CALL	SELDSK			; ... logical
	LD	BC,(DTRK)		; set track
	CALL	BSETTRK
	LD	A,(DSEC)		; set sector
	DEC	A
	LD	(HSTLGS),A
	RET

WBGSAV:
	LD	A,(DDSK)		; set disk
	LD	(BDSK),A
	LD	BC,(DTRK)		; set track
	LD	(BTRK),BC
	LD	BC,(DSEC)		; set sector
	LD	(BSEC),BC
	LD	BC,(RDMA)		; set sector
	LD	(BDMA),BC
	LD	A,(CBLK)		; set disk
	LD	(BBLK),A
	RET

WBGRST:
	LD	A,(BDSK)		; set disk
	LD	(DDSK),A
	LD	BC,(BTRK)		; set track
	LD	(DTRK),BC
	LD	(VTRK),BC
	LD	BC,(BSEC)		; set sector
	LD	(DSEC),BC
	LD	BC,(BDMA)		; set sector
	LD	(RDMA),BC
	LD	A,(BBLK)		; set disk
	LD	(CBLK),A
	RET

VSETSEK:
; 	LD	BC,BUFDMA		; set DMA to buffer
	CALL	BSETDMA
	LD	A,(DDSK)		; set disk
	LD	C,A
	CALL	BSELDSK			; ... hw
	CALL	SELDSK			; ... logical
	LD	BC,(DTRK)		; set track
	CALL	BSETTRK
	LD	A,(VSEC)		; set sector
	DEC	A
	LD	(HSTLGS),A
	RET

RAVMSG:
	LD	HL,RSTMOK
	CALL	ZSDSP			;
	LD	HL,STMSG1		; inform user about progress
	CALL	ZSDSP			;
	LD	A,(RTRK)		; track
	LD	C,A			;
	CALL	BIN2A8			;
	LD	HL,OVAL16		;
	CALL	ZSDSP			;
	LD	HL,STMSG2		;
	CALL	ZSDSP			;
	LD	A,(RSEC)		; side
	LD	C,A			;
	CALL	BIN2A8			;
	LD	HL,OVAL16		;
	CALL	ZSDSP			;
	LD	C,' '
	CALL	TTYO
	LD	C,CR			;
	CALL	TTYO			; at beginning of line
	RET

WAVMSG:
	LD	HL,WSTMOK
	CALL	ZSDSP			;
	LD	HL,STMSG1		; inform user about progress
	CALL	ZSDSP			;
	LD	A,(DTRK)		; track
	LD	C,A			;
	CALL	BIN2A8			;
	LD	HL,OVAL16		;
	CALL	ZSDSP			;
	LD	HL,STMSG2		;
	CALL	ZSDSP			;
	LD	A,(DSEC)		; side
	LD	C,A			;
	CALL	BIN2A8			;
	LD	HL,OVAL16		;
	CALL	ZSDSP			;
	LD	C,' '
	CALL	TTYO
	LD	C,CR			;
	CALL	TTYO			; at beginning of line
	RET

VAVMSG:
	LD	HL,VSTMOK
VAVMS1:	CALL	ZSDSP			;
	LD	HL,STMSG1		; inform user about progress
	CALL	ZSDSP			;
	LD	A,(DTRK)		; track
	LD	C,A			;
	CALL	BIN2A8			;
	LD	HL,OVAL16		;
	CALL	ZSDSP			;
	LD	HL,STMSG2		;
	CALL	ZSDSP			;
	LD	A,(VSEC)		; side
	LD	C,A			;
	CALL	BIN2A8			;
	LD	HL,OVAL16		;
	CALL	ZSDSP			;
	LD	C,' '
	CALL	TTYO
	LD	C,CR			;
	CALL	TTYO			; at beginning of line
	RET

MTRM:	DEFB	CR,LF,CR,LF,"*** TERMINATED...",CR,LF,0
EXIT:
	LD	HL,MTRM
	CALL	ZSDSP
EXIT1:
	LD	A,(RAFS)
	OR	A
	JP	Z,$0000
	LD	A,(TMPBYTE)
	SET	7,A
	LD	(TMPBYTE),A
	JP	$0000

GCHR:
	CALL	TTYI			; take from console
	AND	$7F			;
	CP	$60			;
	JP	M,GCDSP			; verify alpha
	CP	$7B			;
	JP	P,GCDSP			;
	RES	5,A			; convert to uppercase
GCDSP:	PUSH	BC			;
	LD	C,A			;
	CALL	TTYO			;
	LD	A,C			;
	POP	BC			;
	RET				;


ZSDSP:	LD	A,(HL)			; pick char pointed by HL
	OR	A			; is the terminating NUL ?
	RET	Z			; yes
	PUSH	HL			; no
	LD	C,A			;
	CALL	TTYO			; display it
	POP	HL			;
	INC	HL			;
	JP	ZSDSP			;

TTYO:
	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	E,C
	LD	C,2
	CALL 	BDOSA
	POP	HL
	POP	DE
	POP	BC
	POP	AF
	RET

TTYI:
	PUSH	BC
	PUSH	DE
	PUSH	HL
TTYI00:	LD	C,6
	LD	E,0FFH
	CALL 	BDOSA
	AND	7FH
	JR	Z,TTYI00
	POP	HL
	POP	DE
	POP	BC
	RET
TTYQ:
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	C,11
	CALL	BDOSA
	AND	A
	LD	C,6
	LD	E,0FFH
	CALL	NZ,BDOS
	POP	HL
	POP	DE
	POP	BC
	AND	7FH
	RET

;;
;; DIV16 - 16 BY 16 BIT DIVISION
;;
;; in BC = dividend
;; in DE = divisor
;; ----
;; out BC = quotient
;; out HL = remainder
LDIV16:	LD	A,B
	LD	B,16
	LD	HL,0
LDIVLO:	RL	C
	RLA
	ADC	HL,HL
	SBC	HL,DE
	JR	NC,$+3
	ADD	HL,DE
	CCF
	DJNZ	LDIVLO
	RL	C
	RLA
	LD	B,A
	RET

ENDTXT	EQU	$

RDSK:	DEFB	NDRIVE
DDSK:	DEFB	0
BDSK:	DEFS	1
DSEC:	DEFW	1
RSEC:	DEFW	1
VSEC:	DEFW	1
BSEC:	DEFS	2
RTRK:	DEFW	0
DTRK:	DEFW	0
VTRK:	DEFW	0
BTRK:	DEFS	2
ABLK:	DEFB	0
CBLK:	DEFB	0
BBLK:	DEFS	1
RDMA:	DEFW	0
BDMA:	DEFS	2
RAFS:	DEFB	0
TRYC:	DEFB	NTRYS
BUFDMA:	DEFS	SECSIZ

ENDSTO	EQU	$


	END
