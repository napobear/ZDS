; 	TITLE	"DateStamper (tm) Stamp Module for ZSDOS"
;***************************************************************************
;  Z D S								   *
;--------------------------------------------------------------------------*
; Copyright (C) 1988  by Cameron W. Cotrill and Harold F. Bower		   *
;--------------------------------------------------------------------------*
; This module replaces DateStamper V2.30 in ZSDOS systems.  It provides	   *
; support for ZSDOS Functions 102 thru 105.  To simplify the tie-ins with  *
; ZSDOS, this module is "Dirty" - It assumes addresses inside of ZSDOS.    *
;									   *
; The loader for this routine needs to place the address of ZSDOS (Page    *
; Boundary) in the offset entry in JTABLE.  All ZSDOS addresses are dynami-*
; cally calculated from this address.  BIOS is assumed to be 0E00H above   *
; ZSDOS, but this may be changed by using the EQUate.			   *
;									   *
; This program may be used only by licensed Plu*Perfect DateStamper Users! *
;	Agreement pending with Plu*Perfect Systems			   *
;									   *
; The author wishes to acknowledge the numerous suggestions and helpful	   *
; hints from Bridger Mitchell of Plu*Perfect Systems.			   *
;									   *
; Revision:								   *
;	1.0 - Initial Release						   *
;***************************************************************************

; rsym zsdos.sym

; VER	EQU	12		; Release Version

TIMOFF	EQU	0016H		; Time Vector group offset
LSTOFF	EQU	0018H		; Stamp Last Accessed routine addr
CREOFF	EQU	001AH		; Stamp Create Time routine addr
MODOFF	EQU	001CH		; Stamp Modify Time routine addr
GSTOFF	EQU	001EH		; Get Stamp routine addr
SSTOFF	EQU	0020H		; Set Stamp routine addr

DPBOF	EQU	003CH		; Offset to DPB copy inside ZSDOS
GETCDM	EQU	0647H		; Offset to return current drive bit
MBERR	EQU	0327H		; Offset to DOS Error Message
RECDIR	EQU	0052H		; Offset to current DIR record number
SDRVB	EQU	064AH		; Offset to set drive bit routine
STDIR1	EQU	0677H		; Offset to ZSDOS set track and sector
TDFVCT	EQU	0DF8H		; Offset to time/date vector in DOS
ZDPCH1	EQU	04CFH		; Offset to return version patch
ZDPCH2	EQU	061DH		; Offset to first INITDR intercept
ZDPCH3	EQU	0637H		; Offset to second INITDR intercept
STMPZO	EQU	0DEFH		; Offset to patch flag
;----------------------------------------------------------------------
OFBIOS	EQU	0E00H		; Offset of BIOS from ZSDOS
RDSECT	EQU	27H		; Offset in BIOS jump table to Read
WRSECT	EQU	2AH		; Offset in BIOS jump table to Write
SDMOFF	EQU	24H		; Offset in BIOS jump table to set DMA
TDVAL	EQU	91H		; Checksum of !!!TIME&.DAT less attributes
DUMMY	EQU	22H		; Offset of Disable Vector in ZSDOS
UNLOAD	EQU	24H		; Offset of UNLOAD address in ZDS from ZSDOS
TBLOFF	EQU	16H		; Offset of ZSDOS time routine vector table
; STMPZP	EQU	BDOSB+STMPZO	; patch flag address
STMPZP	EQU	BDOSB+ZDPCH1	; patch flag address

ZDSSBAS	EQU	(FCP-ZDSSTSZ)	; where i am

	ORG	ZDSSBAS		; We are at the top of the RCP area

	JP	STCR		; jump table to make stuffs easy in zsdos...
	JP	STUP
	JP	RSTAMP
	JP	WSTAMP
	JP	STLA

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;		S t a m p     C r e a t e
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

STCR:	LD	B,00		; Offset into stamp in B
	JR	STT

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;		S t a m p     U p d a t e
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

STUP:	LD	B,10		; Offset into stamp in B
	JR	STT

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;		S t a m p     A c c e s s
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

STLA:	LD	B,05		; Offset into stamp in B
STT:	CALL	CKPTCH		; check for first call
	LD	(INDEX),A	; Save index into DIR entry
	LD	(STPDMA),HL	; Save user DMA pointer
	LD	C,2		; Show as stamp
	LD	H,0
	ADD	A,3		; Point to no date attribute
	LD	L,A
	ADD	HL,DE		; Point to DIR entry
	BIT	7,(HL)
	LD	A,0FFH		; Prepare error status in case
	RET	NZ		; Don't update if no date attrib
; 	RET			; a do nothing return
	JR	STPSV0

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;     G E T / P U T    S t a m p    R o u t i n e s
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

RSTAMP:	LD	BC,0		; Flag as read
	JR	STPSVC

WSTAMP:	LD	BC,1		; Flag as write
			; And fall thru...

; Stamp Service Routine (Combined Get Stamp and Put Stamp)
; Calling Parameters:
;	A = Index to DIR Entry [00H,20H,40H,60H]
;	B = Offset in Stamp [0,5,10]
;	C = Function [0 = Read, 1=Write, 2=Update]
;	DE= Pointer to DIR Buffer
;	HL= User DMA Address

STPSVC:	CALL	CKPTCH		; check for first call
	LD	(INDEX),A	; Save index into DIR entry
	LD	(STPDMA),HL	; Save user DMA pointer
STPSV0:	LD	(RWCODE),BC	; Save read/write code and Sector offset
	LD	(SECBUF),DE	; Check if !!!TIME&.DAT Exists on the drive
	CALL	GETTDV		; Return current time/date vector in BC
	PUSH	BC		; Save it
	LD	DE,GETCDM
	CALL	VECTOR		; Return vector for current drive in hl
;==	POP	HL
	pop	bc		; [1.1]
	LD	A,H
	AND	B
	LD	H,A
	LD	A,L
	AND	C
	OR	H		; Test if current drive has !!!TIME&.DAT
	JR	Z,SERRO		; ..jump if it doesn't

SECBUF	EQU	$+1
	LD	BC,0000		; Store Sector Buffer adr inline
	CALL	DODMA		; Set DMA to address sector buffer

; It exists, so find first alloc for it (First after DIR)

	LD	DE,RECDIR
	CALL	INDFET		; Get current dir record
				; Calculate Buffer Offset
	XOR	A
	SRL	B
	RR	C		; Divide record by two, lsb to carry
	RRA			; Place in msb of a
	LD	HL,INDEX
	ADD	A,(HL)		; Get offset to stamp in buffer
	RRA			; Divide by 2 (8 stamps/rec)
	LD	(HL),A		; Save index for later
				; Now calculate record number needed
	PUSH	BC		; Save relative record number
	LD	DE,DPBOF+9	; Get dir alloc bitmap from DPB
	CALL	INDFET
	PUSH	BC		; Save bitmap
	LD	DE,DPBOF+3	; Point to block mask in DPB
	CALL	INDFET		; Get into C reg
	INC	C		; Now is number of records per block
	XOR	A		; Cheap zero
	LD	E,C		; Records/block to E
	LD	D,A		; Sign extend
	LD	B,16		; Check all bits
	POP	HL		; Restore bitmap, rel rec on tos
STPSV1:	ADD	HL,HL		; Shift MSB into Carry
	JR	NC,STPSV2	; If bit was a zero
	EX	(SP),HL		; Else get relative record
	ADD	HL,DE		; Add records for this dir block
	EX	(SP),HL		; Back to tos
STPSV2:	DJNZ	STPSV1		; Loop until done
	POP	HL		; now has actual record number
				; Call DSSTS (Set BIOS Track and Sector)
	CALL	RDSEC		; Set Track/Sector and Read
	CALL	CKSUM		; Checksum first 127 bytes of local buffer
	CP	(HL)		; Test against DS's checksum
	JR	NZ,SERRO	; Abort if error
				; Set Pointers for Block Move
	XOR	A		; Clear acc
	LD	D,A		; Word value for D
	LD	B,A		; And B

INDEX	EQU	$+1
	LD	E,00		; INDEX value stored here inline
	LD	HL,(SECBUF)
	ADD	HL,DE		; Now pointing to correct stamp
	LD	C,15		; Size of stamp
	LD	DE,(STPDMA)	; Get user stamp pointer
				; Test for Why we're here
	LD	A,(RWCODE)	; Get Read/Write Code
	AND	A		; Is it get stamp?
	JR	NZ,PUTSTP	; If we're supposed to write
				; Copy Stamp from Local Buff to User DMA
	LDIR			; Move to user DMA
	JR	STPSVX		; ..and exit

; Copy Stamp from User DMA to Local Buff

PUTSTP:	SUB	2		; Is this a simple put?
	JR	Z,UPSTMP	; No, read the clock
	EX	DE,HL		; Swap pointers
PUTS1:	LDIR			; Move new stamp into place
	CALL	CKSUM		; Checksum first 127 bytes of local buffer
	LD	(HL),A		; ..and save checksum in last byte of record

	LD	E,WRSECT	; Do BIOS Write Sector
	INC	C		; ..Flag as non-deferred (0 from ldir -> 01)
	CALL	DOBIOSE		; Write sector to disk

STPSVX:	LD	A,1		; Indicate all is well (OK return)
	DEFB	01H		; ..fall thru the LD  A,FF with a LD  BC,FF3E

; Set Return to Error

SERRO:	LD	A,0FFH		; Set Error condition and restore User DMA
SEXIT:	PUSH	AF		; Save return code

STPDMA	EQU	$+1
	LD	BC,0000		; Get User's DMA addr (stored here inline)
	CALL	DODMA		; ..and restore it
	POP	AF		; Restore return code
	RET			; ..and return to ZSDOS

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;    Read the Clock and place in proper Stamp Field
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

UPSTMP:	LD	D,A		; A reg contains 0
	LD	A,(STOFF)	; Get offset in stamp
	LD	E,A		; Make word length in DE
	ADD	HL,DE		; Point to where to put stamp
	PUSH	HL		; Save target address
	OR	A		; Is it CREATE time?
	JR	NZ,UPSTM0	; ..jump if Not
	LD	B,15		; Else zero entire stamp record
UPSL:	LD	(HL),0
	INC	HL
	DJNZ	UPSL
UPSTM0:	LD	C,D		; Flag as clock read
	LD	DE,TDBUF	; Point to TD buffer
	PUSH	DE
				; Load Clock driver address
	LD	HL,(BDOSB+TIMOFF)
 	CALL	CALLHL		; Fetch the time (may be BIOS)
	POP	HL		; Get buffer start
	POP	DE		; Get stamp address
	DEC	A		; Was it a good clock read?
	JR	NZ,SERRO	; ..Take error exit if not
	LD	BC,5		; Else move 5 bytes
	JR	PUTS1		; ..and finish up

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;    Checksum the first 127 bytes of the Local Buffer
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

CKSUM:	LD	B,127
	LD	HL,(SECBUF)	; Point to buffer start
	XOR	A		; Init checksum to 0
CKSUM1:	ADD	A,(HL)		; Add to checksum
	INC	HL
	DJNZ	CKSUM1		; Loop until done
	RET

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
; Read Sector Number in HL Using BIOS to Current DMA
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

RDSEC:	EX	DE,HL		; Move desired logical record to DE
	LD	BC,STDIR1	; DOS logical record -> track/sector
	LD	HL,(OFFSET)
	ADD	HL,BC		; ZSDOS Stdir1 address now in HL
	CALL	CALLHL		; Set Track/Sector
	LD	E,RDSECT	; Do BIOS Read of Sector
				;..fall thru to READ
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;  C a l l   B I O S   w i t h   E r r o r   T e s t i n g
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

DOBIOSE:
	CALL	DOBIOS		; Do the function
	AND	A		; Was there an error?
	RET	Z		; ..return if no error
	POP	AF		; Else clear return address from stack
	JR	SERRO		; Flag error and return

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
; Indexed Fetch of BC from ZSDOS RAM
;  Called w/ DE=Offset in ZSDOS, Returns BC=Value at Index
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

GETTDV:	LD	DE,TDFVCT	; Time and date vector - commonly used
INDFET:	LD	HL,(OFFSET)
	ADD	HL,DE		; Point to LSB
	LD	C,(HL)
	INC	HL
	LD	B,(HL)		; Get value from RAM
	RET

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;     R e p l a c e m e n t   F u n c t i o n   12
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

NEWF12:	LD	A,E		; See if arg passed
	CP	'D'
ZDPC1T:	CALL	NEWF12		; Gets swapped with DOS code
;--	LD	HL,22H		;   (DOS code swapped)
	RET	NZ		; If DS inquery not used
	LD	H,E		; Set return value
	PUSH	HL
				; Load clock driver address
	LD	HL,(BDOSB+TIMOFF)
	LD	(CLKADR),HL	; set clock addr
	POP	HL
CLKADR	EQU	$+1		; where to place clock driver address
	LD	DE,0		; Address of clock routine
; 	LD	DE,CLK		; Address of clock routine
	RET

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;     C h e c k    f o r    ! ! ! T I M & . D A T
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

SETCHK:	LD	A,0FFH
	LD	(CKDSF),A	; Set flag to check DS
ZDPC2T:	CALL	SETCHK		; This gets swapped with DOS
;--	CALL	SETFCT		;   (DOS code swapped)
	RET

CKDSF	EQU	$+1
CKTDF:	LD	A,00		;   <CKDSF flag stored inline>
	OR	A		; Have we passed this way before?
	JR	Z,ZDPC3T	; ..exit if we have
	INC	A
	LD	(CKDSF),A	; Else clear flag
	LD	BC,0C00H	; Init loop count and checksum
	PUSH	HL		; Get DIR pointer back
CKTDF1:	LD	A,(HL)		; Get char from directory
	AND	7FH		; Mask attributes
	ADD	A,C
	LD	C,A		; Update Checksum
	INC	HL		; bump pointers
	DJNZ	CKTDF1		; And loop
	CP	TDVAL		; Check against !!!TIME&.DAT checksum
	JR	NZ,CKTDFX	; ..exit if no match
	LD	DE,TDFVCT
	CALL	GETTDV		; Get time/date login vector in BC
	PUSH	HL		; Save pointer to MSB of vector
	LD	DE,SDRVB	; Prepare to add this drive to vector
	LD	H,B
	LD	L,C		; Xfer time/date login mask to HL
	CALL	VECTOR		; HL=new time/date vector on return
	POP	DE		; Restore pointer to Vector storage
	EX	DE,HL		; New T/D vector in DE
	LD	(HL),D
	DEC	HL
	LD	(HL),E		; Update the vector in DOS
CKTDFX:	POP	HL
ZDPC3T:	CALL	CKTDF		; Gets swapped with DOS code
;--	CALL	CKSUB		;   (DOS code swapped)
	RET

;.....
; Set DMA address.

DODMA:	LD	E,SDMOFF	; Set offset for BIOS call
				;..and fall thru
;.....
; Do BIOS Call.  Enter with BIOS offset in E, parameter in BC

DOBIOS:	LD	D,OFBIOS/256	; Set BIOS Page address in MSB
VECTOR:	PUSH	HL		; Save caller's HL

OFFSET	EQU	$+1
	LD	HL,BDOSB	; Get ZSDOS base address (stored inline)
	ADD	HL,DE		; Now pointing to BIOS base
	EX	(SP),HL		; Restore HL, vector to TOS
	RET			; ..and execute BIOS function

CALLHL:	JP	(HL)		; And exit to CCP

;Patch ZDS into/out of DOS

INSTA3:	LD	BC,ZDPCH1
	LD	DE,ZDPC1T
	CALL	PATCH
	LD	BC,ZDPCH2
	LD	DE,ZDPC2T
	CALL	PATCH
	LD	BC,ZDPCH3
	LD	DE,ZDPC3T
PATCH:	LD	HL,(OFFSET)
	ADD	HL,BC		; Point to DOS patch point
	LD	B,3		; Every patch is 3 bytes
PATCH1:	LD	C,(HL)		; Fetch first byte from DOS
	LD	A,(DE)
	LD	(HL),A		; Install patch in DOS
	LD	A,C
	LD	(DE),A		; And into ZDS
	INC	HL
	INC	DE		; Bump pointers
	DJNZ	PATCH1		; ..and loop
	RET

; check for ZSDOS patch, first call will always return with an error

CKPTCH:	PUSH	AF
	LD	A,(STMPZP)	; patch flag in zsdos
	CP	21		; patched ?
	JR	NZ,NOPTCH	; ok
	POP	AF		; unload stack from our calls
	POP	AF		; ...done
	CALL	INSTA3		; do patch, will become a RET after...
	LD	A,0FFH		; RET code
	LD	(STMPZP),A	; disable this
	RET			; and ret standard error code
NOPTCH:	POP	AF		; nothing to do
	RET

;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;		R A M    A r e a
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

RWCODE:	DEFB	0		; 0 for read stamp, 1 for write stamp
STOFF:	DEFB	0		; Offset in stamp
TDBUF:	DEFS	6		; Temp storage for date

; 	END
