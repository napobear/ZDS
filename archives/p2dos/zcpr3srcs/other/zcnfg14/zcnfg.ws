









                            � � � � G
             � � � � � � � � � � � � �  � � � � � R
                               FOR
                 ZCP� an� CP/� EXECUTABL� FILES
                               by
                          A� E� HAWLEY























                        COPYRIGH� NOTICE
     ZCNF� an� it� documentatio� ar� copyrighte� (C� 198� by
             A� E� Hawley� Al� right� ar� reserved.






                          A� E� Hawley
                       603� Charito� Ave.
                     Lo� Angeles� CA� 90056
 (213� 649-357� (voice�     Lader� Z-node:(213� 670-946� (modem)
.pa�                   ZCNF� CONFIGURATIO� UTILITY

INTRODUCTION

ZCNF� � i� � universa� configuratio� utilit� fo�  program� � lik� �
ZMAC� �MCOPY� BYE� ZFILER� an� man� others� Th� behavio� o� �suc� �
program� i� designe� t� b� modifie� b� user� withou� �reassembly� �
Thi� �i� �don� b� changin� dat� a� know� addresse� i� �th� �firs� �
pag� �o� progra� code� ZCNF� perform� thi� editin� functio� i� �� �
particularl� convenien� way� Dat� option�  ar� displaye�  i� �on� �
o� �mor� �menus� �Th� curren� selectio� � fo� � eac� �optio� � i�  �
displaye�  a� par� o� th� men�  information� HEL� screen� ca� �b� �
invoke� fo� assistanc� i� selectin� options.

Th� �mos� commo� configuratio� option� ar� logica� choice� �base� �
o� th� valu� o� � byt� (zer� o� no�-zero)� Suc� choice� appea� i� �
th� �ZCNF� men� a� 'YES� o� 'NO� (o� an� othe� se� o� �term� �yo� �
like)� an� ma� b� toggle� whe� tha� men� ite� i� selected� �ZCNF� �
readil� handle� th� followin� kind� o� data:

�������Logica� toggl� o� an� bi� i� � byte
�������Chang� th� valu� o� � byt� wit� display/entr� i� Decimal
�������Chang� th� valu� o� � wor� wit� display/entr� i� Decimal
�������Chang� th� valu� o� � byt� wit� display/entr� i� HEX
�������Chang� th� valu� o� � wor� wit� display/entr� i� HEX
�������Replac� � strin� o� ASCI� characters
�������Replac� o� modif� � D� specificatio�
�������Replac� o� modif� � Z3-styl� Fil� Specificatio�

A� acceptabl� rang� fo� numeri� value� ca� b� specifie� fo� �eac� �
byt� o� wor� value� value� outsid� tha� rang� wil� no� b� entere� �
i� th� targe� program� Th� rang� i� displaye� fo� eac� item� Thi� �
i� �usefu� �fo� entr� of� fo� example� � buffe� siz� o� �� �ZCPR� �
syste� fil� number� Th� las� tw� ar� usefu� fo� editin� � defaul� �
filespec.

ZCNF� i� universa� becaus� i� use� a� overla� fil� t� provid� th� �
men� layout(s)� Hel� screen(s)� an� dat� specifyin� th�  locatio� �
an�  natur�  o�  eac�  option� A�  appropriat�  overla�  mus�  b�  �
presen�  fo� th� targe� program� ZCNF� load� i� automaticall�  o� �
a� �� resul� o� � comman� lin� specification� Th� �generatio� �o� �
overlay� i� discusse� belo� fo� thos� wh� wis� t� mak� suc� file� �
fo� thei� ow� use.

ZCNF� �i� � CP/� compatibl� �-syste� utility� I� �ZCPR3/33/3� �i� �
present� �the� ZCP� facilitie� ar� use� t� tak� advantag� o� �th� �
TCA� an� name� directories.

.pa�INVOCATION

Jus� �typ� ZCNFG'� nam� t� ge� �  hel�  scree� tha� explain� �ho� �
t� invok� ZCNFG� An� for� o� th� followin� invocatio� wil� work.

       ZCNF�   or   ZCNFG [/[/]�       <== ? may replace the /

T� �configur� �� �targe� fil� whe� th� overla� �fil� �i� �o� �th� �
currentl� logge� directory� use:

          ZCNF� <targe� filename>

Thi� �exampl� �implie� tha� th� nam� o� th� overla� fil� �i� �th� �
sam� �a� tha� o� th� targe� fil� an� ma� b� foun� i� th� �curren� �
directory� �Th� �overla� �ma� als� �b� �explicitl� �declared� �A� �
explici�  declaratio� take�  precedenc�  ove�  a� implie� one� I� �
th� D� portio� i� missing� the� th� defaul� director� i� used� I� �
th� filetyp� i� missing� the� � filetyp� o� .CF� i� assumed.

     Implied  filespec�    Explicit filespec: 

          ZCNFG  F�             ZCNFG  FS _ FS

     where:    FS = [DU: | DIR:][<filename>][.<filetype>]
       an�     underlin� (_� mean� space,tab� o� comma

Th� � firs� filespe� (FS� define� th� targe� progra� tha� i� � t� �
b� configured� Th� secon� filespe� define� th� associate� overla� �
file� A� implied� al� part� o� bot� specification� ar�  optional� �
i� � everythin� �i� omitte� th� hel� scree� wil� �b� � displayed�  �
Th� � defaul� �overla� filetyp� extensio� i� .CFG� �Yo� �can� �o� �
course� �us� �ZCNF� �t� chang� it� ow� �defaults� �CF� �coul� �b� �
change� t� CNF� fo� example.

I� th� configuratio� overla� fil� canno� b� foun� wit� th� �spec� �
supplied� �the� th� searc� i� repeate� i� th� Alternat� DU� �Tha� �
director� �i� �on� �o� th� �configurabl� �default� �withi� �ZCNF� �
itself� �I� �th� �overla� fil� i� stil� �no� �found� �the� �ZCNF� �
attempt� �t� �obtai� �th� nam� o� th� �overla� �fro� �th� �targe� �
program� �dat� are� an� repeat� th� searc� i� th� curren� an� �i� �
th� alternat� directories.

Th� �targe� progra� i� searche� a� relativ� locatio� �0D� �(righ� �
afte� �th� Z3� header� fo� � lega� fil� name� U� t� � �byte� �ar� �
examined� � possibl� filenam� wil� b� assume� i� i� i� terminate� �
wit� �enoug� �space� t� mak� � byte� o� i� i� �i� �terminate� �b� �
null� �$� o� Hig�-bi�-se� fo� th� las� character� I� �th� �strin� �
look� lik� � lega� fil� name� i� i� take� a� th� nam� portio� �o� �
th�  overla� filespec.

Th� �objec� o� th� abov� strateg� i� t� permi� norma� �invocatio� �
wit� a� implie� overla� filespec� I� th� targe� progra� �contain� �
th� �nam� o� it� overla� fil� a� described� th� overla� �i� �ver� �
likel� t� b� foun� eve� i� th� targe� progra� ha� bee� renamed.
�.pa
THE CONFIGURATION FILE

Th� configuratio� fil� i� a� overla� loade� a� ru� tim� b� ZCNFG� �
Th� �overla� conventionall� ha� th� sam� nam� a� th� fil� �t� �b� �
configured� an� � filetyp� o� .CFG� I� i� create� b� assembl� �o� �
� �standar� Z8� sourc� fil� t� produc� � binar� image� Th� �alia� �
MAKECFG.CO� automate� th� proces� fo� ZMA� an� ZMACLNK.I� i� �no� �
necessar� �t� se� a� Origi� (ORG� i� th� sourc� fil� becaus� �th� �
imag� i� automaticall� relocate� durin� loadin� a� ru� time� �Th� �
relocatio� depend� o� th� initia� MEN� DAT� bein� presen� a� �th� �
firs� cod� producin� ite� i� th� sourc� file� a� describe� below� 

Th� Configuratio� Overla� sourc� fil� contain� th� followin� mai� �
sections:

���������DEFINITIONS
���������MEN� DAT� STRUCTURE
���������CAS� TABLE(s)
���������SCREE� IMAGE(s)
���������DAT� FO� ALTERNAT� SCREE� IMAG� FIELDS
���������HEL� SCREE� DATA

Th� �section� ar� discusse� below� Se� file� lik� *.SR� �i� �thi� �
librar� fo� implementatio� examples.

DEFINITIONS

Thi� �sectio� define� symbol� an� macro� use� i� th� �balanc� �o� �
th� sourc� file� Functions� offsets� scree� locations� data� �an� �
loca� dat� addresse� ar� symbolicall� define� b� EQ� �statements� �
Tw� �macro� ar� provide� i� th� exampl� fil� �MODELCFG.SR� �whic� �
greatl� simplif� th� constructio� o� th� cas� tables.

MEN� DAT� STRUCTURE

Th� firs� thre� cod� generatin� line� i� th� fil� MUS� be:

          RS�  0
          D�   MENU�     ;o� whateve� labe� yo� us� fo� menua:
menua�    D�   LASTM,NEXTM,SCREENA,CASEA,HELPA

LAST� an� NEXT� ar� pointer� i� � doubl� linke� circula� queu� o� �
record� �lik� tha� a� menua:� Ther� i� on� recor� fo� �eac� �men� �
scree� displaye� b� ZCNFG� I� ther� i� onl� on� men� scree� �(th� �
cas� �fo� �man� targe� progra� implementations� �the� �LAST� �an� �
NEXT� wil� bot� b� replace� wit� MENUA� Fo� � men� screens� adde� �
men� record� woul� b� required� Fo� example,

menua�    D�   menun,menui,SCREENa,CASEa,HELPa
          ....
menui�    D�   menua,menun,SCREENi,CASEi,HELPi
          ....
menun�    D�   menui,menua,SCREENn,CASEn,HELPn

.cp 5�Ther� �i� �n� requiremen� impose� fo� locatio� �o� �men� �record� �
afte� th� firs� on� (menua)� ZCNF� find� th� MENUA recor� a� �th� �
specifie� offse� i� th� configuratio� overla� (offse� i� 3)� �An� �
other� ar� locate� throug� th� link� LAST� an� NEXTM.

Th� RS� � instructio� i� presen� t� preven� thi� fil� fro� �bein� �
inadvertentl� executed� � RE� instructio� coul� als� b� use� her� �
i� man� cases.

Th� �D� �statemen� containin� th� symboli� addres� o� �th� �firs� �
men� �recor� i� use� fo� ru�-tim� relocatio� o� pointer� �i� �th� �
men� record� an� CAS� tables.

CAS� TABLE(s)

Ther� �i� on� CAS� tabl� fo� eac� men� screen� Th� cas� tabl� �i� �
labele� an� th� labe� i� a� entr� i� th� associate� men� �record� �
Eac� cas� tabl� contain� � serie� o� records� on� recor� fo� eac� �
configurabl� �ite� �i� th� men� display� an� on� �initia� ��-byt� �
entr� �whic� �specifie� �th� numbe� o� record� �presen� �an� �th� �
numbe� o� byte� i� eac� record� Sinc� variabl� lengt� record� ar� �
no� �implemente� i� ZCNFG� th� recor� lengt� byt� i� alway� �0AH� �
Her� i� th� structur� o� eac� CAS� record:

letter�   d�   �    ;ASCI� cod� fo� th� men� selector�
function� d�   �    ;1� bi� functio� number
offset�   d�   �    ;1� bi� offse� o� confi� dat� i� targe� pgm.
bdata�    d�   �    ;� bi� dat� require� b� function.
scrnloc�  d�   �    ;1� bi� addres� fo� dat� i� th� scree� image.
pdata�    d�   �    ;1� bi� addres� o� dat� require� b� function.

Men� item� ar� selecte� b� consol� inpu� o� � visibl� �character� �
letter:� Typica� entrie� fo� letter� ar� "d� 'A'"� "d� '1'"� etc.

'function:� �define� on� o� � se� o� standar� modification� �tha� �
ca� b� mad� t� dat� i� th� targe� progra� configuratio� are� �an� �
t� �th� ZCNF� scree� display� Fo� example� functio� � �toggle� �� �
bi� i� � specifie� byte� th� associate� fiel� i� th� men� displa� �
ma� �toggl� betwee� 'YES� an� 'NO'� Th� latte� ar� string� �whos� �
addres� �i� give� a� 'pdata:'� s� yo� hav� contro� o� �wha� �i� �
displayed� �I� yo� wished� th� displa� i� thi� cas� migh� b� �'1� �
an� '0� o� 'True� an� 'False'.

nam�:     function: use� for:

switc�       �      toggl� bi� <bdata� i� th� byt� a� <offset>
tex�         �      edit <bdata� character� wit� U� conversion
duspe�       �      edi� � byt� pai� a� � D� specification
hexrad       �      edi� � configuratio� byt�/wor� i� HEX.
decrad       4      edi� � configuratio� byte/wor� i� DECIMAL
textl�       �      edi� <bdata� characters� bot� U� an� LC
filesp       6      edi� � Z� filespe� o� filespe� fragment
togl3        7      rotat� � bi� i� th� � low bit� a� <offset>
togltf       8      toggl� byt� a� <offset� betwee� � an� 0ffH
�.cp 6
'offset:� specifie� th� relativ� addres� o� th� dat� ite� i� �th� �
targe� �progra� �tha� �i� �t� �b� �configurabl� �wit� �thi� �men� �
selection� 'offset� i� � wor� (1� bit� quantity� eve� thoug� �it� �
valu� ma� b� limite� t� th� rang� �-7fH.

bdata:� i� � byt� whos� valu� implie� th� siz� o� th� dat� i� �th� �
configuratio� bloc� an� ho� i� i� t� b� interpreted� Function� �� �
an� �5� fo� example� requir� bdat� t� specif� th� lengt� �o� �th� �
tex� �fiel� i� th� configuratio� block� ZCNF� wil� abor� �wit� �� �
diagnosti� �erro� messag� i� th� valu� o� bdat� foun� i� th� �CF� �
fil� i� inappropriat� fo� th� functio� specified.

nam�:     function: 'bdata� entr� required

switc�       �      bi� positio� t� toggle� ls� � 0� ms� � 7
tex�         �      numbe� o� character� t� replace
duspe�       �      � fo� (A..�)�(0..15)� � fo� (A..P)=(1..16)
hexra�       �      � fo� byte� � fo� wor� confi� data
decra�       �      � fo� byte� � fo� wor� confi� data
tex�lc       5      numbe� o� character� t� edit
files�       �      0� FN.FT� 1=Drive� 2=DU� 3=Ful� filespec
togl3        7      � � � 00000111B)
togltf       8      �  (on� byt� get� toggle� 00/ff)

'scrnloc:'� i� th� addres� i� th� scree� imag� a� whic� th� �ASCI� �
representatio� o� th� configuratio� dat� fo� thi� men� ite� i� t� �
b� displayed� Thi� i� normall� � labe� i� th� scree� imag� sourc� �
describe� below.

'pdata:'� �i� th� addres� o� dat� use� b� � function� Som� o� �th� �
function� d� no� requir� thi� data� I� thos� instances� th� valu� �
entere� �i� �thi� �fiel� i� ignored� an� i� �normall� �0000� �Th� �
followin� tabl� show� wha� eac� functio� require� o� th� �'pdata� �
field.

nam�:     function: 'pdata:� entr� required
switc�       �      addres� o� � nul� terminate� strings
tex�         �      0
duspe�       �      0
hexrad       �      0 o� addres� o� min/ma� dat� words
decrad       4      � o� addres� o� min/ma� dat� words
tex�lc       5      0
files�       �      0
togl3        7      addres� o� � nul� terminate� strings
togltf       8      addres� o� � nul� terminate� strings

Th� min/ma� dat� word� ar� � pai� o� 1� bi� value� whic� �contai� �
th� minimu� an� maximu� value� allowe� fo� th� curren� ite� bein� �
configured� Fo� example� Z� syste� fil� number� ar� fro� � t� �4� �
Th� �dat� provide� i� th� configuratio� fil� fo� thi� cas� �woul� �
be:

sfilmm�   DW   1,�       ;minimu� valu� first� Do NO� use DB!

.cp 5�SCRNLO� �an� PDAT� ar� addresse� withi� th� �configuratio� �file� �
Becaus� �the� ar� relocate� whe� th� overla� i� loade� b� �ZCNFG� �
the� �ma� NO� designat� absolut� addresse� outsid� �th� �overlay� �
(Fo� �PDATA� � doe� no� specif� a� address� I� mean� �tha� �ther� �
ar� n� limit� fo� thi� numeri� dat� item.)
.CP 12
SCREE� IMAGE(s)

Th� �scree� imag� i� � se� o� D� statement� tha� �specif� �enoug� �
spaces� �data� �an� CR,L� character� t� 'paint� 1� line� �o� �th� �
screen� Th� othe� � line� o� � 2�-lin� scree� ar� take� u� b� th� �
promp� �messag� �an� �use� respons� line� a� th� �botto� �o� �th� �
screen.

Th� firs� statemen� o� th� scree� imag� i� labeled� Tha� labe� i� �
par� o� th� MEN� record� identifie� a� SCREENa� SCREENi� etc� �i� �
th� descriptio� o� th� men� recor� structur� above� Scree� image� �
ar� illustrate� i� th� sampl� *.SR� files.

Th� 'data� jus� mentione� comprise� titles� borders� an� th� tex� �
o� men� item� tha� doe� no� change� Field� i� whic� �configurabl� �
dat� �i� t� b� displaye� ar� fille� wit� spaces� Suc� field� �ar� �
usuall� �mad� int� independen� labele� D� statements� �Th� �labe� �
fo� �suc� �� statemen� i� a� entr� i� th� cas� �tabl� �recor� �a� �
'scrnloc'.

Th� entir� scree� imag� i� terminate� b� � binar� zer� � d� � �o� �
it� �equivalent)� �Se� th� discussio� belo� �unde� �'HEL� �SCREE� �
DATA'.

TIP� �Don'� forge� t� pu� th� men� ite� selectio� �character� �i� �
th� scree� imag� nea� th� dat� t� b� referenced� Thi� i� ho� �th� �
use� kno�s whic� ke� t� pres� fo� � particula� item..

DAT� FO� SCREE� IMAG� FIELDS

Function� 1� 2� 5� an� � ignor� an� entrie� i� th� pdata� �field� �
The� ge� thei� dat� fro� th� keyboar� only.

Tw� �kind� �o� �dat� structure� ar� �reference� �b� �pointer� �a� �
pdata� fo� function� 0� 3� 4� 7� an� 8�

Th� �firs� �typ� i� compose� o� D� statement� �tha� �defin� �nul� �
terminate� �ASCI� �strings� Thes� string� appea� i� th� �men� �t� �
sho� �th� �curren� stat� o� th� configuratio� ite� �addresse� �b� �
thi� �cas� tabl� record� 'yndata� i� th� *.SR� exampl� �file� �i� �
typical� �Not� �tha� �th� orde� i� whic� �th� �string� �occu� �i� �
important� th� on� correspondin� t� 'true� come� first� Thi� typ� �
o� dat� i� require� b� function� 0� 7� an� 8.

Th� secon� typ� i� � D� dat� statemen� containin� tw� words� �Th� �
firs� wor� i� � minimu� valu� an� th� secon� i� � maximu� fo� th� �
numeri� �dat� �addresse� �b� thi� case� Thi� typ� �i� �use� �wit� �
function� � an� � (HE� an� DECima� data)� I� th� POINTE� valu� i� �
pdata� �i� 0000� the� n� rang� checkin� wil� occur� Whe� �Min/Ma� �
value� �ar� given� the� ar� displaye� i� th� prope� radi� i� �th� ��promp� �line� I� th� use� attempt� t� ente� � valu� �outsid� �th� �
indicate� range� hi� entr� i� ignored.

.cp 10�HEL� SCREE� DATA

Hel� screen� ar� accesse� vi� th� '?� o� '/� a� th� men� �prompt� �
� �hel� �scree� �shoul� b� provide� fo� eac� �menu� �eve� �i� �i� �
contain� �n� mor� tha� � 'hel� no� available� message� �Th� �hel� �
scree� ma� b� omitte� i� � 0000� entr� i� mad� i� th� MEN� recor� �
(HELPa� �HELPi� HELPn)� Tha� cause� ZCNF� t� ignor� hel� �reques� �
(� o� ?� fro� th� men� serve� b� tha� record.

Hel� �screen� are� lik� scree� images� � bloc� o� �D� �statement� �
whic� defin� th� tex� t� b� displayed� Hel� screen� ma� b� longe� �
tha� �2� lines� ZCNF� count� line� an� execute� � �displa� �paus� �
fo� �eac� �scree�-ful� �o� �text� �Yo� �contro� �th� �conten� �o� �
successiv� display� b� addin� o� removin� lin� fee� character� i� �
th� D� statements.

Th� �entir� �bloc� o� ASCI� tex� tha� comprise� � �HEL� �display� �
whic� ma� b� displaye� i� multipl� screens� i� terminate� wit� �� �
binar� zer� (NO� � '$')� Thi� conventio� permit� th� us� o� th� � �
characte� i� you� scree� displays� Sinc� som� earl� configuratio� �
file� �us� �th� �� a� � terminator� ZCNF� ma� �b� �configure� �t� �
recogniz� tha� characte� a� th� terminator� rathe� tha� th� null� �
Suc� non-standar� configuratio� shoul� b� temporar� only.

Th� hel� scree� fo� eac� men� i� labeled� Tha� labe� i� a� �entr� �
(HELPa� etc.� i� th� associate� MEN� record.

.pa�