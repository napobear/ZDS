;
;==================================================================================================
;   RC2014 W/ Z180 CPU USING EXTERNAL MEMORY MANAGER -- 512K RAM/ROM MODULE
;==================================================================================================
;
#include "cfg_rcz180.asm"
;
MEMMGR		.SET	MM_Z2		; 512K RAM/ROM MODULE MEM MGR
Z180_CLKDIV	.SET	1		; 0=OSC/2, 1=OSC, 2=OSC*2
Z180_MEMWAIT	.SET	0		; MEMORY WAIT STATES TO INSERT (0-3)
Z180_IOWAIT	.SET	1		; IO WAIT STATES TO INSERT (0-3)
;
CPUOSC		.SET	18432000	; CPU OSC FREQ
DEFSERCFG	.SET	SER_38400_8N1	; DEFAULT SERIAL LINE CONFIG
;
ASCIENABLE	.SET	TRUE		; TRUE FOR Z180 ASCI SUPPORT
SIOENABLE	.SET	FALSE		; TRUE TO AUTO-DETECT ZILOG SIO/2 
SIOMODE		.SET	SIOMODE_RC	; TYPE OF SIO/2 TO DETECT: SIOMODE_RC, SIOMODE_SMB
ACIAENABLE	.SET	FALSE		; TRUE TO AUTO-DETECT MOTOROLA 6850 ACIA
;
FDENABLE	.SET	FALSE		; TRUE FOR FLOPPY SUPPORT
FDMODE		.SET	FDMODE_RCWDC	; FDMODE_RCSMC, FDMODE_RCWDC
;
IDEENABLE	.SET	TRUE		; TRUE FOR IDE DEVICE SUPPORT (CF MODULE)
IDEMODE		.SET	IDEMODE_RC	; TYPE OF CF MODULE: IDEMODE_RC, IDEMODE_SMB
PPIDEENABLE	.SET	FALSE		; TRUE FOR PPIDE DEVICE SUPPORT (PPIDE MODULE)
;
DSRTCENABLE	.SET	FALSE		; DS-1302 CLOCK DRIVER
