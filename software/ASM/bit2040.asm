;;
;; Routines for binary to decimal conversion
;;
;; (C) Piergiorgio Betti <pbetti@lpconsul.net> - 2006
;;
;; The active part is taken from:
;; David Barrow - Assembler routines for the Z80
;; CENTURY COMMUNICATIONS LTD - ISBN 0 7126 0506 1
;;


;;
;; BIN2A8 - Convert an 8 bit value to ASCII
;;
;; INPUT	C = Value to be converted
;; OUTPUT	DE = Converted string address
;
BIN2A8: PUSH	HL
	PUSH	AF
	LD	B,0
	LD	(IVAL16),BC
	LD	HL,IVAL16
	LD	DE,OVAL16
	LD	A,1			; one byte conversion
	CALL	LNGIBD
	LD	DE,OVAL16
	POP	AF
	POP	HL
	RET
	;
;;
;; BN2A16 - Convert a 16 bit value to ASCII
;;
;; INPUT	BC = Value to be converted
;; OUTPUT	DE = Converted string address
;
BN2A16: PUSH	HL
	PUSH	AF
	LD	(IVAL16),BC
	LD	HL,IVAL16
	LD	DE,OVAL16
	LD	A,2			; two byte conversion
	CALL	LNGIBD
	LD	DE,OVAL16
	POP	AF
	POP	HL
	RET
	;
;; Generic storage

IVAL16:	DEFS	2
OVAL16:	DEFS	6

;;
;;
;; LNGIBD - Convert long integer of given precision to ASCII
;;
;; INPUT	HL addresses the first byte of the binary value
;;		which must be stored with the low order byte in
;;		lowest memory.
;;		DE addresses the first byte of the destination
;;		area which must be larger enough to accept the
;;		decimal result (2.42 * binary lenght + 1).
;;		A = binary byte lenght (1 to 255)

;;
CVBASE	EQU	10		; CONVERSION BASE
VPTR	EQU	HILO		; STORAGE AREA EQU


HILO:	DEFS	2		; STORAGE AREA

LNGIBD:	LD	C,A
	LD	B,0
	DEC	HL
	LD	(VPTR),HL
	LD	A,-1
	LD	(DE),A
	ADD	HL,BC
	;
NXTMSB:	LD	A,(HL)
	OR	A
	JP	NZ,MSBFND
	DEC	HL
	DEC	C
	JP	NZ,NXTMSB
	;
	EX	DE,HL
	LD	(HL),'0'
	INC	HL
	LD	(HL),0
	RET
	;
MSBFND:	LD	B,A
	LD	A,$80
	;
NXTMSK:	CP	B
	JP	C,MSKFND
	JP	Z,MSKFND
	RRCA
	JP	NXTMSK
	;
MSKFND:	LD	B,A
	PUSH	BC
	LD	HL,(VPTR)
	LD	B,0
	ADD	HL,BC
	AND	(HL)
	ADD	A,$FF
	LD	L,E
	LD	H,D
	;
NXTOPV:	LD	A,(HL)
	INC	A
	JP	Z,OPVDON
	DEC	A
	ADC	A,A
	;
	CP	CVBASE
	JP	C,NOCOUL
	SUB	CVBASE
NOCOUL:	CCF
	;
	LD	(HL),A
	INC	HL
	JP	NXTOPV
	;
OPVDON:	JP	NC,EXTDON
	LD	(HL),1
	INC	HL
	LD	(HL),-1
	;
EXTDON:	POP	BC
	LD	A,B
	RRCA
	JP	NC,MSKFND
	DEC	C
	JP	NZ,MSKFND
	;
	; REVERSE DIGIT ORDER. ADD ASCII DIGITS HI-NIBBLES
	LD	(HL),0
	;
NXTCNV:	DEC	HL
	LD	A,L
	SUB	E
	LD	A,H
	SBC	A,D
	RET	C
	;
	LD	A,(DE)
	OR	$30
	LD	B,A
	LD	A,(HL)
	OR	$30
	LD	(HL),B
	LD	(DE),A
	;
	INC	DE
	JP	NXTCNV

;-----------------------------------------------
