







                              V T C A P  

                 Video Oriented TCAP Database Manager

                        Version 1.0 - 08/21/87








































Access Programming RAS - 14385 SW Walker Rd. B3 - Beaverton, OR  97006
�





                  T A B L E   O F   C O N T E N T S


          Introduction ....................................  3
     
          Program Description .............................  4
     
               A - Add ....................................  5

               D - Delete .................................  5

               H - Help ...................................  6

               L - List ...................................  6

               M - Merge ..................................  6

               N - Next ...................................  7

               P - Previous ...............................  7

               S - Search .................................  7

               U - Update .................................  8

               Z - Z3 Load ................................  8

               X - Exit ...................................  8

          Appendix A - TCAP File Description ..............  9

          Appendix B - Program Listings ................... 12
















�                             Introduction


     VTCA� i� � vide� oriente� databas� manage� designe� specificall� �
t� manipulat� th� Termina� CAPabilitie� (TCAP�� database�� Currently� �
th� onl� wa� t� modif� o� ad� terminal� t� a� existin� TCA� i� t� edi� �
th� sourc� cod� an� reassembl� th� code�� Thi� i� a� unfai� limitatio� �
t� thos� whos� abilitie� wit� assemble� ar� limite� o� non-existant� �
Eve� thos� o� u� wit� assemble� ability�� mus� resor� t� 'patching� o� �
re-assembling to just experiment with different terminal codes.

     A� � syso� runnin� ZCPR3/ZRDO� wit� BYE51� an� PBBS�� � wa� ver� �
intereste� i� th� growin� suppor� o� TCAP� B� givin� th� ordinar� use� �
� metho� wit� whic� t� experimen� wit� TCA� listing� an� ad� suppor� �
fo� terminal� o� hi� choice�� � hop� t� pu� TCA� suppor� o� mor� an� �
mor� systems�� Th� bes� wa� t� accomplis� thi� i� t� suppl� th� use� �
wit� softwar� tha� wil� mak� supportin� suc� idea� easier�� VTCAР i� �
jus� on� o� � fe� softwar� package� availabl� fo� thi� purpose�� Othe� �
such programs now available, or currently under development are,



PTCAP - TCAP installation package for PBBS systems     AVAILABLE NOW

VTCAP - TCAP database manager                          AVAILABLE NOW

PCAP  - Printer capabilities package               UNDER DEVELOPMENT

PLIB  - Printer support library                    UNDER DEVELOPMENT

GCAP  - Graphics capabilities package              UNDER DEVELOPMENT

GLIB  - Graphics support library                   UNDER DEVELOPMENT


Future of VTCAP

     Support for both printer and graphics packages when released.

     Prin�� functio� fo� hardcop� printou� o� individua� termina� i� �
�����databas� o� � lis� o� al� terminals.

     Additio� o� � tes� modul� tha� display� th� effect� o� th� chose� �
�����display attributes

     Installatio� functio� tha� wil� actuall� instal� you� selecte� �
�����TCAP in your system environment.







�                 V T C A P - T C A P   M A N A G E R

                         Program Description



     Th� basi� functio� o� thi� progra� i� t� provid� th� man�� user� �
o� th� Z� system� an� Termina� CAPabilit� file� (TCAP's� � metho� t� �
easil�� modif� th� TCA� file� o� thei� systems�� TCA� Manage� (VTCAP� �
gives you the following: 

     1.   Ad�  � termina� t� th� database
     2.   Delet� � terminal�
     3.   Searc� fo� � requeste� terminal
     4.   Sca� forwar� o� backwar� throug� th� listings
     5.   Updat� th� currentl� displaye� terminal
     6.   Lis� al� o� th� terminal� i� th� database
     7.   Merg� tw� TCA� file� 
     8.   Switch between Z3TCAP files
     9.   Provide� yo� wit� complet� on-lin� hel� fo� al� functions

     Th� distributio� librar� fil� contain� al� o� th� file� necessar� �
t� completel�� assembl� an� lin� VTCAP�� Thi� i� � vide� oriente� �
routin� an� require� certai� informatio� about your system.

     Thi� progra� i� offere� int� th� publi� domai� an� ma�� b� 
redistribute� withou� permission� VTCA� i� th� sol� propert� o� Acces� �
Programmin� RAӠ an� canno�� b� sol� seperatel�� o� package� wit� �
product� a� a� incentiv� t� purchas� withou� prio� writte� permissio� �
fro� th� author�� An� suggestion� o� modification� shoul� b� directe� �
t� m� personall�� a�� th� syste� below�� W� wil� NOԠ suppor�� an� �
modification� tha�� hav� no� bee� previousl�� cleare� throug� thi� �
system.











Access Programming RAS
14385 SW Walker Rd. B3
Beaverton, OR  97006

Terry Pinto - Owner/SYSOP

(503) 646-4937  VOICE
(503) 644-0900  (300/1200 baud - 24 hours/day)


�
     ADD

     Th� ad� functio� wil� allo� th� use� t� ad� additiona� termina� �
listing� t� th� database�� Whe� yo� ente� th� AD� mode�� th� dat� wil� �
b� cleare� fro� th� displa� givin� yo� � 'blank� recor� t� wor� with� �
A�� thi� tim� yo� ma� ente� th� information�� 

     Ther� ar� thre� type� o� field� i� whic� yo� ma� ente� data�� Th� �
firs�� o� whic� i� th� fixe� lengt� string�� Th� onl� fiel� tha�� use� �
thi� entr� metho� i� th� termina� name�� Yo� ar� limite� t� entr�� o� �
sixtee� characters�� I� yo� mak� � mistake�� yo� ma� us� th� backspac� �
t� repositio� th� curso� i� th� field�� Whe� entr� i� complete�� pres� �
<ENTER�� t� terminat� th� field�� Thi� wil� automaticall�� eras� an� �
character� t� th� righ�� o� th� curso� effectivel�� clearin� th� �
remainder of the field.

     Th� secon� typ� o� entr� i� th� singl� character�� Al� o� th� �
arro� key� an� scree� delay� ar� represente� b� thi� type�� Thi� fiel� �
i� automaticall� terminate� whe� yo� ente� � characte� an� th� curso� �
wil� b� advance� t� th� nex� field�� I� yo� mak� � mistake�� jus� us� �
the arrow key to reposition the cursor. 

     Th� thir� typ� i� th� variabl� lengt� string�� Al� o� th� scree� �
contro� string� ar� formatte� wit� thi� typ� o� input�� Durin� input� �
yo�� ma� us� th� backspac� t� correc� mistakes�� Pressin� th� <ENTER� �
ke� wil� terminat� inpu� o� th� fiel� an� advanc� t� th� next� T� ski� �
� field�� jus� ente� � carriag� return�� REMEMBER��  TH� ENTR٠ OƠ � �
CARRIAGE RETURN WILL ERASE THE REMAINDER OF THE FIELD.

     Whe� yo� exi� fro� th� AD� mode�� yo� wil� b� prompte� t� ente� � �
ne� versio� number�� Us� an� tw� digi� numbe� i� th� followin� format� �
   
     Version Number:  2.7     [major.minor]
     
     Anytim� yo� mak� an� change� t� th� database�� increas� th� mino� �
revisio� numbe� b� one.


     DELETE

     Th� delet� functio� i� � toggl� an� wil� allo� yo� t� 'mark�� � �
recor� fo� deletion�� Whe� s� marked�� th� dat� i� th� recor� wil� �
appea� i� th� standou� mod� an� th� wor� 'DELETED� wil� appea� a� th� �
to� o� th� screen�� Onc� � recor� ha� bee� marke� fo� deletion� i� ma� �
b� reclaime� b� usin� th� sam� function�� Th� firs� tim� th� [Dݠ i� �
pressed�� th� recor� wil� b� marke� fo� deletion�� th� nex� time�� i� �
wil� b� reinstated�� Th� marke� record� ar� no� delete� unti� yo� exi� �
th� database�� A� tha� tim� yo� wil� b� prompte� fo� � versio� number� �
Use the same proceedure as outlined above.




�     HELP

     Th� hel� functio� wil� provid� yo� wit� on-lin� hel� o� al� mode� �
o� operatio� i� th� program� B� pressin� [H]� yo� ca� ge� th� firs� o� �
th� HELР screens�� Thi� scree� wil� presen� yo� wit� hel� o� th� �
comman� lin� synta�� o� th� program�� Yo� ma� invok� mos�� o� th� �
operation� o� th� progra� fro� th� ZCPR� comman� lin� b� specifin� th� �
appropriat� option�� Al� o� th� informatio� yo� wil� nee� o� ho�� t� �
accomplis� thi� i� displaye� o� thi� screen�� A� th� botto� o� th� �
display� yo� wil� se� � promp� t� selec� th� topi� yo� wis� hel� with� �
Al� o� th� topic� ar� represente� b� � /o�� T� reques� hel� wit� � �
particula� topic�� jus� pres� th� characte� afte� th� /� Fo� instance� �
the help function is shown as follows:

     /H - Help

     T� selec�� hel� wit� th� hel� functions�� jus� pres� H�� I� yo� �
pres� � ke� tha� i� no� supported�� a� erro� messag� wil� b� displaye� �
o� th� screen� Whe� yo� selec� � topic� th� informatio� requeste� wil� �
b� displaye� o� th� las� fiv� line� o� th� displa�� leavin� th� �
origina� hel� screen�� Thes� botto� fiv� line� wil� ac� lik� � windo� �
displayin� th� require� informatio� whe� needed�� T� exi� bac� t� th� �
database, just press [X].


     LIST

     Th� lis� functio� wil� displa� al� o� th� terminal� currentl�� i� �
th� database� The� wil� b� displaye� i� th� orde� i� whic� the� appea� �
i� th� file�� Eac� scree� wil� displa� u� t� eight� terminal� i� fou� �
column� o� twenty�� An� delete� terminal� wil� b� displaye� i� th� �
standou� mode�� I� ther� ar� eight� terminal� o� les� yo� wil� se� th� �
entir� databas� o� on� scree� wit� th� [Strik� an� key� promp� a� th� �
bottom�� I� ther� ar� mor� tha� eight� terminals�� th� displa�� wil� �
paus� a� eight� an� displa� th� [more� prompt�� Her� yo� ma� pres� an� �
ke� t� se� u� t� eight� mor� listings.


     MERGE

     Thi� i� � ver� powerfu� function�� I� wil� allo� yo� t� creat� � �
TCA� fil� containin� al� o� th� uniqu� listing� i� tw� files�� Th� tw� �
file� bein� th� defaul� TCA� fil� (Z3TCAP.TCP� an� th� fil� specifie� �
o� th� comman� lin� o� loade� wit� th� 'Z� optio� withi� VTCAP�� Th� �
tw� file� ar� compare� an� al� o� th� uniqu� listing� ar� writte� t� �
a� outpu� file�� Z3TCAPxx.TCP� wher� x� i� th� versio� numbe� th� use� �
supplie� a� th� beginnin� o� th� merg� process� Yo� wil� wan� t� chec� �
ove� th� listing� ver� carefull� a� onl� th� inde� nam� i� compared� �
I� someon� change� th� inde� nam� i� on� file�� yo� wil� en� u� wit� �
tw� seperat� listing� fo� th� sam� terminal� � goo� exampl� o� thi� i� �
obtaine� b�� mergin� Z3TCAP2� wit� Z3TCAP20�� Th� merg� o� thes� tw� �
file� contai� tw� listing� eac� fo� th� HEAT� terminals�� bot� Heat� �


�an� ANSɠ modes�� Th� listin� fo� th� Genera� Termina� 10�� i� als� �
duplicated�� Carefu� checkin� o� th� outpu� fil� i� � smal� pric� t� �
pa�� fo� th� powe� o� th� merg� function�� Yo� ma� alway� g� i� late� �
with the delete mode and take care of any duplication.

     Th� merg� proces� i� ver� comple� i� natur� an� ha� bee� greatl� �
simplifie� i� th� descriptio� above�� Se� th� descriptio� o� th� TCA� �
fil� an� th� technica� descriptio� o� th� progra� module� i� th� �
appropriat� appendicie� fo� � mor� complet� descriptio� o� th� �
operation of this and other functions.


     NEXT

     Thi� functio� wil� repositio� th� databas� t� th� nex� recor� i� �
th� database�� N� inde� fil� i� use� therefor� th� steppin� i� don� �
sequentially�� Th� record� ar� alphabetize� an� therefor� shoul� b� i� �
'indexed' order.


     PREVIOUS

     Thi� i� th� opposit� o� th� abov� functio� an� wil� positio� th� 
databas� t� th� recor� befor� th� on� currentl� displayed�� Again� th� �
stepping is done sequentially through an alphabetized listing.


     SEARCH
     
     Th� searc� functio� i� use� t� locat� an�� desire� entr�� i� �
database�� Whe� enterin� th� searc� mode� yo� wil� b� prompte� fo� th� �
nam� o� th� termina� t� searc� for� Th� progra� wil� determin� betwee� �
uppe� an� lowe� cas�, s� b� exac� whe� specifin� th� searc� criteria.

                APPLE /// is not the same as Apple ///

     I� yo� reques� � nam� tha� i� no� i� th� database�� yo� wil� b� �
give� a� erro� messag� and�� afte� � shor� delay�� returne� t� th� �
'Ente� Filename� � prompt� I� th� searc� i� sucessful� th� searc� mod� �
wil� b� terminate� an� yo� wil� b� returne� t� th� comman� mod� o� �
VTCAP�� Th� nam� entere� mus� b� identica� t� th� nam� i� th� inde� �
sectio� o� th� databas� (se� th� sectio� o� th� descriptio� o� th� �
TCA� files)� I� yo� ar� unsur� o� th� spellin� o� th� wa� th� termina� �
i� described�� us� th� lis� functio� t� displa� th� terminal� i� th� �
database�� Onc� yo� hav� locate� � terminal�� yo� ma� sca� throug� th� �
databas� b� usin� th� [P]reviou� an� [N]ex� commands.








�
     UPDATE

     Th� updat� functio� i� ver� simila� i� operatio� t� th� ad� �
function�� Onc� yo� hav� selecte� th� termina� yo� wan� t� update� yo� �
selec�� [Uݠ an� th� curso� i� place� o� th� firs� characte� o� th� �
firs� fiel� i� th� record�� Th� <ENTER� ke� wil� terminat� fiel� inpu� �
an� advanc� th� curso� t� th� nex� field� Al� informatio� t� th� righ� �
o� th� cursor�� i� th� curren� field�� wil� b� los� whe� yo� terminat� �
th� field�� T� writ� th� dat� t� th� databas� us� '^W'� I� yo� wis� t� �
abor� th� curren� update�� pres� '^Q'� Th� updat� mod� wil� no� promp� �
fo� th� entr� o� � versio� number�� I� i� assume� tha� thi� mod� wil� �
b� use� mor� fo� experimentatio� an� correctin� o� typin� error� an� �
therefor� wil� no� requir� th� generatio� o� � highe� versio� number� �
I� yo� fee� th� nee� t� issu� � versio� numbe� fo� a� update� listing� �
you may rename the file externally.


     Z3 LOAD

     Th� Z�� Loa� functio� i� use� t� exi�� on� databas� an� loa� �
another� Yo� wil� b� prompte� fo� th� nam� o� th� databas� yo� wis� t� �
read�� DϠ NO� TYP� TH� FIL� EXTENT�� Al� file� shoul� b� o� th� for� �
Z3TCAPxx�� wher� x� i� th� versio� numbe� o� th� fil� t� b� loaded� I� �
yo� reques� � fil� tha� doe� no� exist�� yo� se� a� erro� message� an� �
yo� wil� b� returne� t� th� 'Ente� Filename�� � promp� allowin� yo� t� �
tr� agian�� I� you� reques� i� sucessful�� yo� wil� b� returne� t� th� �
VTCAР comman� level�� T� cance� th� filenam� entry�� ente� � carriag� �
return and the default Z3TCAP file will be loaded.

     Exit

     Thi� comman� i� sel� explanitory�� Al� ope� file� wil� b� closed� �
al� dis� housekeepin� wil� b� complete� an� yo� wil� b� returne� t� �
the operating system level, exiting the program.



















� 

                              Appendix A   

                        TCAP File Description


     T� understan� th� operatio� o� VTCAP�� yo� mus� firs�� understan� �
the TCAP file and how it is constructed.

     Th� TCAР fil� consist� o� tw� sections�� th� inde�� an� th� �
database� 

     Th� inde� sectio� contain� th� name� o� al� o� th� terminal� i� �
th� database�� Al� sortin� an� searchin� i� don� relativ� t� th� name� �
i� th� inde� section�� Eac� termina� nam� i� sixtee� byte� i� lengt� �
an� eigh� name� wil� occup� on� physica� recor� i� th� file�� I� th� �
termina� name� d� no� completel� fil� th� record� th� remainde� o� th� �
recor� wil� b� fille� wit� 0's�� Th� termina� name� ar� entere� i� th� �
databas� i� alphabetica� orde� thu� negatin� th� nee� fo� elaborat� �
inde�� files�� Eac� termina� nam� i� padde� wit� blank� t� sixtee� �
characters�� Th� followin� wil� illustrat� th� constructio� o� th� �
inde� sectio� o� TCA� files.

+---------------------------------------------+    +--------------+
00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F    0123456789ABCDEF

57 59 53 45 20 31 30 30 20 20 20 20 20 20 20 20    WYSE 100        
58 65 72 6F 78 20 38 32 30 2D 49 20 20 20 20 20    Xerox 820-I  
58 65 72 6F 78 20 38 32 30 2D 49 49 20 20 20 20    Xerox 820-II   
58 65 72 6F 78 20 38 2D 31 36 20 20 20 20 20 20    Xerox 8-16    
20 32 22 36 20 20 20 20 20 20 20 20 20 20 20 20     2.6           
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
+---------------------------------------------+    +--------------+

Notic� tha�� eac� entr� take� th� entir� sixtee� byte� an� tha�� n� 
terminato� i� use� t� indicat� th� en� o� th� string�� Th� las� entr� �
i� th� fil� i� th� inde� entr�� fo� th� versio� number�� I�� i� �
recognize� b� th� fac� tha� th� firs� characte� i� th� fiel� i� blank� �
Thi� i� th� onl� recor� tha� begin� wit� � blan� character�� Th� nex� �
thre� byte� denot� th� versio� number�� Th� res� o� tha�� fiel� i� �
padde� wit� blanks�� Th� remainde� o� th� physica� recor� i� fille� �
wit� binar�� 0's�� Th� firs�� o� thes� zero'� serv� a� th� strin� �
terminato� fo� th� inde� file�� Thu� th� entir� inde� fil� i� treate� �
a� on� lon� strin� terminate� b� � binar� 0.







�

     Th� nex� sectio� i� th� database�� Eac� 12� byt� physica� recor� �
represent� on� termina� entry�� Th� followin� fiel� structur� define� �
the database section.

     Terminal Name  16 bytes
     Up Arrow        1 byte
     Down Arrow      1 byte
     Left Arrow      1 byte
     Right Arrow     1 byte
     CLS Delay       1 byte
     DCA Delay       1 byte
     EOL Delay       1 byte
     Clear Screen    Variable Length --+
     Dir Cur Pstn    Variable Length   |
     Erase EOL       Variable Length   |
     Begi� Standou�  Variabl� Lengt�   |--� Total =< 105 Bytes
     End Standout    Variable Length   |
     Terminal Init   Variable Length   |
     Term De-Init    Variable Length --+

     Th� termina� nam� i� th� onl� fiel� tha� i� NO� terminate� b�� � �
binar�� 0�� Al� othe� field� ar� terminated�� I� � serie� o� zero'� �
exist� eas� wil� represen� � fiel� entry� Th� followin� exampl� o� th� �
Televideo 950 terminal should help to clarify.

00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F   0123456789ABCDEF

54 56 49 39 35 30 20 20 20 20 20 20 20 20 20 20   TVI950
0B 16 0C 08 32 00 00 1B 2A 00 1B 3D 25 2B 20 25   ....2...*..=%+ %
2B 20 00 1B 74 00 1B 29 00 1B 28 00 00 00 00 00   + ..t..)..(.....
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................ 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................ 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00   ................

The following should help to translate the code.

54 56 49 39 35 30 20 20 20 20 20 20 20 20 20 20   TVI950
T  V  I  9  5  0  

0B 16 0C 08 32 00 00 1B 2A 00 1B 3D 25 2B 20 25   ....2...*..=%+ %
| Arrows  | |Delays| | CLS  | | Direct Cursor
^K ^V ^L ^H |2ms dl| | ESC* | | ESC=%+ %+ 
+---------+ +------+ +------+ +----------------

2B 20 00 1B 74 00 1B 29 00 1B 28 00 00 00 00 00   + ..t..)..(.....
Addr   | | EOL  | |Beg SO| |End SO| TI TD
       | | ESCt | |ESC)  | |ESC(  | |  +- No De-initialization 
-------+ +------+ +------+ +------+ +---- No Initialization


�
Th� las� databas� entr� i� th� versio� number�� On� entir� recor� i� �
reserve� fo� thi� entry�� I� appear� th� sam� a� th� inde�� sectio� �
entry�� Th� firs� sixtee� byte� ar� reserve� fo� th� 'name'�� whic� i� �
thi� cas� wil� b� th� versio� numbe� preceede� b� on� blan� an� padde� �
t� fil� th� sixtee� byt� nam� field�� Th� res� o� th� recor� i� fille� �
wit� � binar� 0�� I� i� importan� t� not� tha� th� firs� recor� i� th� �
dat� sectio� alway� begin� o� � recor� boundary�� Thi� i� importan� �
becaus� i�� i� th� basi� o� th� calculation� use� t� positio� th� �
record pointer within the database.











































