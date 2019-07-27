.mt 6
.pl 60
.po 8     
.pn
                             Z3INStp
AUTO-INSTALLE� FO� TURBO-PASCA� PROGRAM� RUNNIN� O� ZCPR� SYSTEMS

;      Thi� fil� an� al� file� i� th� LIBRAR� calle� ZTP-INS2.LB� 
;      ar� copyrigh� 198� b� Steve� M� Cohen� an� therefor� remai�       �
;      hi� property�  Yo� ma� freel� distribut� it� bu� yo� ma� no�       �
;      sel� i� o� bundl� i� a� par� o� an� packag� fo� sal�       �
;      withou� th� expres� writte� consen� o� th� author.

Introduction

     Las� June� i� th� firs� blus� o� m� enthusias� fo� ZCPR3� � �
release� � packag� calle� ZTP-INS.LBR�  Tha� packag� containe� a
Turbo-Pasca� progra� tha� installe� Vide� contro� sequence� �
directl� fro� ZCPR� TCAP� (Termina� Capabilit� Segments� int� �
othe� program� compile� b� Turbo-Pascal�  ZTP-IN� wa� no� � ba� �
program� bu� it'� documentatio� wa� florid� an� i� containe� �
severa� feature� tha� wer� practicall� useless�  Wors� o� all� i� �
containe� th� 1� o� s� � run-tim� packag� tha� al� Turbo-Pasca� �
program� us� makin� fo� � muc� bigge� progra� tha� wa� necessar� �
fo� suc� � simpl� task.

     Thi� package� containe� i� ZTP-INS2.LB� contain� a� �
assembly-languag� versio� o� th� ol� program� calle� Z3INSTP.COM� �
whic� delete� th� feature� tha� wer� no� usefu� i� th� earlie� �
versio� an� add� � fe� ne� ones:

  1� th� abilit� t� tur� of� highlightin� -- Som� program� ma� be
     writte� o� system� wit� reduce� intensity�  Whe� thes� ar�      �
     porte� t� system� tha� hav� invers� vide� instea� o� reduce�      �
     intensit� th� resultin� screen� actuall� loo� wors� tha�      �
     the� woul� withou� an� highlighting�  � simpl� comman� line
     switc� allow� highlightin� t� b� turne� off.

  2� th� abilit� t� REVERS� hig� an� lo� vide� -- a� above� in
     som� cases� simpl� reversin� wha� wa� highlighte� an� what
     wa� norma� wil� improv� thing� considerably�  Thi� to� can
     b� selecte� o� th� comman� line.
.cp 6
  3� th� optio� t� instal� th� arro� key� directl� int� th�      �
     progra� fo� an� progra� writte� t� tak� advantag� o� thi�      �
     capablility�  Thi� schem� wil� wor� fo� an� termina� that
     ha� arro� key� whic� generat� singl� bytes�  Thi� optio� is
     als� selectabl� a� th� comman� line.
.cp7�.heZ3INStp - Auto-installs Turbo-Pascal programs on ZCPR3 systems
  4� Z3INSTP.CO� i� � ZCPR� utilit� an� accesse� th� environmen�      �
     descripto� automatically� instea� o� needin� i� t� b�      �
     specifie� o� th� comman� line�  Lik� mos� Z� utilities
     i� come� wit� it'� ow� built-i� hel� screen�  Z3INStp also
     give� ful� contro� o� use� area� wit� Z3'� DU� specification
     bu� no� th� DIR� form.

Installin� Z3INStp

     Sinc� Z3INSTP.CO� i� � ZCPR� utilit� i� mus� b� installe� a� �
al� ZCPR� utilitie� are� fo� th� user'� system�  Th� comman� lin� �
fo� thi� i� th� usual:
                    
           Z3IN� SYS.EN� Z3INSTP.COM

Z3INStp no� b� read� t� us� o� th� user'� system.


Invokin� Z3INStp

     Z3INStp i� easil� invoke� fro� th� comman� line�  Fo� th� �
defaul� mod� (withou� options� simpl� type:

          Z3INST� filenam� 

wher� filenam� i� th� nam� o� � .CO� fil� optionall� prefixe� �
wit� � DU� (disk-user� specification�  E� G.

          Z3INST� FATCAT
          Z3INST� FATCAT.COM
          Z3INST� B7:FATCAT.COM

.cp 6
Not� tha� th� .CO� extensio� i� optiona� o� th� comman� line�  I� �
� fil� o� .CO� typ� i� no� found� a� erro� messag� wil� result�  �
I� yo� typ� fo� example

          Z3INST� FATCAT.OBJ
 
th� progra� wil� loo� onl� fo� FATCAT.COM� abortin� i� i� i� no� �
found� eve� i� FATCAT.OB� i� present�  I� othe� words� Z3INStp �
onl� install� .CO� files.

Furthermore� Z3INStp check� t� se� i� th� specifie� fil� wa� �
compile� unde� Turbo-Pasca� (versio� 2.� o� higher)� agai� �
abortin� i� i� wa� not�  Thi� prevent� agains� damagin� file� �
whic� wil� no� wor� wit� thes� installations.�
A� a� adde� measur� o� safety� Z3INStp firs� rename� th� fil� to
b� installe� wit� th� nam� filename.OLD� the� create� � ne� fil� �
fro� scratc� upo� whic� th� ne� installe� value� ar� placed�  I� �
fo� som� reaso� Z3INStp fails� simpl� renam� filename.OL� bac� to
filename.COM�  I� filename.OL� alread� exists� yo� ar� querie� �
befor� th� ol� cop� i� deleted�  Bette� saf� tha� sorry.

Options

Option� ar� selecte� o� th� comman� lin� a� parameter� afte� the
filenam� i� typed�  Options� i� any� ar� combine� int� � single
"word� a� th� secon� comman� lin� parameter:

          Z3INST� FATCA� A
          Z3INST� FATCAT.CO� AR
          Z3INST� FATCA� HA

Ther� ar� onl� � options:

optio� 'H'� - turn� of� highlightin� i� th� progra� bein� �
installed� a� describe� above�  Tha� i� th� progra� wil� run
a� thoug� i� wer� runnin� o� � termina� withou� highlighting.

optio� 'R'� - reverse� wha� i� highlighte� an� wha� i� not� a� �
describe� above�  I� thi� optio� i� chose� togethe� wit� the
'H� option� the� i� wil� b� ignored�  

optio� 'A'� - install� th� arro� key� a� describe� above�  Not� �
tha� fo� thi� optio� t� wor� th� progra� documentatio� mus� �
specif� tha� arro� key� ca� b� installe� thi� way.�  A� o� now� �
th� onl� progra� tha� ca� b� installe� i� thi� wa� i� FATCA� b� �
th� autho� o� Z3INStp�  Hopefully� othe� programmer� ma� decid� �
tha� thi� i� � usefu� ide� an� implemen� i� i� thei� programs�  �
Also� arro� key� mus� b� installe� i� th� user'� TCA� -- an� fo� �
thi� t� happen� th� arro� key� mus� generat� onl� single-�
characte� sequences�  Mos� arro� key� wor� thi� way� bu� � fe� d� �
not�  However� no� t� worry�  Eve� i� th� progra� yo� ar� �
installin� doe� no� suppor� thi� convention� i� doe� n� harm�  �
Programmer� wishin� t� writ� program� usin� Z3INStp shoul� �
consul� th� sectio� "Arro� Ke� Programming� below.

Theor� o� Z3INStp

     Z3INStp work� becaus� bot� ZCPR� an� Turb� Pasca� cod� thei� �
termina� dat� i� readil� accessibl� places�  Simila� setup� coul� ��b� worke� u� fo� an� progra� o� programmin� languag� tha� use� � �
simila� metho� o� accessin� termina� data�  

     A� neatl� a� Z3INStp work� i� i� importan� t� not� wha� i� �
CANNO� do�  I� canno� mak� Turb� program� us� th� TCA� th� sam� �
effortles� wa� zcpr� utilitie� do�  Tha� is� i� ca� onl� instal� �
program� t� specifi� TCAPs�  I� i� eas� t� reinstal� thes� �
program� fo� differen� TCAP� bu� yo� mus� reinstal� fo� eac� TCA� �
used�  Yo� canno� simpl� LD� � ne� TCA� an� expec� you� progra� �
t� wor� right.

     Th� reaso� fo� thi� i� simple�  Turb� an� ZCPR� us� �
completel� differen� method� o� formattin� thei� termina� data�  �
Turb� use� th� fixe� lengt� strin� method� wher� eac� termina� �
functio� ca� b� foun� a� specific� exac� location� i� memory�  �
Thes� location� ar� th� sam� fo� ever� Turb� progra� (a� leas� �
thos� unde� version� 2.� an� 3.0)� an� indeed� fo� TURBO.CO� �
itself�  Further� the� follo� th� Turbo-Pasca� Strin� format� �
wherei� th� firs� byt� o� th� strin� variabl� i� th� actua� �
lengt� o� th� string�  ZCPR� TCAP� us� th� "null-termination� �
metho� s� th� beginnin� addres� o� th� TCA� i� readil� available� �
other� ar� not�  I� woul� b� possible� bu� hardl� worthwhile� t� �
writ� Turbo-Pasca� program� redefinin� th� termina� procedure� �
suc� tha� the� accesse� th� ZCPR� locations.

     Therefore� w� ca� bes� se� Z3INStp a� � halfwa� hous� �
betwee� tota� ZCPR3-utilit� vide� compatibility� an� non-
compatibility�  I� i� simpl� � translatio� program�  It� mai� us� �
a� � se� it� i� t� enabl� ZCPR� user� t� instal� Turbo-program� �
o� thei� terminal� withou� th� space-wastin� an� clums� method� �
o� TINS� an� GINST� whic� amoun� t� � duplicatio� o� effor� afte� �
yo� hav� installe� you� TCAP�  I� als� i� � nic� demonstratio� o� �
th� advantage� o� ZCPR� ove� CP/M� 

Weaknesse� o� Z3INStp an� Futur� Directions

     Z3INStp wil� no� wor� o� terminal� wit� "non-fixed-lengt� �
ASCI� � curso� addressin� sequences�  Thes� ar� terminal� whic� �
us� th� "%d� i� thei� curso� addressing�  Fo� exampl� th� H1� �
Termina� ANS� mode� whos� ZCPR� curso� addressin� sequenc� i� �
1BH,'[%d;%dH',0�  � canno� fin� an� suc� termina� definition� �
use� b� TURBO� s� ha� n� poin� o� reference�  � a� reasonabl� �
sur� tha� Z3INStp wil� wor� o� terminal� wit� "fixed-lengt� ASCI� �
addressing� bu� hav� no� trie� one� s� woul� appreciat� an� bu� �
report� o� thi� a� th� "hom� base� liste� below� (Se� chapter 22�
o� ZCPR� - th� Manual� i� yo� d� no� understan� thi� paragraph.)�     
.cp7
     Z3INStp ha� � coupl� o� inheren� weaknesse� du� t� partia� �
incompatibilitie� o� ZCPR� TCAP� wit� Turbo-Pasca� termina� �
definitions�  Specifically,

  TCAP� d� no� hav� sequence� fo� Inser� Lin� an� Delet� Lin� �
(th� Turb� procedure� InsLin� an� DelLine)�  Luckily� thes� ar� �
probabl� les� use� tha� th� othe� termina� functions�  � fin� �
tha� � seldo� us� the� i� m� ow� programming� thei� mos� frequen� �
us� seem� t� b� i� th� Turb� Edito� itself� here� Borland'� �
programmer� hav� bee� smar� enoug� t� includ� workaround� fo� �
terminal� no� supportin� thes� functions� � practic� tha� other� �
migh� wan� t� emulate.

     Nonetheless� i� woul� b� nic� t� b� abl� t� acces� thes� �
functions�  Lookin� a� th� TCAP� tha� currentl� exist� i� woul� �
see� t� b� eas� t� ad� thes� function� a� th� en� o� th� TCA� a� �
the� al� see� t� hav� ampl� spac� i� th� 12� byt� standar� �
allocation�  � wonde� wha� d� th� author� o� ZCPR� thin� abou� �
extendin� th� TCAP� t� includ� thes� functions�  
.cp7

     Th� othe� weaknes� i� th� concep� behin� Z3INStp ha� largel� �
bee� largel� eliminate� wit� th� arrow-ke� installatio� procedur� �
describe� above�  However� thi� create� som� othe� mino� �
difficultie� fo� programmers� whic� � wil� no� attemp� t� clea� �
up.

Programmer'� Guid� t� Arro� Ke� Installation

     I� designin� th� arrow-ke� interface� th� followin� schem� �
suggeste� itself�  Th� Turbo-Pasca� Termina� Nam� strin� occupies
2� byte� i� memor� startin� a� 0153h�  Th� firs� byt� contain� �
th� actua� lengt� o� thi� string� s� ther� i� � maximu� o� 2� �
byte� availabl� fo� th� termina� name�  Quit� b� accident� th� �
Turb� TCA� strin� holdin� th� termina� nam� occupie� � maximu� o� �
1� bytes�  Therefor� w� hav� fou� byte� availabl� o� th� Turbo
Interfac� pag� (016� - 0167h� tha� wil� almos� certainl� no� �
conflic� wit� anything�  Thes� fou� byte� ar� no� use� i� an� wa� �
onc� th� shorte� TCA� strin� i� overlai� ove� th� origina� Turb� �
string�  Therefore� al� tha� i� neede� i� you� progra� t� allo� �
th� arro� ke� optio� 'A� t� wor� i� th� followin� code:

       VAR
          UpArro�                � Cha� absolut� $0164;
          DownArro�              � Cha� absolut� $0165;
          RightArro�             � Cha� absolut� $0166;�          LeftArro�              � Cha� absolut� $0167;

However� thi� create� anothe� proble� i� th� progra� wil� als� b� �
ru� o� non-Z� systems�  Fo� thos� installation� somethin� simila� �
t� TINS� o� GINS� mus� b� used� an� i� tha� cas� character� fro� �
th� 2� characte� Turb� termina� nam� wil� fil� thes� spaces� wit� �
th� possibl� unfortunat� consequenc� tha� � printabl� ASCI� �
characte� wil� b� interprete� b� th� progra� a� a� arro� key�  
Thi� ca� b� cure� b� placin� th� followin� statemen� a� th� �
beginnin� o� th� program:

  Fo� � :� Addr(UpArrow� t� Addr(LeftArrow� do
    I� Mem[X� i� [32..127� then
      Mem[X� :� 0;

I� th� progra� ha� bee� installe� b� � GINS� method� thes� �
location� wil� contai� character� i� th� 32..12� rang� an� wil� �
thu� b� converte� t� zeroe� i� memory�  I� ther� i� � nee� i� �
you� progra� fo� th� Termina� name� i� ca� b� copie� ou� o� thi� �
are� befor� th� abov� statemen� i� executed.

Othe� Possibl� Problems

     Turbo-Pasca� programmer� ough� t� en� thei� program� wit� �
th� CRTExi� statement�  Tha� way� an� specia� vide� effect� ca� �
b� turne� off� i� th� use� include� i� hi� termina� definitio� � �
CRTExi� strin� tha� return� th� vide� attribute� t� normal�  �
Unfortunately� man� d� not.

     I� th� use� encounter� thi� annoyance� h� shoul� redefin� �
th� TCA� t� includ� a� exi� strin� tha� return� hi� vide� t� th� �
norma� stat� a� describe� above�  Then� i� th� programme� ha� �
writte� hi� progra� a� describe� i� th� las� paragraph� a� exi� �
fro� th� program� th� vide� wil� b� normal�  I� shoul� b� note� �
tha� th� TCAP� supplie� b� Echelon� Inc� d� no� includ� thi� �
informatio� i� th� rese� strin� an� i� mus� b� adde� wit� TCMAKE.
.pa�Conclusion

     Sourc� cod� i� include� i� thi� library�  Fee� fre� t� �
modif� it�  Ther� i� certainl� roo� fo� improvement�  However� �
th� autho� woul� lik� t� se� wha� yo� hav� done�  Pleas� leav� �
an� messages� modifications� bu� reports� etc� fo� m� o� Richar� �
Jacobson'� LilliPut� ZNod� i� Chicago�  Th� phon� numbe� fo� thi� �
excellen� boar� i� 312-649-1730� an� yo� ma� leav� message� ther� �
withou� bein� � member�  However� a� � sai� i� th� earlie� �
version� hi� $4� membershi� fe� i� � bargain.


                              Steve Cohen
                              Nov. 30, 1985



Turbo-Pascal is a trademark of Borland International, Inc.
