;	NAME	'Dallas DS-1302 Trickle chargher displaty utility'

; link to DarkStar Monitor symbols...
rsym bios.sym


CR	EQU	0DH
LF	EQU	0AH
CMDLN	EQU	$0080		;

	ORG TPA

BEGIN:	LD	(STACK),SP
	LD	SP,STACK
	;
	CALL	GDMRN
	DB	CR,LF,'ZDS DS1302 v 1.0',CR,LF,'$'
GDMRN:	POP	DE
	LD	C,9
	CALL	BDOS
	;
	DI
; 	CALL	STTCK
	CALL	RDTCK
	EI
	CALL	MDISR
	DB	'Trickle Chargher STATUS:',CR,LF,'$'
MDISR:	POP	DE
	LD	C,9
	CALL	BDOS
	LD	HL,REGBUF
	LD	E,(HL)		; not needed in effect, since
				; E already contains ds1302 register value
	CALL	BINDISP		; display reg E
	CALL	MNEWL
	DB	CR,LF,'$'
MNEWL:	POP	DE
	LD	C,9
	CALL	BDOS

EXIT:	LD	SP,(STACK)	;   restore Stack Pointer
	RET			;    and back to OS


;;
;; Read trickle charger register
;;
RDTCK:	CALL	COPEN			; Open the Clock
	LD	A,10010001B		; select write to trickle charger reg.
	CALL	WR1302
	LD	D,1			; one byte to read
	LD	HL,REGBUF		; where to place copy
	CALL	RDDSRE			; read in register
	RET

REGBUF:	DS	1			; DS1302 register buffer

	DS	64			; Stack Space
STACK:	DS	2

;; EOF
