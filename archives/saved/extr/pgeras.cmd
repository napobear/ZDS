 SCREEN ON
         LOOP
      CASE RISP='I'
         SAVE TO B:TEMP
         DO B:CLIFOSIN
         LOOP
      CASE RISP='T'
         STORE F TO MENU
         POKE 40,253
         ? '*** END RUN - GESTIONE CLIENTI/FORNITORI ***'
         POKE 40,255
   ENDCASE
ENDDO
RELEASE ALL
SET TALK ON
USE
? CHR(2)
RETURN

--------------------------'
   ?
   ?
   WAIT TO RISP
   STORE !(RISP) TO RISP
   DO CASE

TURN

N
 40,255
N - GESTIONE ABBONATI TRENITALIA (r) ***'
NATO VALID"
<>'F
@  0,42 SAY 'FATTURA NUMERO:'
@  2,1  SAY 'DATA:'
@  3,28 SAY 'TRASPORTO MEZ CLS
@ 23,0 SAY ' '
ACCEPT 'DATA FATTURA (NIENTE=data odierna) ' TO FATDATA
IF FATDATA=' '
STORE DATE() TO FATDATA
ENDIF
@ 2,6 SAY FATDATA
@ 24,0 SAY CLS
@ 23,0 SAY ' '
ACCEPT 'ASPETTO ' TO ASPETTO
@ 4,11 SAY ASPETTO
@ 24,0 SAY CLS
@ 23,0 SAY ' '
ACCEPT 'VETTORE DELLA SPEDIZIONE ' TO VETTORE
@ 5,11 SAY VETTORE
@ 24,0 SAY CLS
@ 23,0 SAY ' '
ACCEPT 'NUMERO DEI COLLI ' TO                                     '
RETURN

29)+CHR(200)
@  0,42 SAY 'FATTURA NUMERO:'
@  2,1  SAY 'DATA:'
@  3,28 SAY 'TRASPORTO MEZZO'
@  4,1  SAY ' Aspetto:'
@  4,31 SAY 'MITTENTE'
@  :R$U:1850 l	,1170:PPU0:X3U0:X4U0:2250 {	6ERU4:1740   AMt BFB 2F  OO MT  GP CL VT TE SP9TO  MC FP  TN	w_ R	y W  H OPx EMlxLL CSP='F'
         DO B:CLIFOBIL
      CASE RISP='O'
         ERASE
         @ 0,30 SAY 'ORDINAMENTO ARCHIVIO'
         ? LDEMO
         ?
         ?
         ? "L'ORDINAMENTO CANCELLA LE SCHEDE MARCATE... PROCEDO ? (S=si)"
         WAIT TO ANSWER
         IF ANSWER <>"S" .AND. ANSWER<>"s"
            LOOP
         ENDIF
         ?
         ? 'INIZIO...'
         SET TALK ON
         SORT ON NOME TO B:CLIFOBFR
         USE
         DELETE FILE B:CLIFODAT
         RENAME B:CLIFOBFR TO B:CLIFOD