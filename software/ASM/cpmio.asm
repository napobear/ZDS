
; 	.Z80
; 	ASEG

;----------------------------------------------------------------
;	     This is a module in the ASMLIB library.
;
; 		        CP/M I/O Drivers
;
; This is the I/O driver module of ASMLIB and has ALL the I/O routines
; for the system (EXCEPT from line input). The routines are.
;
; COE	Send accumulator to console.
; CIE   Get console into accumulator. No echo.
; CST   Get console status, 00 = no character there.
; LOE   Send accumulator to list device.
; LST   Get list device status.
; IONUM Get the number of the I/O driver, for later identification.
;
;			Written     	R.C.H.     22/10/83
;			Last Update	R.C.H.	   23/02/84
;
;----------------------------------------------------------------
; 	NAME	'CPMIO'
; ;
; 	PUBLI	C	COE,CIE,CST,LOE,LST,IONUM
; ;
; 	MACLI	B	Z80
;

IF	ZDSDIRECTIO

COE:
	PUSH	BC
	LD	C,A
	CALL	BBCONOUT
	POP	BC
	RET

CIE:
	PUSH	HL
	PUSH	BC
	PUSH	DE
	CALL	BBCONIN
	POP	DE
	POP	BC
	POP	HL
	RET

CST:
	CALL	BBCONST
	AND	$7F
	RET

LOE:
	RET

LST:
	RET

BELL:
	RET
; 	JP	IOCBEL

ELSE

BDOS	EQU	5
NUM	EQU	01		; 01 = CPMIO i/o driver module
INSOFF	EQU	6		; Bios table offset from entry 00
OTSOFF	EQU	9
STSOFF	EQU	3
;
IONUM:
	LD	L,NUM
	RET			; The i/o identification number
;
;****************************************************************
; 		   CP/M    I/O drivers. 			*
; 	     Send the accumulator to the screen			*
;****************************************************************
;
COE:
	PUSH	HL
	PUSH	BC
	PUSH	DE		; save all registers
	PUSH	AF		; Save the character that is sent
	LD	C,A		; Load the character to be sent
	LD	DE,OTSOFF	; input offset
	LD	HL,RETADR1
	JR	GETSCONSCOM
;
;----------------------------------------------------------------
;     Send the accumulator character to the list device
;----------------------------------------------------------------
;
LOE:
	PUSH	AF
	PUSH	HL
	PUSH	BC
	PUSH	DE
	LD	E,A		; load the character to print
	LD	C,5		; print list function
	CALL	BDOS
	POP	DE
	POP	BC
	POP	HL
	POP	AF
	RET
;
;----------------------------------------------------------------
;           Get a character from the console
;----------------------------------------------------------------
;
CIE:
	PUSH	HL
	PUSH	BC
	PUSH	DE		; save all registers
	LD	DE,INSOFF	; input offset
	LD	HL,RETADR2
;
GETSCONSCOM:
	PUSH	HL		; Load a return address
	LD	HL,(1)		; get the warm boot vector
	ADD	HL,DE		; Now hl = bios table address to use
	JP	(HL)		; do the routine
;
; Return here to restore all registers
RETADR1:
	POP	AF
; To skip PSW, return here
RETADR2:
	POP	DE
	POP	BC
	POP	HL
	OR	A		; Set flags, clear carry
	RET
;
;----------------------------------------------------------------
; Get the console status. 00 = no character all else = read.
;----------------------------------------------------------------
;
CST:	; Get the status
	PUSH	HL
	PUSH	BC
	PUSH	DE		; save all registers
	LD	DE,STSOFF	; input offset
	LD	HL,RETADR2	; load the required return address
	JR	GETSCONSCOM	; read the console common code
;
;----------------------------------------------------------------
; Get the list output status. If = 00 then no character may be
; sent to the device.
;----------------------------------------------------------------
;
LST:
	LD	A,0FFH		; Not supported yet
	RET			; return the device as ready
;
; 	END

ENDIF
