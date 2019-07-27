
	.z80
	;aseg

	;subttl	common file for basic interpreter
	;.sall	

conto	defl	15		;character to supress output (usually control-o)
dbltrn	defl	0		;for double precision transcendentals
	if	0	

	.PRINTX	/EXTENDED/


	.PRINTX	/LPT/

	.PRINTX	/CPM DISK/


	.PRINTX	/Z80/

	.PRINTX	/FAST/

	.PRINTX	/5.0 FEATURES/

	.PRINTX	/ANSI COMPATIBLE/
	endif	

clmwid	defl	14		;make comma columns fourteen characters
datpsc	defl	128		;number of data bytes in disk sector
linln	defl	80		;terminal line length 
lptlen	defl	132
buflen	defl	255		;long lines
namlen	defl	40		;maximum length name -- 3 to 127

numlev	defl	0*20+19+2*5	;number of stack levels reserved
				;by an explicit call to getstk

strsiz	defl	4

strsiz	defl	3
numtmp	defl	3		;number of string temporaries

numtmp	defl	10

md.rnd	defl	3		;the mode number for random files
md.sqi	defl	1		;the mode number for sequential input files
				;never written into a file
md.sqo	defl	2		;the mode for sequential output files
				;and program files
cpmwrm	defl	0		;cp/m warm boot addr
cpment	defl	cpmwrm+5	;cp/m bdos call addr
	cseg	
trurom	defl	0
	page	
	title	dskcom - - common routines for disk basics

	extrn	clsfil,conint,datofs,derbfn,derrpe,error,filou3,chrgtr,curlin
	extrn	indskb,indskc,nmlofs,prgfil,scrtch,snerr
	extrn	frmeql,buf
	extrn	strlt3,derfov
	extrn	datofc,derbfm,dirtmp,doasig,docnvf,dsctmp,errfdr,fcerr
	extrn	filpt1,filptr,fin,finbck,finprt,frcstr,frestr,fretop
	extrn	frmevl,getbyt,getspa,gone,gtbytc,gtmprt,inchri,letcon
	extrn	linker,rlist,lstfre,main,maxfil,newstt,nmlofc,omerr
	extrn	ptrfil,ptrget,putnew,ready,runc
	extrn	sccptr

	extrn	savstk,strini,txttab,valtyp,vartab,vmovfm,vmovmf,endcon
	extrn	getypr,synchr,dcompr
	public	clsall,filfrm,filidx,filscn,field,prgfli,filind
	public	filinp,filget,mki$,mks$,mkd$,cvi,cvs,cvd
	public	dline,prgfl2,lrun,load,prgfin,merge,dirdo,save,close
	public	okgetm
	public	rset,lset
	public	binpsv
	extrn	prosav,prolod
	extrn	proflg
; revision history
;4/23/78	pga	allow # on close
;
;8/6/79  pga	if ^c on mbasic foo, dont return to system. see 'NOTINI'
;6/27/80	pga	fix input#1,d# so it uses findbl instead of fin
;		and thus avoids losing significance.
;
;%
	;subttl	filinp and filget -- scan a file number and setup ptrfil

filinp:	ld	c,md.sqi	;must be sequential input
filget:	cp	'#'		;number sign there?
	ret	nz		;no, not disk reader
	push	bc		;save expected mode
	call	filscn		;read and get pointer
	pop	de		;[e]=file mode
	cp	e		;is it right?
	jp	z,gdfilm	;good file mode
	cp	md.rnd		;allow stuff with random files
	jp	nz,derbfm	;if not, "BAD FILE MODE"
gdfilm:
	call	synchr
	defb	44		;go past the comma
filset:	ex	de,hl		;[d,e]=text pointer
	ld	h,b		;setup ptrfil
	ld	l,c
	ld	(ptrfil),hl
	ex	de,hl		;text pointer back into [h,l]
	ret	

	page	
	;subttl	filscn, filfrm, and filidx
;
; at this entry point [h,l] is assumed to be the text pointer and
; a file number is scanned
;
filscn:	dec	hl
	call	chrgtr
	cp	'#'		;make number sign optional
	call	z,chrgtr	;by skipping it if there
	call	frmevl		;read the file number into the fac
;
; at this entry point the fac has the file number in it already
;
filfrm:	call	conint		;get the file number into [a]
;
; at this point it is assumed the file number is in [a]
; the file number is returned in [e]
; [d] is set to zero. [h,l] is saved.
; [b,c] is set to point at the file data block for file [e]
; [a] give the mode of the file and zero is set  if the file is
; mode zero (not open).
;
filidx:	ld	e,a		;get file number into [e]
filid2:	ld	a,(maxfil)	;is this file # legal?
	cp	e
	jp	c,derbfn	;if not, "BAD FILE NUMBER"
	ld	d,0		;setup double-byte offset to get
				;pointer to file data block
	push	hl		;save [h,l]
	ld	hl,filptr	;point at pointer table
	add	hl,de		;add on offset twice for double byte
	add	hl,de		;entries
	ld	c,(hl)		;pick up pointer in [b,c]
	inc	hl
	ld	b,(hl)
	ld	a,(bc)		;get mode of file into [a]
	or	a		;set zero if file not open
	pop	hl		;retrieve [h,l]
	ret	

; getptr is called from varptr(#<expression>)
	public	getptr
getptr:	call	filid2		;index into file data block
	ld	hl,datofc	;point to data block
	cp	md.rnd		;random file?
	jp	nz,ntfivd	;no, use notrrmal fooffset
	ld	hl,0+fd.dat	;yes
ntfivd:
	add	hl,bc		;add start of file data block
	ex	de,hl		;return in [d,e]
	ret	
	page	

mki$:	ld	a,2		;value type for integer and number
				;of characters result will need
	defb	1		;skip next two bytes with "LXI	B,"
mks$:	ld	a,4		;value type of single precision
	defb	1		;skip next two bytes
mkd$:	ld	a,8		;value type of double-precision
	push	af		;save the number of bytes of
				;string space we need
	call	docnvf		;convert fac to proper type
	pop	af		;get the number of bytes needed
	call	strini		;get a place for the string data
	ld	hl,(dsctmp+1)	;point to the place to store the data
	call	vmovmf		;move the fac value into the string creation
	jp	finbck		;finish up these string functions

cvi:	ld	a,1		;set [a] to be valtyp-1
	defb	1		;skip the next two bytes with "LXI B,"
cvs:	ld	a,3		;also set [a] to number of characters required -1
	defb	1		;skip the next two bytes
cvd:	ld	a,7		;double precision value type -1
	push	af		;save the valtyp
	call	frestr		;make sure the argument is a string
				;and get a pointer to the descriptor
	pop	af		;get back number of characters required-1
	cp	(hl)		;make sure the string is longer than that
	jp	nc,fcerr	;if not, "ILLEGAL FUNCTION CALL"
	inc	a		;[a]=true value type
	inc	hl
	ld	c,(hl)		;[h,l]=pointer at string data
	inc	hl		;to be moved into the fac
	ld	h,(hl)
	ld	l,c
	ld	(valtyp),a	;setup value type for move
				;and for identification
	jp	vmovfm		;move in the string data

	page	
	;subttl	setup to read a sequential item -- filind

filind:
	call	getypr		;see if input is string or number
	ld	bc,doasig	;return address to setup [fac]
con1	defl	0+(44*256)+32
	ld	de,con1		;setup terminators space and comma
	jp	nz,inpdor	;if numeric, go read the file
	ld	e,d		;make both terminators comma
	jp	inpdor		;go read the file
	page	
	;subttl	line input & read code for item fetching from sequential input files

dline:	call	filinp		;get file number set up
	call	ptrget		;read string to store into
	call	frcstr		;make sure it was a string
	ld	bc,finprt	;reset to console when done reading
	push	bc		;save on stack
	push	de		;save pointer at variable
	ld	bc,letcon	;good return address for assignment
	xor	a		;set a=0 for string value type
	ld	d,a		;zero out both terminators
	ld	e,a
inpdor:	push	af		;save value type
	push	bc		;save return address
	push	hl		;save pointer at data coming in
				;a dummy pointer at bufmin
notnwt:	call	indskc		;read a character
	jp	c,derrpe	;read past end error if eof
	cp	' '		;skip leading spaces
	jp	nz,notspc	;except for line input
	inc	d		;check for lineinput
	dec	d
	jp	nz,notnwt	;skip any number
notspc:	cp	34		;quoted string coming in?
	jp	nz,notqte
	ld	b,a		;save the quote
	ld	a,e		;must be input of a string
	cp	44		;which has [e]=44
	ld	a,b		;quote back into [a]
	jp	nz,notqte
	ld	d,b		;terminators are quotes only
	ld	e,b
	call	indskc		;read past quotation
	jp	c,quitsi	;if eof, all done
notqte:
	ld	hl,buf		;buffer for data
	ld	b,255		;maximum number of characters (255)
lopcrs:	ld	c,a		;save character in [c]
	ld	a,d		;check for quoted string
	cp	34
	ld	a,c		;restore character
	jp	z,notqtl	;don'T IGNORE CR OR STOP ON LF
	cp	13		;cr?
	push	hl		;save dest ptr. on stack
	jp	z,icaslf	;eat line feed if one
	pop	hl		;restore dest. ptr.
	cp	10		;lf?
	jp	nz,notqtl	;no, test other terminators
	ld	c,a		;save current char
	ld	a,e		;get terminator 2
	cp	54o		;check for comma (unquoted string)
	ld	a,c		;restore orig char
	call	nz,strchr	;if not, store lf (?)
	call	indskc		;get next char
	jp	c,quitsi	;if eof, all done.
	cp	13		;is it a cr?
	jp	nz,notqtl	;if not see if store normally
	ld	a,e		;get terminator
	cp	' '		;is it numeric input?
	jp	z,lpcrgt	;if so, ignore cr, dont put in buffer
	cp	44		;is it non-quoted string (term=,)
	ld	a,13		;get back cr.
	jp	z,lpcrgt	;if so, ignore cr.
notqtl:	or	a		;is char zero
	jp	z,lpcrgt	;always ignore, as it is terminator
				;for strlit (see quit2b)
	cp	d		;terminator one?
	jp	z,quitsi	;stop then
	cp	e		;terminator two?
	jp	z,quitsi
	call	strchr		;save the char
lpcrgt:	call	indskc		;read another character
	jp	nc,lopcrs	;if not, check as terminator
quitsi:	push	hl		;save place to stuff zero
	cp	34		;stopped on quote?
	jp	z,morspc	;don'T SKIP SPACES THEN
				;but do skip following comma or
				;crlf though
	cp	' '		;stopped on space?
	jp	nz,noskcr	;no, don'T SKIP SPACES
				;or any following commas or crlfs either
morspc:	call	indskc		;read spaces
	jp	c,noskcr	;eof, all done.
	cp	' '
	jp	z,morspc
	cp	44		;comma?
	jp	z,noskcr	;ok, skip it
	cp	13		;carriage return?
	jp	nz,bakupt	;back up past this character
icaslf:
	call	indskc		;read another
	jp	c,noskcr	;eof, all done.
	cp	10		;line feed?
	jp	z,noskcr	;ok, skip it too
bakupt:	ld	hl,(ptrfil)	;go to number of charaters
	ld	bc,0+nmlofs
	add	hl,bc
	inc	(hl)		;back up by incrementing character count
noskcr:	pop	hl		;get back place to store terminator
quit2b:	ld	(hl),0		;store the terminator
	ld	hl,buf-1	;item is now stored at this point +1
	ld	a,e		;was it a numeric input?
	sub	' '		;if so, [e]=" "
	jp	z,numimk	;use fin to scan it
	extrn	strlt2
	ld	b,d		;set [b]=44 if scanning unquoted string
	ld	d,0
	call	strlt2
	pop	hl		;get back [h,l]
	ret			;do assignment

numimk:	call	getypr		;get type of numeric variable being read
	push	af		;save it
	call	chrgtr		;read first character
	pop	af		;restore type of variable
	push	af		;save back
	call	c,fin		;single precision input
	pop	af		;get back type of var
	extrn	findbl
	call	nc,findbl	;double precision input
	pop	hl		;get [h,l]
	ret			;do the assignment

strchr:	or	a		;trying to store null byte
	ret	z		;return, dont store it
	ld	(hl),a		;store the character
	inc	hl
	dec	b		;128 yet?
	ret	nz		;more space in buffer, return
	pop	bc		;get rid of superfluous stack entry
	jp	quit2b		;special quit

	page	
prgfli:	ld	d,md.sqi	;sequential input mode
prgfl2:	xor	a		;internal file number is always zero
	jp	prgfil		;scan file name and disk nummer
				;and do the right thing using md.kil
				;as a flag

lrun:
lrun2:	db	366q		;set non zero to flag "RUN" command
load:	xor	a		;flag zero for "LOAD"
	push	af		;save "RUN"/"LOAD" flag
	call	prgfli		;find that file and setup for
				;using indskc subroutine
	ld	a,(maxfil)	;save the number of files
	ld	(lstfre+1),a	;since we make it look like zero
				;so ,r option can leave files
				;open
	dec	hl		;see if no run option
	call	chrgtr
	jp	z,notrnl	;no, just load
	call	synchr
	defb	44		;gotta have a comma
	call	synchr
	defb	'R'		;only option is run
	jp	nz,snerr	;and that better be the end
	pop	af		;get rid of "RUN"/"LOAD" flag
	public	chnent
chnent:
	xor	a		;so files aren'T CLOSED
	ld	(maxfil),a	;pretend there aren'T ANY
	defb	366o		;flag run with non-zero
notrnl:	pop	af		;flag non-run with zero
	ld	(lstfre),a
	ld	hl,dirtmp
	ld	(hl),0
	ld	(filptr),hl	;mess up pointer at file zero
	call	scrtch		;wipe out old stuff
	ld	a,(lstfre+1)	;restore maxfil
	ld	(maxfil),a	;that was kludged
	ld	hl,(filpt1)
	ld	(filptr),hl	;restore back to normal
	ld	(ptrfil),hl	;ptrfil got zeroed so fix it too
; below is fix (to label notini) so that if ^c during mbasic foo, wont exit to 
	ld	hl,(curlin)	;get line number
	inc	hl		;see if in initialization
	ld	a,h
	and	l
	inc	a
	jp	nz,notini	;no
	ld	(curlin),hl	;save direct line number
notini:
	call	indskc		;read the first character
	jp	c,main		;all done if nothing in file
	cp	254		;is this a protected file?
	jp	nz,ntprol	;no
	ld	(proflg),a	;set protected file
	jp	binlod		;do binary load
ntprol:
	inc	a		;is it a binary file?
	jp	nz,maingo	;no, since ptrfil is non-zero
				;inchr will use indskc instead of polling
				;the terminal
				;when eof is hit ptrfil will be restored
				;and lstfre will be used as a flag
				;to indicate whether to run the
				;loaded program
;
; time for a binary load.
; after the load, the file is linked together
; lstfre is used as a flag whether to run or not
;
binlod:	ld	hl,(txttab)	;get place to start storing into
lpbldr:	ex	de,hl		;see if there is room to spare
	ld	hl,(fretop)
	ld	bc,0+65536-86
	add	hl,bc
	call	dcompr
	ex	de,hl
	jp	c,outlod	;error and wipe out partial garbage
				;unlinked!! no zeroes at the end!!
	call	indskb		;read the a data byte
				;this is semi-weak since memory
				;is left in a bad bad state
				;if an i/o error occurs
	ld	(hl),a		;store byte
	inc	hl		;incrment pointer
	jp	nc,lpbldr	;read the next char
	ld	(vartab),hl	;save end temp for decoding
	ld	a,(proflg)	;is this a protected file?
	or	a		;set cc'S
	call	nz,prolod	;translate to good stuff
	call	linker		;fix the links
	inc	hl		;when linker returns, [h,l]
	inc	hl		;points to double zero
	ld	(vartab),hl	;update [vartab]
	ld	hl,maxfil	;only close file zer0
	ld	a,(hl)
	ld	(lstfre+1),a
	ld	(hl),0
	call	runc		;setup arytab, strend
	ld	a,(lstfre+1)	;restore number of files
	ld	(maxfil),a
	extrn	chnflg,chnret
	ld	a,(chnflg)	;chain in progress
	or	a		;test
	jp	nz,chnret	;yes, go back to chain code
	ld	a,(lstfre)	;run or not?
	or	a
	jp	z,ready
	jp	newstt

prgfin:	call	finprt		;zero ptrfil
	call	clsfil		;close file zero
	jp	gtmprt		;refetch text pointer
outlod:		:call	scrtch
	jp	omerr
merge:	pop	bc		;eliminate newstt return
	call	prgfli		;read the name and disk
	dec	hl		;must end there
	call	chrgtr
	jp	z,okgetm	;read the file
	call	prgfin		;close out time
	jp	snerr		;and "SYNTAX ERROR"
okgetm:	xor	a		;no run option with "MERGE"
	ld	(lstfre),a	;set up the flag
	call	indskc		;read from [ptrfil] file
	jp	c,main		;go back if eof
	inc	a		;is it a binary file??
	jp	z,derbfm	;binary is wrong file mode
maingo:	ld	hl,(ptrfil)	;get file pointer
	ld	bc,nmlofc	;point to number of chars in buffer
	add	hl,bc		;by adding offset
	inc	(hl)		;back up file by incrementing count
	jp	main

	page	
	;subttl	dispatch for direct statement
;
; make sure we'RE NOT READING A FILE IN
;
dirdo:
	push	hl
	ld	hl,(ptrfil)
	ld	a,h
	or	l		;is ptrfil zero so not file reading?
	ld	de,0+errfdr	;"DIRECT STATEMENT IN FILE"
	jp	nz,error	;note: lxi d, is used to
				;to make source conversions easier
	pop	hl		;get back pointer at bufmin
	jp	gone		;execute direct statement

	page	
	;subttl	save command -- ascii or binary

save:	ld	d,md.sqo	;eliminate earlier version
					;and create empty file
	call	prgfl2		;read file name and disk number and
	;look it up
	dec	hl
	call	chrgtr		;end of statement?
	jp	z,binsav	;binary save!!
	call	synchr
	defb	44		;only option is ",A"
	extrn	prosav
	cp	'P'		;protected save?
	jp	z,prosav	;do it
	call	synchr
	defb	'A'		;for ascii save
	jp	rlist		;use the list code to do the output
				;control-cs are not allowed
				;and at the end ptrfil is zeroed
binsav:
	call	sccptr		;get rid of pointers before saving
	extrn	prochk
	call	prochk		;dont allow binary saves of protected programs
	ld	a,255		;always start with 255
binpsv:	call	filou3		;send to file
	ld	hl,(vartab)	;get stop point
	ex	de,hl		;save in [d,e]
	ld	hl,(txttab)	;get start point
bsavlp:	call	dcompr		;reached the end?
	jp	z,prgfin	;reget text pointer and close file 0
	ld	a,(hl)		;get line data
	inc	hl		;point at next data
	push	de		;save limit
	call	filou3		;send char to file
	pop	de		;restore limit
	jp	bsavlp		;continue with line data

	;subttl	driver code for close

close:	ld	bc,clsfil	;service routine address
	ld	a,(maxfil)	;highest possible argument
				;which means do all possible
rtallr:	jp	nz,rtloop	;not end of statement, so scan arguments
	push	hl		;save the text pointer
mrall:	push	bc		;save routine address
	push	af		;save current value
	ld	de,retall	;return address
	push	de		;save it to come back with
	push	bc		;dispatch to service routine
	ret	
retall:	pop	af		;get back old argument
	pop	bc		;get back service routine address
	dec	a		;decrement argument
	jp	p,mrall		;loop on more values
	pop	hl		;get back the text pointer
	ret	

retrts:	pop	bc		;get back service routine address
	pop	hl		;get back the text pointer
	ld	a,(hl)		;see if more arguments
	cp	44		;delimited by comma
	ret	nz
	call	chrgtr		;read first character of formula
rtloop:	push	bc		;save the service routine address
	ld	a,(hl)		;get possble "#"
	cp	'#'		;is it
	call	z,chrgtr	;skip it, its optional
	call	getbyt		;read the argument
	ex	(sp),hl		;save the text pointer on the stack
				;and set [h,l]=service address
	push	hl		;save the service address
	ld	de,retrts	;put a return address on the stack
	push	de
	jp	(hl)		;dispatch to do the function


clsall:	push	de
	push	bc		;save [b,c] for stkini
	xor	a		;make it close all disks
	call	close
	pop	bc
	pop	de		;get back [d,e]
	xor	a		;return with [a]=0 and z on
	ret	

	page	
	;subttl	"FIELD" statement for setting up i/o strings
field:	call	filscn		;get data block pointer in [b,c]
	jp	z,derbfn	;"BAD FILE NUMBER" if file not open
	sub	md.rnd		;make sure its a random file
	jp	nz,derbfm	;if not, "BAD FILE MODE"
	extrn	fd.siz,tempa,tempb,fd.dat
	ex	de,hl		;save text pointer
	ld	hl,0+fd.siz	;point to record size
	add	hl,bc
	ld	a,(hl)		;get it
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	(tempa),hl	;store max allowed
	ld	hl,0		;zero max # of chars
	ld	(tempb),hl
	ld	a,h		;make [a]=0
	ex	de,hl		;get back text pointer
	ld	de,0+fd.dat	;point to 5.0 field buffer
lopfld:	ex	de,hl		;save text pointer in [d,e]
	add	hl,bc		;add on data pointer so [h,l] now points
				;at the start of the data
	ld	b,a		;setup count of characters past by
				;in data area, so total is never greater than 128
	ex	de,hl		;text pointer back into [h,l]
				;[d,e]=pointer into data area
	ld	a,(hl)		;more "AS"s to scan?
	cp	44		;comma starts the clause
	ret	nz		;back to newstt if not
	push	de		;save the pointer into the data block
	push	bc		;save [b]=number of characters allocated
	call	gtbytc		;read number into [a] from text
	push	af		;save this number
	call	synchr
	defb	'A'		;scan the "AS"
	call	synchr
	defb	'S'
	call	ptrget		;get a pointer at the string descriptor
	call	frcstr		;into [d,e]
	pop	af		;get the number of characters
	pop	bc		;get the number already used
	ex	(sp),hl		;save the text pointer and
				;[h,l]=pointer into data block
	ld	c,a		;save # of characters in [c]
	push	de		;save [d,e]
	push	hl		;save [h,l]
	ld	hl,(tempb)	;get total so far
	ld	b,0		;accumulate count
	add	hl,bc
	ld	(tempb),hl	;save total again
	ex	de,hl		;total to [d,e]
	ld	hl,(tempa)	;get max allowed
	call	dcompr		;in range?
	jp	c,derfov	;no, give error
	pop	hl		;restore [h,l]
	pop	de		;restore [d,e]
	ex	de,hl		;[h,l] point at string descriptor
	ld	(hl),c		;store the length
	inc	hl
	ld	(hl),e		;store the pointer into the data block
	inc	hl
	ld	(hl),d
	pop	hl		;get back the text pointer
	if	datpsc-256
	jp	nz,lopfld	;if total added up to not 256, go back for more
	ld	a,c		;see how much we added
	or	a		;test
	ret	nz
	endif			;just added up to 256, give syntax error if more
	jp	lopfld		;continue scanning "AS" clauses if more
	page	
	;subttl	random non-i/o -- lset/rset/field

;lset/rset stringvar = stringexp
;
; if stringvar points to an i/o buffer, use the string size to
;justify string. if stringvar is a literal, make new var with length
;of literal. if stringvar points to string space, use it. if the
;length of the variable is zero, return the null string. if a copy
;must be created, and stringexp is a temporary, use this space over
;unless length stringvar greater than stringexp.

rset:	defb	366o		;ori	<stc>
lset:	scf			;set carry if lset
	push	af		;save lset/rset flag
	call	ptrget		;get pointer to stringvar
	call	frcstr		;must be a string variable
	push	de		;save pointer to descriptor
	call	frmeql		;eat "=" and evaluate stringexp
	pop	bc		; [b,c] = ptr to descr.
	ex	(sp),hl		;text ptr on bottom of stack
	push	hl		;lset/rset flag next
	push	bc		;put descr. ptr back on
	call	frestr		;error if not string, free temp.
	ld	b,(hl)		;get length of stringexp
	ex	(sp),hl		; [h,l] = descr. of var,save othr
	ld	a,(hl)		;get length of stringvar
	ld	c,a		;save in [c]
	push	bc		;save lengths of both
	push	hl		;save descriptor pointer
	push	af		;psw zero if was temp.
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)		;get ptr to stringvar text
	or	a		;stringvar null?
	jp	z,retcur	;yes, don't change
	ld	hl,(txttab)
	call	dcompr		;stringvar in disk buffer?
	jp	nc,oldstr	;yes, use it
	ld	hl,(vartab)
	call	dcompr		;stringvar in program(literal)?
	jp	c,oldstr	;no, in string space so use it
;need to make new string for result since stringvar points to a literal.
;if stringexp was a temporary, it has been freed. if the length of
;stringexp is greater than or equal to the length of stringvar, getspa
;can be called and no garbage collection can occur so temp. can be reused.
;if stringvar is greater, must get a temp. to point to stringexp if it
;was a temp. , then call getspa which in this case can garbage collect.
	ld	e,c
	ld	d,0		;# bytes to allocate for result
	extrn	strend
	ld	hl,(strend)
	add	hl,de
	ex	de,hl
	ld	hl,(fretop)
	call	dcompr		;will getspa garbage collect?
	jp	c,makdsc	;yes, better have stringexp temp.
madesc:	pop	af
	ld	a,c		;get length of stringvar
	call	getspa		;get space for result
	pop	hl		;get stringvar descr.
	pop	bc		;get lengths off stack
	ex	(sp),hl		;get what we wanted, stringexp descr.
	push	de
	push	bc
	call	frestr		;free temp if any
	pop	bc
	pop	de
	ex	(sp),hl
	push	bc		;restore stack to previous state
	push	hl
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d		;set pointer to stringvar copy
	push	af
oldstr:	pop	af
	pop	hl		;get stringvar descr.
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)		;get pointer to text area
	pop	bc		;get lengths off stack
	pop	hl		;get pointer to stringexp descr.
	push	de
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)		;get ptr to stringexp text
	ex	de,hl		;put pointer in [h,l]
	pop	de
	ld	a,c		;get length of field(stringvar)
	cp	b
	jp	nc,fildok	;jump if field large enough for result
	ld	b,a		;save # of bytes to copy
fildok:	sub	b
	ld	c,a		;[c] = # blanks to fill
	pop	af		;get lset/rset flag
	call	nc,blkfil	;fill leading if rset
	inc	b		;in case zero
coplop:	dec	b		;decr. # to copy
	jp	z,lrstdn	;done when all copied
	ld	a,(hl)		;get byte from stringexp
	ld	(de),a		;copy to stringvar
	inc	hl
	inc	de
	jp	coplop

retcur:	pop	bc
	pop	bc
	pop	bc
	pop	bc
	pop	bc		;get garb off stack
lrstdn:	call	c,blkfil	;fill trailing if lset
	pop	hl		;restore text pointer
	ret	

blkfil:	ld	a,' '		;fill with spaces
	inc	c		;in case zero
blkfl1:	dec	c		;decr. # to fill
	ret	z		;return when done
	ld	(de),a		;store space
	inc	de
	jp	blkfl1

; if stringexp was a temporary, create a new temporary to point to
; stringexp since old one was freed. this must be done since getspa
; will be called and garbage collection might occur. if stringexp is
; not a temporary, return.

makdsc:	pop	af		;get temp flag
	pop	hl
	pop	bc
	ex	(sp),hl		;dig down to stringexp descr.
	ex	de,hl		;fretms wants [d,e]
	jp	nz,makds1	;not a temp, don't reallocate
	push	bc
	ld	a,b
	call	strini		;make a temp point to stringexp
	call	putnew		;get a temp to point to it
	pop	bc
makds1:	ex	(sp),hl
	push	bc
	push	hl		;restore stack to previous state
	push	af
	jp	madesc
	page	
	;subttl	program i/o -- fixed length input

; format:
;		stringvar = input$(#bytes[,[#] file#])
;if no file # is given, characters will be read from the user's
; terminal. no echoing will be done and no editing will be allowed
; (i.e. rubout,@,_,^u are just input as characters).

	public	fixinp
fixinp:	call	chrgtr
	call	synchr
	defb	'$'		;string function
	call	synchr
	defb	'('
	call	getbyt		;get # of bytes to read
	push	de		;save # of bytes to read
	ld	a,(hl)
	cp	54o		;read from disk file?
	jp	nz,redtty	;no, from user's terminal
	call	chrgtr
	call	filscn		;set up file #
	cp	md.sqo		;sequential output file?
	jp	z,derbfm	;then bad file mode
	call	filset		;set up ptrfil
	xor	a		;set zero for flag
redtty:	push	af		;non zero set if terminal i/o
	call	synchr
	defb	')'		;must have paren
	pop	af		;get flag off stack
	ex	(sp),hl		;save text ptr, [l]=# to read
	push	af		;save flag
	ld	a,l
	or	a		;read no characters?
	jp	z,fcerr		;yes, error
	push	hl		;save #
	call	strini		;get space for string
	ex	de,hl
	pop	bc		;[c] = # to read
fixlop:	pop	af
	push	af		;non-zero set if should read from tty
	jp	z,dskchr	;read from disk file
	extrn	charcg
	call	charcg		;get char if one
	jp	nz,charcw	;was one
	call	inchri		;read a char from terminal
charcw:
;note : will check flag on interrupt ^c
	cp	3		;control-c?
	jp	z,intctc	;yes, stop
putchr:	ld	(hl),a		;put char into string
	inc	hl
	dec	c		;read enough yet?
	jp	nz,fixlop	;no, read more
	pop	af		;get flag off stack
	call	finprt		;clear ptrfil
	jp	putnew		;return string as result
intctc:	ld	hl,(savstk)	;get saved stack pointer
	ld	sp,hl		;set [h,l] to it
	jp	endcon		;stop program

dskchr:	call	indskc		;get char from file
	jp	c,derrpe	;if carry, read past eof
	jp	putchr		;put char in string
;	end	

	
