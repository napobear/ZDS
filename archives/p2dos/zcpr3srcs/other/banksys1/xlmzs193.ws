.foXL-M180 Banked Zsystem vers 1.93 Users Guide  27jan88     Page #















                   Banke� Zsystem Version 1.34

                             for the

            Intelligent Computer Designs Corporation

               XL-M180 S-100 Single Board Computer









                Documentation and latest revisions
                               by
                         Wells Brimhall
                          Phoenix, Az.
                  Z-Paradise (ZNODE #52) Sysop
                     (602)996-8739 24hrs/day
                        300/1200/2400 bps

.pa�.CW 24
USER'� GUID� TABL� O� CONTENTS

.CW 10

      OVERVIEW..........................................PAGE 3

      FEATURES..........................................PAGE 4

      LIMITATIONS.......................................PAGE 5

      FUTURE ENHANCEMENTS...............................PAGE 6

      MINIMUM HARDWARE REQUIREMENTS.....................PAGE 6

      SUPPORTED FLOPPY DISK FORMATS.....................PAGE 7

      RAM DISK..........................................PAGE 8

      IOBYTE............................................PAGE 9

      GETTING STARTED...................................PAGE 9

      ZCPR3.............................................PAGE 13

      CUSTOMIZATION.....................................PAGE 16

      NEW UTILITIES.....................................PAGE 16

      MEMORY BANK OVERVIEW..............................PAGE 17

      T-FUNCTION CALLS..................................PAGE 19

      I/O PORT ADDRESSES................................PAGE 20

      S-100 INTERRUPTS..................................PAGE 20
     
      DISK ASSIGNMENTS..................................PAGE 21

      IMP MODEM PROGRAM.................................PAGE 22

      MOVE-IT OVERLAY...................................PAGE 22

      DISCLAIMER........................................PAGE 22

.PA�.TC  OVERVIEW..........................................PAGE #
                            OVERVIEW

Thi� guid� onl� cover� th� basi� syste� specifi� aspect� o� �
Zsyste� o� th� XL-M180� User� shoul� als� rea� th� following
documentatio� fo� � ful� description of th� system�

                 "ZCPR3 The Manual" by Richard Conn,

           "ZRDOS Programmer's Guide" by Dennis Wright

                           and the new

        "Z-System Users Guide" by R. Jacobson & B. Morgen

     (All ar� availabl� fro� Echelo� Inc� a� (415)948-3820.)


� hav� bee� � Zsyste� use� fo� som� tim� an� purchase� a� X�-M18� �
ove� � yea� ag� fo� us� o� m� ZNOD� bulleti� boar� system� I� i� �
a� impressiv� piec� o� hardwar� an� � ha� hope� i� woul� greatl� �
exten� th� lif� o� � bi� �-10� systems�  It'� unfortunat� tha� �
ICD'� busines� managemen� abilit� wa� no� u� t� th� sam� leve� a� �
thei� hardwar� desig� ability� Th� writin� wa� o� th� wal� fro� �
th� wa� the� wer� handlin� thei� customer� an� i� wa� no� � grea� �
supris� whe� the� finall� close� u� shop� 

A� mos� o� yo� alread� know� IC� designe� th� X�-M18� fo� us� �
wit� Turbodo� I� i� � ver� impressiv� operatin� syste� bu� it's�
hig� pric� make� i� difficul� t� justif� fo� singl� use� no� �
commercia� applications.

� decide� t� writ� th� Zsyste� BIO� mysel� afte� waitin� severa� �
month� fo� IC� t� d� i� wit� n� results� (The� shippe� m� ove� 1� �
version� o� thei� Zsyste� BIO� an� no� eve� � o� the� woul� boo� �
up!� Som� o� th� desig� goal� o� thi� implementatio� wer� t� �
includ� severa� feature� o� TurboDOS� kee� th� cos� lo� an� �
stil� b� compatibl� wit� al� th� existin� Zsyste� utilities� I� �
turne� int� bigge� projec� tha� anticipate� an� ha� take� ove� � �
yea� t� ge� thi� Banke� versio� functional� bu� � fee� i� i� no� �
on� o� th� mos� powerfu� � bi� singl� use� operatin� system� �
available� 

I'� lik� t� giv� specia� thank� t� Fran� Gaude� an� Dav� McCor� �
a� Echelon� Thei� quic� respons� i� sendin� ou� disk� � �
documentatio� ha� bee� mos� helpful.

Pleas� forwar� an� questions� bu� report� o� suggestion� t� m� �
Bulleti� Boar� Numbe� (602)996-8739� I'� quit� dedicate� t� �
supportin� th� XL-M18� an� Zsyste� s� giv� m� � call� (� wil� �
als� kee� th� lates� version� o�-lin� fo� downloading.)
.pa�.TC  FEATURES..........................................PAGE #
                            FEATURES

� Th� syste� i� writte� i� abou� � doze� relocatabl� module� tha� �
ar� assemble� wit� Echelo� ZA� 3.� assemble� an� linke� wit� �
LINK.CO� fro� Digita� Research� ZRDO� 1.9 mus� b� i� .RE� forma� �
an� link� righ� i� wit� th� res� o� th� modules� Th� ZSETU� �
utilit� i� no� use� t� full� configur� th� syste� withou� �
reassembly.

� Th� syste� i� boote� fro� � fil� name� OSLOAD.CO� instea� o� �
fro� reserve� syste� tracks� Thi� allow� th� syste� t� b� large� �
tha� th� 1s� � tracks� eliminate� th� nee� fo� SYSGE� program� �
an� free� u� th� reserve� track� fo� files.

� Th� CC� i� store� i� RA� s� th� boo� dis� i� no� necessar� �
afte� th� syste� i� col� booted� Thi� als� speed� u� th� war� �
boot� considerably.

� Th� operatin� syste� i� no� spli� int� � bank� whic� give� � �
58� tp� i� ban� �.

� Th� ful� ZCPR� implementatio� i� supported� I� includes� Inpu� �
Outpu� Package� Residen� Comman� Packag� (wit� ne� BAN� command)� �
Flo� Comman� Package� an� Name� Directories.

� Support� u� t� fou� flopp� drive� i� an� combinatio� o� 5.25� �
4� tpi� 5.25� 9� tp� o� 8"� Th� drive� ca� b� singl� o� doubl� �
side� an� singl�, doubl� o� hig� density� 

+ Supports a 394k ram disk. 

� Support� � har� dis� drive� usin� th� OMT� SCS� controller� Th� �
drive� ca� b� spli� spli� int� partition� o� u� t� 8me� whic� �
allow� th� tota� capacit� o� eac� driv� t� b� 128meg.

� Ther� ar� severa� ne� utilitie� includin� ZSETUP.CO� whic� �
allow� yo� t� configur� th� system� FMTF.CO� whic� initialize� � �
verifie� ove� 14 o� th� mos� popula� flopp� dis� format� an� �
PARTH.CO� whic� i� use� t� partitio� � har� disk� Al� o� thes� �
function� ar� no� considerabl� easie� t� perfor� an� n� longe� �
requir� reassemblin� th� system.

� � tabl� drive� schem� i� use� t� support flopp� disk� wit� man� �
differen� formats� T� us� � ne� forma� al� yo� hav� t� d� i� �
creat� � smal� Dis� Specificatio� Tabl� an� lin� i� int� th� �
system� Th� syste� automaticall� check� eac� drive'� dis� format� �
locate� th� appropriat� DS� an� create� th� necessar� CP/� �
compatibl� DP� � DP� tables� Additiona� parameter� hav� no� bee� �
adde� t� eac� DS� t� suppor� practicall� an� diskett� forma� �
includin� Kaypr� � an� AMPRO/Micromin� S�-180.
.pa�� Support� switchin� betwee� lo� � hig� densit� o� dua� mod� �
5.25� 9� tp� IB� A� compatibl� flopp� drive� lik� th� Tea� �
FD55GF�-17.

� � multitaskin� dispatche� i� implemente� an� al� th� physica� �
driver� suppor� � multitaskin� environment� Thi� allow� speciall� �
code� externa� processe� t� ru� i� th� backgroun� withou� �
interferin� wit� th� DO� an� shoul� mak� i� easie� t� upgrad� t� �
� futur� mult�-taskin� Zsystem.

� Th� syste� i� compatibl� wit� olde� S-10� mai� frame� an� I/� �
cards� (Th� HD6418� interna� I/� registe� bas� ha� bee� relocate� �
u� t� 80� s� yo� won'� hav� t� reconfigur� you� ol� board� an� �
software.� It'� runnin� righ� no� o� � 1� yea� ol� IMSA� syste� �
wit� it'� origina� S-10� seria� � paralle� I/� boards� (Som� o� �
th� IMSA� fron� pane� function� nee� som� additiona� hardwar� t� �
implement� bu� Reset� Stop� Singl� Ste� an� th� addres� displa� �
LED'� wor� fine.)

� Selecte� Turbodo� syste� call� ar� supporte� t� giv� Turbodo� �
compatibl� ban� switchin� an� SI� channe� mode� control.

� � paralle� printe� drive� i� no� include� alon� wit� ful� CP/� �
physical/logica� devic� reassignmen� throug� th� IOBYT� a� 0003h� 

� � logical/physica� dis� assignmen� tabl� i� implemented� Thi� �
allow� an� physica� driv� t� b� reassigne� a� A� s� i� ca� tak� �
advantag� o� driv� A'� specia� acces� feature� lik� th� ROOT� �
directory� Dis� assignment� ar� change� throug� th� consol� wit� �
th� ASSIGN.CO� o� ZSETUP.CO� utilit� programs� 

� Overlay� fo� th� IMP.CO� ver� 2.4� � MOVE-IT.CO� ver� 3.� �
modem/communicatio� program� ar� include� s� yo� ca� us� si� �
channe� � fo� � mode� o� � seria� lin� betwee� anothe� system.

.TC  LIMITATIONS.......................................PAGE #
                           LIMITATIONS

� Th� BIO� doe� no� presentl� detec� diskett� forma� changes� Yo� �
mus� perfor� � war� boo� afte� changin� t� � diskett� wit� � �
differen� formats.

� Ther� i� n� har� dis� forma� utilit� bu� th� IC� FORMATH.CO� �
progra� wil� ru� unde� thi� versio� o� th� system.

.pa�.TC  FUTURE ENHANCEMENTS...............................PAGE #
                       FUTUR� ENHANCEMENTS

� Automati� assignmen� o� th� boo� driv� to A� s� th� syste� ca� �
boo� from an� drive.

� � dis� writ� verif� optio� tha� ca� b� selectivel� enable� o� �
disable� o� an� combinatio� o� th� 1� logica� drives.

+ Read 48 tpi disks in a 96 tpi drive.

� A� optio� t� mak� Rea� Onl� Syste� File� publi� t� al� use� �
area� o� � drive.

� Tabl� drive� har� dis� forma� utilit� fo� th� OMT� SCS� �
controller.

� � flopp� DS� installe� utilit� tha� wil� allo� yo� t� ad� o� �
remov� flopp� dis� format� withou� reassembly.

� Har� dis� t� tap� backu� utilitie� fo� th� OMT� SCS� �
controller.

+� An� suggestion� fo� additiona� futur� improvement� wil� b� �
appreciated.

.TC  MINIMUM HARDWARE REQUIREMENTS.....................PAGE #
                  MINIMUM HARDWARE REQUIREMENTS

Console Terminal

Th� consol� shoul� b� � CR� termina� wit� 19.2� bau� capability� �
Th� firs� tim� yo� boo� u� th� syste� th� TCSELEC� utilit� wil� �
displa� � men� o� terminal� an� allo� yo� t� selec� th� on� tha� �
yo� ar� using� Fro� the� o� you� selecte� termina� capabilit� �
fil� wil� b� loade� int� th� Syste� Enviormen� eac� tim� yo� col� �
boot.

Main Frame

The main frame must have a 6mhz or faster motherboard.

Floppy Disk Drives

Th� standar� distributio� dis� i� configure� fo� th� followin� �
floppy disk drives:

     A:= 5.25" 48 tpi flpy drv 0    C:= 5.25" 96 tpi flpy drv 2
     B:= 5.25" 48 tpi flpy drv 1    D:=           8" flpy drv 3

I� yo� wan� t� boo� u� o� th� standar� boo� dis� yo� wil� hav� t� �
attac� � 5.25� 48tp� DS/D� driv� strappe� a� flopp� 0� An� othe� �
typ� o� driv� wil� requir� � specia� orde� syste� distributio� �
dis� an� possibl� th� ne� versio� boo� rom� (Onc� th� syste� i� �
u� th� abov� assignment� ca� b� change� t� mee� you� needs.� �
Here'� � tabl� o� al� th� supporte� formats:
�.TC  SUPPORTED FLOPPY DISK FORMATS.....................PAGE #
                  SUPPORTE� FLOPP� DIS� FORMATS

fmt             size-      sec  sec/ Old New              disk
 # Name     tpi sides dens size trk  ROM ROM Read Wrt Fmt cap.
 = ======== === ===== ==== ==== ===  === === ==== === === ====
 1 Tdos48-2 48  5"-2  dbl  1024  5   yes yes yes  yes yes 400k
 2 Tdos48-1 48  5"-1  dbl  1024  5   yes yes yes  yes yes 200k
 3 Kpro2    48  5"-1  dbl   512 10    no yes yes  yes yes 193k
 4 Kpro�    4�  5"-�  db�   51� 1�    n�  n� ye�  ye� ye� 394k
 � Amp48-�  4�  5"-�  db�   51� 1�    n�  n� ye�  ye� ye� 396k
 � Amp96-�  9�  5"-�  db�  102�  �    n�  n� ye�  ye� ye� 797k
 � Kpro9�   9�  5"-�  d��   51� 1�    n�  n� ye�  ye� ye� 796k
 8 Tdos96-2 96  5"-2  dbl  1024  5    no yes yes  yes yes 800k
 9 Tdos96-1 96  5"-1  dbl  1024  5    no yes yes  yes yes 400k
10 IBM8-1   48  8"-1  sgl   128 26   yes yes yes  yes yes 250k
11 ICM8-�   4�  8"-�  db�   51� 1�    n�  n� ye�  ye� ye�   1m
12 Tdos8-2  48  8"-2  dbl  1024  8   yes yes yes  yes yes 1.2m
13 Tdos8-1  48  8"-1  dbl  1024  8   yes yes yes  yes yes 600k
1� TdosH�   9�  5"-�  h�   102�  �    n�  n� ye�  ye� yes 1.�m
15 ICMHD    9�  5"-�  h�    51� 1�    n�  n� ye�  ye� yes 1.2m
 
(Th� BIO� support� al� o� th� abov� formats� th� ol� ro� onl� �
restrict� th� format� tha� yo� ca� boo� from� Tdos4�-� i� th� �
standar� syste� boo� dis� format� I� i� als� availabl� i� an� o� �
th� othe� bootabl� format� o� specia� order.)

1� Tdos4�-� i� th� standar� forma� fo� distribution� I� ca� b� �
rea� wit� bot� boo� ro� version� an� provide� th� maximu� storag� �
pe� 4� tp� floppy� I� i� recommende� tha� yo� hav� a� leas� on� �
4� tp� ds/d� driv� installe� o� th� syste� t� suppor� thi� �
format.

2� Tdos4�-� i� supporte� fo� thos� tha� onl� hav� � singl� side� �
4� tp� driv� o� wan� t� us� singl� side� diskettes� I� i� no� �
recommende� fo� norma� use.

�) Kpro� i� provide� fo� portabilit� betwee� othe� � bi� system� �
an� i� th� onl� no� Turbodo� 5.25� forma� tha� yo� ca� boo� from� �
Bot� Kaypr� format� hav� reserve� syste� track� s� yo� ca� no� �
us� th� entir� dis� fo� fil� storag� lik� yo� ca� wit� th� Tdo� �
formats.

4� Kpro� i� use� b� severa� Kaypr� machine� includin� th� � an� �
10� I� i� � doubl� side� forma� an� give� twic� th� capacit� o� �
th� Kpro� above� 

5� AMP4�-� i� use� b� AMPR� an� Micromin� i� th� S�-180� I� i� �
on� o� th� mor� commo� format� fo� � bi� machines� I� doe� no� �
hav� quit� th� sam� capacit� a� th� Tdo� format� becaus� of
it'� reserve� tracks.

6� AMP9�-� i� als� use� b� AMPR� an� Micromin� i� th� S�-180� �I� �
give� twic� th� capacit� o� th� AMP4�-� above.

.pa�7� Kpro9� i� use� i� Kaypro� wit� th� PR�-� ROM� I� i� simila� t� �
th� Kpro� forma� wit� twic� th� tracks.

8� Tdos9�-� i� th� preferre� forma� fo� loca� us� du� t� it� 800� �
storag� capacit� alon� wit� th� convenienc� an� pric� o� 5.25� �
diskettes.

9� Tdos9�-� i� supporte� fo� thos� tha� wan� t� us� singl� side� �
diskettes� I� i� no� recommende� fo� norma� use.

10� IBM�-� i� th� industr� standar� IB� 8� singl� sided� singl� �
densit� format� Thi� shoul� provid� th� maximu� portabilit� �
betwee� systems.

11� ICM�-� i� use� b� Inte�-Continenta� Microsystems� I� i� �
include� fo� portabilit� betwee� system� an� i� no� recommende� �
fo� genera� us� du� t� it'� smalle� secto� siz� an� reserve� �
syste� tracks.
�
12� Tdos�-� i� th� Highes� capacit� forma� supported� I� als� �
give� th� bes� performanc� du� t� th� 500� transfe� rat� o� 8� �
drives� Ther� i� � tradeof� thoug� whe� yo� conside� th� cos� o� �
thes� diskette� ver� th� Tdos9�-� format.

13� Tdos�-� give� give� simila� performanc� t� th� Tdos�-� bu� �
onl� ha� hal� th� storag� capacity� I� i� no� recommende� unles� �
yo� hav� � singl� side� driv� o� nee� t� us� singl� side� disks.

14� TdosH� i� identica� t� th� Tdos�-� forma� bu� i� i� fo� us� �
wit� 5� hig� densit� IB� A� compatibl� flopp� drive� lik� th� �
Tea� FD55GF�-17.

15� ICMH� i� identica� t� th� ICM�-� forma� bu� i� i� fo� us� �
wit� 5� hig� densit� IB� A� compatibl� flopp� drive� lik� th� �
Tea� FD55GF�-17.

.TC  RAM DISK..........................................PAGE #
                            RAM DISK

Th� syste� support� � ra� dis� as physica� driv� 5� I� i� �
initiall� configure� t� b� logica� driv� E:� bu� ca� b� �
reassigne� wit� th� ASSIGN.CO� utilit� t� b� an� logica� drive� �
Ever� tim� th� syste� i� powere� u� th� ra� disk'� director� wil� �
contai� rando� data� Yo� mus� ru� th� followin� utilit� progra� �
t� forma� th� ra� dis� director� befor� i� ca� b� used:

     ERADIR E�         ;format ram disk directory

Remembe� tha� everythin� o� th� ra� dis� wil� b� los� wheneve� �
th� syste� i� powere� down� Mak� sur� yo� cop� anythin� yo� wan� �
t� sav� ont� � flopp� befor� turnin� of� th� power!� Th� ra� dis� �
wil� greatl� spee� u� dis� intensiv� operation� lik� assemblies� �
link� an� compiles� (Th� ra� dis� link� thi� ver� o� th� syste� �
300� faste� tha� m� Kaypr� 10!)

.pa�.TC  IOBYTE............................................PAGE #
                             IOBYTE

Th� standar� Intel/CP� IOBYT� i� no� implemente� a� 0003h� I� ca� �
b� viewe� an� change� wit� th� ZSETU� utility.

.TC  GETTING STARTED...................................PAGE #
                         GETTING STARTED


Naturall� yo� wil� hav� t� instal� you� boar� int� � S-10� �
mai� frame� I� i� strongl� recommende� tha� yo� firs� chec� al� �
powe� suppl� voltage� o� th� bus� t� verif� tha� the� ar� withi� �
+/- 10� o� th� value� belo� an� remembe� t� neve� instal� o� �
remov� th� boar� wit� th� powe� on� Here'� � lis� o� step� fo� �
th� installation:

1� I� yo� hav� on� o� th� olde� 2mh� motherboard� i� you� syste� �
yo� wil� hav� t� replac� i� wit� � faste� one� Wha� appeare� t� �
b� � DM� channe� proble� o� m� XL-M18� turne� ou� t� b� m� ol� �
2mh� buss� Visy� (Compupro� make� � ne� 10mh� mothe� boar� tha� �
fi� int� m� Imsa� cabine� wit� minima� modifications.

2� Chec� fo� +� volt� o� S-10� line� � an� 5� ,+1� volt� o� lin� �
� an� -1� volt� o� lin� 52� Line� 20� 50� 53� 7� an� 10� ar� �
grounds.

3� I� yo� hav� a� olde� S-10� syste� lik� th� IMSA� wit� � fron� �
pane� the� yo� wil� nee� t� mak� th� followin� modification� �
befor� installin� th� board:

�����a� Cu� th� trac� goin� t� S-10� pi� 2� o� th� fron� pane� �
�����edg� connecto� t� disconnec� th� ol� UNPROTEC� memor� �
�����signal� Th� XL-M18� ground� thi� pi� s� i� woul� plac� � 1� �
�����resisto� acros� th� powe� suppl� a� al� time� an� coul� �
�����possibl� mes� u� som� o� th� fron� pane� functions.

�����b� Cu� th� trac� goin� t� S-10� pi� 6� o� th� XL-M18� edg� �
�����connector� Thi� i� th� MWRIT� signa� whic� shoul� b� �
�����generate� b� th� fron� pane� whe� i� i� i� � system.

     c� Th� 1� pi� dat� bus� fla� cabl� i� no� connected� Mak� �
�����sur� th� pin� ar� insulate� wit� tap� s� they won't shor� �
�����ou� on anything. 

4) Insert the board into any slot of your S-100 mainframe. 

5� Connec� � 1� pi� fla� cabl� fro� J� (o� th� fa� right� o� th� �
XL-M18� t� � RS23� seria� paddl� card� 

6� Plu� you� Consol� termina� int� th� 2� pi� D� connecto� o� th� �
RS23� paddl� card� Th� RS23� signal� ar� o� th� followin� pin� �
whe� th� jumper� o� j� an� j� ar� i� th� � position:
.pa�
+--- Supported on ch0 (j9) 
| +- Supported on ch1 (j8) 
� |
� | HD64180     RS232    
� | signals     DB25 pin 
= = =======    ========= 
x x   GND  <->  1  GND   << Pins 1 & 7 are tied together.
x x  /txd  -->  2  txd   << To reverse pin 2 with 3 move the
x x  /rxd  <--  3  rxd      jumpers on J2 from B to A.
� �  /ct�  <--  �  ct�   <� Mus� b� at � leve� t� enabl� tx.�
x x  /cts  <--  6  dsr   << Pins 5 & 6 are tied together
x x   GND  <->  7  COM   << Pins 1 & 7 are tied together
x    /rts  -->  8  dcd   << Should be an input instead of output.
           <-- 19  rts   << No connection on XL-M180
x    /dcd  --� 2�  dt�   <� T� revers� pin� � � � wit� 2� mov� �
                             jumpers on J3 from B to A.

A� yo� ca� see� ther� ar� som� seriou� problem� wit� th� mode� �
contro� signals� � a� workin� o� � cu� � jum� lis� fo� th� RS23� �
paddl� car� t� straighte� ou� th� signal� alon� wit� � schematic� �
Fo� no� ther� appear� n� b� n� proble� usin� i� wit� � terminal.

7� Se� you� consol� t� 19.2� baud� � dat� bits� � sto� bit� n� �
parity� an� Ful� duplex� I� you� consol� doesn'� suppor� thes� �
value� the� yo� wil� hav� t� orde� � specia� syste� boo� dis� �
tha� i� configure� t� you� specifications.

8� Th� syste� shoul� b� turne� o� befor� connectin� th� drive� t� �
verif� tha� th� consol� i� functional� Tur� o� th� A� powe� an� �
pres� th� rese� button� I� th� Consol� Retur� ke� i� presse� �
severa� time� withi� th� nex� � second� th� syste� monito� wil� �
sig� on� I� i� doesn'� g� bac� an� chec� you� bau� rates� �
voltages� an� seria� por� connections� 
�
9� Connec� you� flopp� drive(s� t� th� syste� wit� th� �
appropriat� ribbo� cables� Ther� ar� usuall� numerou� strapin� �
combination� fo� eac� drive� Mak� sur� tha� yo� hav� th� driv� �
yo� ar� goin� t� boo� of� strappe� a� DRIV� 0� I� i� probabl� �
easie� t� determin� th� bes� hea� loa� an� le� option� b� tria� �
an� erro� onc� th� syste� i� running� bu� yo� shoul� mak� sur� �
the� ar� se� t� � vali� combinatio� befor� booting� � hav� th� �
followin� strap� installe� o� m� TEA� fd55bv:

                         DS0, U2, RE, RY

Thi� seem� t� wor� ou� prett� good� Th� moto� an� hea� loa� ar� �
bot� controlle� b� th� moto� signa� fro� th� XL-M180� � diskett� �
mus� b� i� place� th� doo� mus� b� closed�  th� moto� lin� mus� �
b� asserte� an� th� driv� mus� b� selecte� (th� latte� � ar� don� �
b� th� BIOS� befor� th� hea� wil� loa� an� th� LE� wil� tur� on� �
Th� hea� wil� sta� loade� unti� th� moto� time� proces� i� th� �
BIO� turn� th� moto� off� I� i� se� t� g� of� afte� appx� 1� �
second� o� n� activity� Avoi� usin� � hea� loa� stra� combinatio� �
tha� load� an� unload� th� hea� o� eac� access� Th� LE� wil� emi� ��� sligh� glo� whe� idl� whic� indicate� tha� th� FD� chi� i� �
pollin� th� drives.

Th� standar� syste� boo� dis� expect� 5.25� 4� tp� drive� t� b� �
strappe� a� driv� � an� 1� � 5.25� 9� tp� driv� t� b� strappe� a� �
� an� � 8� driv� a� 3.� I� yo� nee� � differen� configuratio� the� �
yo� wil� hav� t� orde� � specia� boo� disk� (Th� initia� �
configuratio� ca� b� change� fairl� easil� onc� th� syste� i� �
up.� Yo� ca� physicall� connec� fou� 5.25� drive� an� fou� 8� �
drive� t� th� syste� bu� th� FD� chi� ha� � limitatio� o� �
addressin� onl� � drives.

10� Tur� th� syste� o� an� inser� th� boo� dis� int� driv� 0� Mak� �
sur� no�e o� th� othe� drive� ar� close� wit� diskette� i� them� �
No� clos� th� boo� driv� an� pres� th� rese� button� Th� moto� �
wil� tur� on� th� hea� wil� loa� an� th� LE� wil� light� Yo� �
shoul� als� b� abl� t� hea� th� driv� seekin� t� th� righ� �
tracks� I� everythin� i� o� th� syste� wil� signo� withi� � fe� �
second� the� i� wil� finis� initializin� th� Zsyste� package� an� �
giv� th� A0:Root>� prompt� I� yo� hav� an� problem� g� bac� an� �
doubl� chec� you� driv� straps� Ther� i� als� � BOO� comman� i� �
th� monitor� I� ma� b� helpfu� t� determin� wher� th� proble� is.

11� Onc� yo� ge� th� syste� boote� u� immediatel� mak� � backu� �
cop� o� you� syste� boo� disk� Her� ar� � fe� suggestion� i� yo� �
only have 1 drive:

     Forma� th� ra� dis� director� wit� th� followin� comman� �
�����line. (Thi� mus� b� don� eac� tim� th� syste� i� powere� �
�����up.)

          ERADIR E:<cr>     ;format ram disk directory

�����Us� thi� comman� lin� t� cop� th� boo� dis� t� th� RA� disk� �
�����Ther� wil� probabl� b� � fe� file� tha� won'� fi� sinc� th� �
�����Tdos48-� forma� diskette� ar� abou� 20� large� tha� th� RAM �
�����disk� (Th� remainin� file� ca� b� copie� on� a� � tim� afte� �
�����th� mas� transfer.)

          AC E:=A:*.*<cr>     ;copy all files to E: with verify

�����No� inser� � blan� dis� int� you� driv� an� initializ� i� �
�����wit� th� FMTF.CO� utility� Mak� doubl� sur� tha� yo� don'� �
�����initializ� th� distributio� boo� disk!� Thi� exampl� assume� �
�����tha� yo� ar� usin� � 5.25� 48tp� driv� a� A� an� tha� yo� �
�����ar� usin� th� TD48� format� Loo� a� FMTF.DO� fo� informatio� �
�����o� usin� FMT� wit� othe� drive� an� formats� 

         E:FMT� A� TD482<cr>     ;format ne� diskette in driv� A�

     Type a ^C to reboot. Then copy the files from the RAM disk
     back to your new diskette with this command line:

          E:AC A:=E:*.*<cr>   ;copy all files to E: with verify
�
12� Tw� drive� ar� strongl� recommended� � hav� on� 5.25� 4� tp� �
floppy� on� 5.25� 9� tp� floppy� on� 8� flopp� an� � 85meg har� �
dis� o� m� system� Thi� wa� � ca� read� writ� an� forma� al� o� �
th� diskett� formats� (� considere� attachin� tw� 9� tp� drive� �
an� usin� the� fo� 4� tp� diskette� a� well� bu� ther� i� � �
seriou� compatibilit� proble� whe� yo� tr� t� rea� � dis� i� � 4� �
tp� driv� tha� wa� formatte� an� writte� o� � 9� tp� drive.� T� �
mak� � cop� o� � diskett� � hav� t� cop� i� t� anothe� driv� the� �
cop� i� back� bu� thi� seem� lik� � smal� inconvenienc� compare� �
t� th� pric� o� � mor� flopp� drives� 

13� � jus� picke� u� � Tea� FD55GFv-1� 5.25� 9� tp� driv� whic� � �
a� ver� impresse� with� I� i� a� exac� replacemen� fo� m� ol� �
800� FD55� 96 tp� driv� bu� i� wil� als� suppor� th� IB� A� 1.� �
me� hig� densit� 500� transfe� rat� diskettes� I� ha� a� �
extremel� quie� stepper� look� identica� t� m� FD55B�-1� 4� tp� �
driv� fro� th� front� an� ha� th� sam� strappin� layout� Th� �
syste� ca� automaticall� detec� th� densit� o� th� diskett� an� �
adjus� th� driv� accordingly� (I� th� hig� densit� mod� yo� ca� �
als� configur� i� t� appea� t� b� a� 8� driv� t� th� system.�  A� �
unde� $12� i� look� lik� th� day� o� th� 8� floppie� ar� over.

14� T� us� m� ol� IMSA� SI� board� wit� th� XL-M18� � ha� t� cu� �
th� trace� goin� t� th� ol� 2mh� ph� cloc� lin� o� thei� S-10� �
edg� connector� whic� i� no� 6mh� (pi� 24� an� jum� the� ove� t� �
th� ne� IEE� 2mh� cloc� lin� (pi� 49)� Thi� modificatio� ma� b� �
necessar� o� othe� ol� board� a� well.

15� � seria� printe� ca� b� connecte� t� si� ch1� Connec� � RS23� �
paddl� boar� betwee� J� an� you� printer� Loo� a� ite� � abov� �
fo� th� pinou� o� th� paddl� card� Th� ct� lin� mus� b� a� � �
positiv� leve� fo� th� uar� t� outpu� characters� I� ca� b� use� �
fo� th� printe� bus� han� shak� signal� Takin� i� negativ� wil� �
sto� outpu� t� th� printer� Th� standar� configuratio� o� th� �
syste� wil� sen� al� LST� devic� outpu� t� si� ch1� 

.pa�
.TC  ZCPR3.............................................PAGE #
                              ZCPR3

Thi� implementatio� support� th� followin� ZCPR� package� an� �
commands� Pleas� refe� t� th� ZCPR� manua� b� Richar� Con� fo� �
ful� informatio� o� eac� command� use� Yo� ca� us� th� SHOW.CO� �
utilit� progra� t� vie� th� command� tha� ar� supporte� an� se� �
where each package resides in memory.

Command Processor Commands

Thes� command� ar� containe� i� th� 2� ZCPR� Consol� Comman� �
Processo� (CCP)� The� ar� loade� int� ra� eac� tim� th� syste� �
doe� � col� o� war� boo� an� ar� availabl� fo� us� wheneve� th� �
th� Drive/User:� promp� i� present.

     SAVE n file    ;Saves n pages starting at 100h to file
     GET adr file   ;Load a file into the tpa @ hex address
     JUM� ad�       ;jum� t� he� addres� � execut� code in tpa
     
Resident Command Package

Thes� command� ar� containe� i� th� M180.RC� file� I� i� loade� �
int� memor� abov� th� BIO� o� col� boot� b� th� LDR.CO� utilit� �
program� Onc� loade� th� followin� command� wil� b� available� �
(Sinc� thes� routine� sta� i� memory� the� provid� ver� quic� �
response.)

     H              ;Display list of commands.
     CP dest=source ;Copy source file to dest file.
     ECHO string    ;Echo string back to console.
     ERA file       ;Erase file(s).
     NOTE string    ;Treat string as a comment.
     P adr          ;Peek at memory & display in hex & ascii.
     POKE adr val   ;Poke hex or ascii values into memory.
     PROT file atrb ;Set/reset files R/O or SYS attributes.
     REN new=old    ;Rename old file to new.
     WHL pwd        ;Set/Reset Wheel byte (pwd='SYSTEM').
     WHLQ           ;Display Wheel status.
     
     Th� abov� ar� al� standar� command� a� describe� i� th� �
�����ZCPR� manual� Th� followin� ne� comman� wa� adde� t� displa� �
�����th� XL-M18� Memor� Managemen� Uni� register� an� optionall� �
�����chang� th� memor� bank.

     BANK      Display the current MMU register values.

     BANK n    Se� th� tp� BAN� numbe� t� � (� o� 1� an� displa� �
���������������th� MM� registers� 
.pa�
Flow Command Package

Thes� command� ar� containe� i� th� M180.FCP file� I� i� loade� �
int� memor� above the BIOS wit� LDR.CO� jus� lik� M180.RC� abov�.
Onc� loade� th� followin� additiona� command� wil� b� available:

     IF op     Se� th� flo� stat� t� th� valu� o� op.
     ELSE      Toggle the flow state.
     FI        Terminate the IF level.
     XIF       Exit all pending IFs back to level 0.

     The following options can be used with the IF command:

     ER        = True if error flag is set.
     EX afn    = True if file exists.       
     IN        = True if T,Y,<cr> or <sp> are input at console.
     NU afn    = True if afn is null.

Whe� th� flo� stat� i� tru� consol� command� ar� processe� a� �
usual� I� th� flo� stat� i� se� t� false� consol� command� wil� �
b� rea� bu� no� executed� On� o� th� bes� use� o� thi� featur� i� �
selectiv� executio� o� program� withi� ZEX batc� comman� files.

Input Output Package

Th� IO� featur� o� Zsyste� allow� yo� t� writ� custo� driver� fo� �
you� I� device� a� � separat� IO� segment� The� ca� the� b� �
easil� adde� t� th� syste� wit� th� LDR.CO� utility� (Yo� ma� �
wan� t� hav� severa� differen� IO� segment� sinc� the� ca� b� �
change� s� easily.� Onc� th� IO� segmen� i� loaded� th� �
DEVICE.CO� utilit� i� use� t� displa� an� chang� th� devic� I� �
assignments� Yo� ca� als� us� th� RECORD.CO� utilit� t� sav� CON� �
o� LST� outpu� t� � dis� file� � sampl� X�-M18� IO� i� include� �
alon� wit� sourc� code� Yo� ca� modif� i� t� mee� you� needs.

Th� IO� memor� are� i� initialize� t� th� specification� i� th� �
"ZCPR� an� IOPs� tutoria� b� Richar� Conn� Th� jum� vecto� �
locate� a� BIOS+� i� als� modifie� durin� col� boo� t� addres� a� �
interna� IO� vecto� tabl� withi� th� BIO� fo� th� BIO� devic� �
drivers� Thi� allow� a� IO� segmen� t� locat� th� BIO� devic� �
routine� throug� th� ol� col� boo� vector.
.pa�
STARTUP.COM Alias

Whe� th� syste� i� col� boote� ZCPR� load� th� fil� STARTUP.CO� �
an� execute� it� STARTUP.CO� i� a� ALIA� progra� tha� execute� �
the followin� comman� lines:

     LDR M180A.RCP,M180.NDR,M180.FCP,XLM11.IOP
     I� ~EXIS� SYSTEM.Z3T;TCSELEC� SYSTEM;FI
     LD� SYSTEM.Z3T;TPASIZE

Thi� finishe� th� initializatio� b� allowin� yo� t� selec� you� �
termina� an� loadin� th� � ZCPR� package� int� thei� place� i� �
memor� abov� th� BIOS� Yo� ca� us� on� o� th� ALIA� utilitie� t� �
modif� STARTUP.CO� s� i� wil� als� execut� othe� initializatio� �
program� necessar� fo� you� system.

Zsystem Utilities

Th� ful� syste� include� app� 8� Zsyste� utilit� programs� Mos� �
o� th� utilitie� wil� displa� buil� i� hel� inf� i� yo� ente� th� �
followin� comman� line:

     Utility //     ;Utility= Utility program name

Mos� o� th� utilitie� mus� b� installe� befor� the� ca� b� used� �
Al� o� th� utilitie� include� wit� th� syste� wer� alread� �
installe� fo� yo� b� runnin� th� followin� comman� line.

     Z3INS M180 ZSYSTEM.INS

Z3INS.CO� an� M180.EN� shoul� b� o� th� dis� alon� wit� th� �
program� bein� installed� Whe� yo� ad� ne� utilitie� t� thi� �
syste� yo� wil� hav� t� instal� the� lik� this� 

     Z3INS M180 Utility.COM

� recommen� downloadin� th� followin� Publi� Domai� program� fro� �
you� loca� ZNOD� an� renamin� the� fo� us� a� you� DI� an� TYP� �
commands.

     DIR.COM  = SD115.COM
     TYPE.COM = TYPEL36.COM
.pa�
.TC  CUSTOMIZATION.....................................PAGE #
                          CUSTOMIZATION

Th� ZSETUP.CO� utilit� no� perform� ful� syste� customization� �
(I� i� n� longe� necessar� t� edi� an� reassembl� th� syste� t� �
configur� it.� ZSETU� give� yo� th� optio� o� configurin� th� �
OSLOAD.CO� fil� o� configurin� th� syste� presentl� i� memory� �
ZSETU� use� th� OSLOAD.SY� fil� t� determin� th� patc� addresse� �
withi� th� syste� s� mak� sur� i� i� i� th� curren� director� �
befor� ZSETU� i� run� ZSETU� mus� b� i� ban� � t� wor� properly� �
I� wil� abor� i� yo� tr� t� ru� i� fro� ban� 1.

ZSETU� i� men� drive� an� i� prett� sel� explanatory� Th� onl� �
wa� yo� ca� ge� int� troubl� i� b� no� backin� u� you� �
distributio� disk� Whe� ZS130.ZE� i� ru� i� th� dis� mod� i� wil� �
overwrit� an� existin� OSLOAD.CO� fil� tha� i� o� th� disk� I� �
an� mistake� ar� mad� i� configurin� th� syste� yo� won'� b� abl� �
t� ge� i� t� boo� agai� s� mak� sur� you� origina� OSLOAD.CO� i� �
backe� up!!!

Summar� o� ZSETU� configuratio� parameters:

     1� SI� por� parameters
     2� IOBYTE
     3� Physica� dis� driv� parameters
     4� Logica�/physica� driv� assignments
     5� Flopp� moto� tur� of� time
     6� Wai� states
     7� Signo� messag� version

I� yo� hav� th� ZBIO� dis� yo� ca� modif� th� sourc� files� �
reassembl� the� wit� ZA� 3.0 an� the� us� thi� comman� lin� t� �
generat� you� ne� syste� wit� ZEX.CO� an� LINK.CO� fro� Digita� �
Researc� Inc.

     ZE� ZOS193     � Generat� OSLOAD.CO� b� linkin� al� the
                    ; BIOS modules.

.TC  NEW UTILITIES.....................................PAGE #
                          NE� UTILITIES

Th� followin� utilitie� ar� no� par� o� th� syste� package.

     FMTF.COM  Thi� i� � tabl� drive� Mult�-forma� flopp� dis� �
���������������initializ�/verif� program� Se� FMTF.DO� fo� ful� �
���������������instructions o� it'� use.

     PARTH.COM Thi� i� � tabl� drive� Har� dis� partitio� �
���������������utility� Se� PARTH.DO� fo� ful� instruction� o� �
���������������it'� use.

     ZEX.COM   Thi� i� ZE� ver� 3.1� whic� ha� bee� slightl� �
���������������modifie� t� ru� i� eithe� bank� o� bank1� I� doe� �
���������������� BIO� versio� chec� an� wil� onl� wor� wit� �
���������������Zsyste� ver� 1.3� an� up� Earlier version� o� ZE� �
���������������wil� no� wor� wit� thi� banke� Zsystem!�.TC  MEMORY BANK OVERVIEW..............................PAGE #
                      MEMOR� BAN� OVERVIEW

Thi� BIO� no� utilize� � memor� bank� fo� th� Dis� Operatin� �
System� Th� primar� advantag� o� doin� thi� i� t� provid� th� �
maximu� possibl� TP� siz� fo� applicatio� programs� Whe� th� �
syste� col� boot� BAN� � i� selecte� fo� th� TPA� I� i� app� 58� �
i� size� Severa� utilitie� wil� onl� operat� fro� ban� 0� Yo� ca� �
easil� chang� betwee� bank� wit� th� followin� RC� comman� whic� �
i� alway� residen� i� memor� an� ca� b� execute� wheneve� th� ZO� �
comman� lin� promp� i� present.

     BAN� 0    ;selec� ban� � fo� th� TPA
     BAN� 1    ;selec� ban� � fo� th� TPA

T� mak� th� banke� BIO� schem� wor� wit� th� larges� possibl� TPA�
i� wa� necessar� t� plac� ZCPR� a� � no� standar� addres� an� th� �
siz� o� th� BDO� i� ban� i� onl� � bytes� Th� onl� progra�s tha� � �
hav� foun� tha� thi� affect� ar� th� Z3LO� utilit� an� ZEX� Th� �
syste� include� � modifie� ZEX� bu� instea� o� usin� Z3LO� yo� �
should refe� t� thi� addres� map:

                           Hig� Memory
        �----------- Unbanke� Commo� Memor� -----------+
        �                                              |
        �  addres� rang�  siz�   disc.                 |
        �  ------------� -----� ---------------�       |
        �   ffd� � fff�    4�    Z� ex� stac�          |
        �   ff0� � ffc�   20�    Z� comman� buffe�     |
        �   fe8� � fef�   12�    Z� tca�               |
        �   fe0� � fe7�   12�    Z� Environmen� desc   |
        �   fdf�            �    Z� Whee� byt�         |
        �   fdf� � fdf�    1�    Z� Externa� pat�      |
        |   fdd0 � fdf�    3�    Z� Externa� FC�       |
        �   fd8� � fdc�    8�    Z� messag� buffe�     |
        �   fd0� � fd7�   12�    Z� shel� stac�        |
        �   fc0� � fcf�   25�    Z3 Name� director�    |
        �   fa0� � fbf�   51�    Z� FCP                |
        �   f20� � f9f�  204�    Z� RCP                |
        �   ec0� � f1f�  153�    Z� IO�                |
        |   e80� � ec0�  102�    ban� manage�          |
        |   e7f� � e7f�     �    Upper BDOS vecto�     |
        |   e00� � e7f�  204�    ZCPR�                 |
        �                                              |
        +----------------------------------------------+

  �-� Ban� � o� Banke� Mem. --�  ��- Ban� 1 o� Banke� Mem. --+�
  �                           �  �                           |
  |  ae0� � dff�  BIO�        |  �                           |  
  �  a00� � adff  BDO�        �  �                           |    
  |  800� � 9fff  DS�         |  �                           |
  |  010� � 7ff�  Ban� � TPA  |  �  0100 � dff�  Ban� 1 TPA  |
  |  000� � 00f�  Pag� �      �  �  000� � 00f�  Pag� 0      |
  �                           �  �                           |
  ��--�������������������������  +---------------------------+
                           LO� MEMORY�
� DS� � Dynami� Storag� Are� fo� dis� tables� secto� buffer� �  �
        etc� � 
� Pag� � � CP/� pag� � vector� � buffer� )

Ther� i� n� fixe� limi� o� th� siz� o� th� BDO� o� BIO� s� lon� a� �
thei� �combine� siz� fit� int� ban� � an� leave� reasonabl� �roo� �
fo� th� DS� an� TPA� 

Th� commo� memor� are� i� i� physica� ban� 0� Thi� phantom� ou� �
e00� t� fff� i� bank� � throug� n� ZCPR� is save� i� ban� � �
a� e00�  an� DMA'e� bac� t� ban� � durin� war� boots� Thi� allow� �
applicatio� program� t� overla� ZCPR� jus� lik� th� CP/� �
specification� t� provid� � 58� tp� whic� appear� t� b� jus� �
abou� a� larg� a� possibl� fo� � ful� Zsyste� implementation.

Bank� � thr� � ar� reserve� fo� Ra� Dis� use� The� ar� accesse� �
throug� DM� a� physica� memor� s� th� abov� commo� memor� area�
assignment does no� us� an� o� th� space.

.pa�.TC  T-FUNCTION CALLS..................................PAGE #
                        T-FUNCTIO� CALLS

Th� followin� TurboDOS compatibl� �-functio� call� ar� supporte� �
b� th� system� The� provid� � convenien� an� portabl� wa� t� �
acces� th� interrup� drive� SI� routine� an� th� tp� ban� selec� �
routines� T� perfor� � �-functio� yo� mus� loa� th� functio� �
numbe� int� th� � register� loa� an� necessar� parameter� an� �
cal� 50h� (Yo� shoul� assum� tha� al� register� wil� b� destroye� �
durin� th� call.� 

     NAME:          COMST
     CAL� WITH:     c� 34
                    d� SI� channe� numbe� (� o� 1)
                    a� � i� inpu� characte� i� no� available
     COMMENTS:      Retur� th� inpu� statu� o� th� specifie� SI� �
��������������������channel.

     NAME:          COMIN
     CAL� WITH:     c� 35
                    d� SI� channe� numbe� (� o� 1)
     RETURNS:       a� inpu� character
     COMMENTS:      Inpu� � characte� from th� specifie� SI� �
��������������������channel�

     NAME:          COMOUT
     CAL� WITH:     c� 36
                    d� SI� channe� numbe� (� o� 1)
                    e� outpu� character
     COMMENTS:      Outpu� � characte� t� th� specifie� SI� �
��������������������channel�  
     
     NAME:          SETBAUD
     CAL� WITH:     c� 37
                    d� SI� channe� numbe� (� o� 1)
                    e� bau� rat� cod� 
                        4�  150�  5�   300�  ��   60�
                        7� 1200� 1�=  2400� 1��  4800
                       1�� 9600� 1�� 19200�  �= 38400
     COMMENTS�      Set� bau� rat� o� specifie� SI� channe�.

     NAME:          GETBAUD
     CAL� WITH:     c� 38
                    d� SIO channe� numbe� (� o� 1)
     RETURNS:       a� bau� rat� cod�   (bit� 0-3)
                        4�  150�  5�   300�  ��   60�
                        7� 1200� 1�=  2400� 1��  4800
                       1�� 9600� 1�� 19200�  �= 38400
     COMMENTS�      Return� curren� bau� rat� o� specifie� SI� �
                    channel.
.pa�   
     NAME:          SETMDM
     CAL� WITH:     c� 39
                    d� SI� channe� numbe� (� o� 1)
                    e� mode� contro� byte
                       bi� � se� t� asser� RTS
     COMMENTS:      Se� th� stat� o� th� mode� contro� signal� �
��������������������fo� th� specifie� SI� channel.

     NAME:          GETMDM
     CAL� WITH:     c� 40
                    d� SI� channe� numbe� (� o� 1)
     RETURNS:       a� mode� statu� byte
                       bi� � se� fo� CT� asserted
                       bi� � se� fo� DC� true
     COMMENTS:      Return� th� curren� stat� o� th� mode� �
��������������������contro� signal� fo� th� specifie� SI� �
��������������������channel.

     NAME:          MEMBNK
     CAL� WITH:     c=43
                    e� -� t� interrogat� th� tp� bank
                    e� � o� � t� se� th� tp� bank
     RETURNS:       a� ban� selecte� fo� th� tpa.
     COMMENTS:      Ge� o� se� th� TP� memor� bank� (Th� ban� �
��������������������doe� no� actuall� chang� unti� th� nex� war� �
��������������������boot� Otherwis� � progra� woul� han� u� th� �
��������������������syste� b� switchin� itsel� ou� o� memory.)

.TC  I/O PORT ADDRESSES................................PAGE #
                       I/O PORT ADDRESSES

Loo� a� th� include� HD64180.LI� an� M180.LI� file� i� yo� nee� �
t� kno� th� addres� o� an� I/� port� o� th� board� Remembe� tha� �
th� HD6418� I/� registe� bas� addres� i� relocate� t� 80� i� th� �
loade� module� Thi� allow� existin� softwar� an� S-10� I/� board� �
t� wor� without being re-addressed.

.TC  S-100 INTERRUPTS..................................PAGE #
                        S-100 INTERRUPTS

� mod� � interrup� vecto� tabl� i� based a� BIO� � 100� fo� th� �
� interrup� line� o� th� S-10� buss� Applicatio� program� ca� us� �
th� WBOO� jm� vecto� a� 1� t� locat� an� initializ� th� necessar� �
interrup� vector� (� haven'� ha� tim� t� verif� tha� th� X�-M18� �
�-10� interrup� hardwar� i� functiona� s� goo� luck.)

.pa�.TC  DISK ASSIGNMENTS..................................PAGE #
                        DIS� ASSIGNMENTS

Th� ASSIGN.CO� utilit� progra� i� use� t� chang� th� �
logical/physica� dis� assignment� fro� th� console� Th� mai� �
reaso� i� doin� thi� i� s� an� driv� ca� b� reassigne� a� A� t� �
tak� advantag� o� driv� A'� specia� acces� feature� lik� th� �
root� director� an� aut� logi� o� war� boots� Thi� featur� i� �
als� usefu� fo� reassignin� � har� dis� o� ra� dis� a� th� A� �
driv� t� tak� advantag� o� it� highe� spee� performanc� fo� you� �
mos� use� drive� ASSIGN.CO� wil� onl� execut� fro� ban� 0� I� yo� �
attemp� t� ru� i� fro� ban� � a� erro� messag� wil� b� displaye� �
an� i� wil� abort� Her� ar� som� example� o� ASSIGN.CO� comman� �
lines:

     BAN� 0              ;Selec� ban� � fo� th� tpa
     ASSIGN /�           ;Displa� buil� i� hel� info
     ASSIG�              ;Displa� curren� driv� assignments
     ASSIG� A:�          ;Assig� ph� driv� � (ra� disk� t� A:
     ASSIG� A:6,B:�      ;Assig� ph� driv� � (har� disk� t� A:
                         �an� ph� driv� � (flopp� 0� t� B:

Whe� th� syste� i� initiall� configured� eac� driv� i� assigne� � �
uniqu� physica� driv� number� Th� syste� wil� suppor� u� t� 2� �
physica� drive� an� come� wit� th� followin� 1� physica� drive� �
(�-15� configured� The� ca� b� assigne� t� an� o� th� 1� logica� �
drive� (A�-P:)� Accessin� th� sam� driv� b� mor� tha� on� Driv� �
lette� ca� caus� los� o� dat� du� t� th� CP/� typ� dis� �
allocatio� schem� tha� Zsyste� uses� T� insur� tha� thi� doe� no� �
happen� ASSIGN.CO�  wil� clea� an� duplicat� physica� assignment� �
t� � whe� � ne� assignmen� i� made� Yo� canno� assig� th� �
physica� driv� numbe� presentl� assigne� t� A� t� an� othe� �
logica� drive� Thi� woul� clea� th� assignmen� fo� A� t� � whic� �
wil� han� th� syste� whe� i� war� boots� I� yo� attemp� t� d� s� �
ASSIGN.CO� wil� displa� a� erro� messag� an� abort� T� ge� aroun� �
thi� yo� jus� assig� A� t� � differen� ph� driv� first� the� th� �
ol� physica� driv� ca� b� reassigne� t� an� logica� drive� Th� �
initia� logical/physica� assignmen� is:

     A: �  1 (5.25" 48 tpi floppy drive with ds0 strapped)
     B: =  2 (5.25" 48 tpi floppy drive with ds1 strapped)
     C: =  3 (5.25" 96 tpi floppy drive with ds2 strapped)
     D: =  4 (8" floppy drive with ds3 strapped)
     E: =  5 (Ram disk)
     F: �  � (har� dis� � partitio� 0)
     Ǻ �  � (har� dis� � partitio� 1)
     H� �  � (har� dis� � partitio� 2)
     I� �  � (har� dis� � partitio� 3)
     J� � 1� (har� dis� � partitio� 4)
     K� � 1� (har� dis� � partitio� 5)
     L� � 1� (har� dis� � partitio� 6)
     M� � 1� (har� dis� � partitio� 7)
     N� � 1� (har� dis� � partitio� 8)
     O� � 1� (har� dis� � partitio� 9)
     P� �  � (unassigned drive)
�
.TC  IMP MODEM PROGRAM.................................PAGE #
                        IMP MODEM PROGRAM

Th� IMP24� mode� progra� b� Ir� Hof� i� no� include� wit� th� �
system� I� i� calle� IMPXLM1.CO� an� ha� alread� bee� configure� �
t� us� si� channe� � o� th� XL-M180� Yo� ca� use� thi� IM� �
progra� t� downloa� th� IMP244.LB� librar� fil� whic� i� �
availabl� o� mos� Z-node� aroun� th� country� I� contain� � �
detaile� .DO� fil� an� utilitie� t� chang� phon� numbers� Th� IM� �
progra� mus� b� use� wit� a� RS23� "AT� comman� se� mode� �
connecte� t� si� ch� (J8� throug� � cabl� wit� pin� � thr� � an� �
2� wire� pi� fo� pin� Yo� mus� se� th� strap� o� th� RS23� paddl� �
car� wit� J� t� � an� J� t� B� Pi� 1� o� th� 148� i� shoul� b� �
remove� fro� it'� socke� o� th� paddl� board� otherwis� i� wil� �
driv� th� Carrie� Detec� outpu� lin� o� you� mode� an� possibl� �
blo� on� o� th� � chip� tha� woul� b� drivin� eac� other.� � hav� �
verifie� tha� thi� configuratio� o� th� IM� progra� wil� wor� �
wit� � U� Robotic� Courie� modem� (I� yo� don'� hav� � mode� ye� �
� strongl� recommen� th� Courier� Mos� RBB� system� us� th� �
Courie� an� it'� price� les� tha� mos� comparabl� units.� I� yo� �
hav� � differen� bran� o� mode� yo� ma� hav� t� mak� som� �
changes� (Yo� mus� us� ZAS.CO� t� reassembl� th� overla� source� �
M8� � L8� won'� generat� � .HE� fil� tha� wil� properl� overla� �
th� mai� IM� program.)

.TC  MOVE-IT OVERLAY...................................PAGE #
                         MOVE-IT OVERLAY

A� overla� fil� name� XLMOVIT1.HE� i� include� t� configur� th� �
MOVE-IT.CO� ver� 3.� computer/compute� fil� transfe� progra� b� �
Wool� Softwar� System� fo� th� XL-M180� � Ze� comman� fil� i� �
als� include� t� perfor� th� installation� Th� seria� channe� o� �
th� othe� compute� mus� b� connecte� t� si� ch� o� th� XL-M180� �
Loo� a� ite� � unde� Gettin� Starte� � fe� page� bac� fo� th� �
pinou� o� th� channe� � RS23� paddl� card� Th� MOVE-I� progra� �
mus� b� purchase� fro� Wool� Software� bu� i� i� indispensabl� �
fo� transferrin� file� betwee� system� wit� incompatibl� dis� �
formats.

.TC  DISCLAIMER........................................PAGE #
                           DISCLAIMER

A� usua� w� hav� t� war� yo� tha� yo� mus� accep� al� th� risk� �
wit� thi� software� I� ha� onl� ha� � fe� day� o� testing� bu� w� �
fel� yo� woul� rathe� ge� � versio� no� tha� possibl� ha� � fe� �
bug� ove� � versio� nex� mont� tha� ha� bee� full� tested� Th� �
effor� tha� ha� gon� int� thi� wil� probabl� neve� b� full� �
compensate� financially� bu� i� wil� b� mor� tha� wort� whil� i� � �
fe� mor� peopl� ar� abl� t� se� th� powe� tha� i� stil� availabl� �
i� � bi� machines� � hop� thi� versio� ca� ge� everyon� goin� �
til� th� nex� releas� whic� wil� reall� sho� yo� wha� th� HD6418� �
ca� do!

.PA�.CW 24
USER'� GUID� INDEX

.CW 10



Command Processor Commands, 1�   Memor� Bank Overview, 17            

Customization, 16                Minimum Hardware Requirements, 6    

                                 MOVE-IT Overlay, 22                 

Disclaimer, 22                                                       

Disk Assignments, 21             New Utilities, 16                   

                                                                     
Features, 4                      Overview, 3                         

Flow Command Package, 14                                             

Futur� Enhancements, 6           RAM DISK, 8                         

                                 Resident Command Package, 13        
Gettin� Started, 9                                                   

                                 S-100 INTERRUPTS, 20                

I/O Port Addresses, 20           STARTUP.COM Alias, 15               

IMP Mode� Program, 22            Supported Flopp� Dis� Formats, 7    

Input Output Package, 14                                             

IObyte, 9                        T-Function Calls, 19                

                                                                     
Limitations, 5                   ZCPR3, 13                           

                                 Zsystem Utilities, 15                                               




Trademarks:�������� �-SYSTEM� ZCPR3� ZRDOS� Echelo� Inc� �
��������������������TurboDOS� Softwar� 2000� HD64180� Hitachi� �
��������������������CP/M� Digita� Researc� Inc� M80� MicroSoft� �
��������������������MOVE-IT� Wool� Softwar� Systems.
