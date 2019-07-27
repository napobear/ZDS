;;
;; ZDS - Monitor tester
;;

; 
; in need to test monitor images without burning eprom, this is
; a quick-and-dirty loader for images using 4k area e000-efff.

; link to monitor and bios symbols
include common.asm
include bios.sym

;
include montest.inc
;
	ORG	TPA
PINIT:
	LD	BC $0fff		; monitor size
	LD	HL,BEGIN		; FROM...
	LD	DE,RELADR		; ...TO
	LDIR				; MOVED
	JP	RELADR

BEGIN	EQU	$

	END
