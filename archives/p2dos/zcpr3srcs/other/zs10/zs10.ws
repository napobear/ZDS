.RR-!--------------------------------!--------------------------------------R
.o�
.cw11
 





















                 ZSWEE� � � � Syste� Dis� Maintenanc� Utility.


                                  Pet� Pardoe

                                    R.R.� 3

                                   Trur� N.S.

                                     Canada

                                    B2� 5B2


















�.he                 ZSWEEP - � � Syste� Dis� Maintenanc� Utility












�                                  � � � � X

                                                   Page

              Introductio� .......................�  1
                   Overvie� o� ZSWEE� ............�  2
                   Invokin� ZSWEE� ...............�  2
                   Comman� Structur� .............�  3
              Singl� fil� command� ...............�  4
                   Hel� ..........................�  4
                   Forwar� an� Backwar� ..........�  5
                   Exitin� .......................�  5
                   Findin� � fil� ................�  5
                   G� t� � Fil� ..................�  6
                   Viewin� an� Printin� ..........�  6
                   Deletin� � fil� ...............�  6
                   Copyin� .......................�  7
                   Renamin� ......................�  7
                   Th� Spac� comman� .............�  8
                   Th� Lo� comman� ...............�  8
                   Th� Psued� � syste� Promp� ....�  9
              Introductio� t� Multifil� Command� .�  9
                   Th� Ta� comman� ...............�  9
                   Wildcar� taggin� ..............� 10
                   Th� Unta� comman� .............� 10
                   Th� Mas� cop� comman� .........� 10
                   Afte� th� mas� (Again� ........� 11
                   Erasin� file� .................� 11
                   Squeezin� an� Unsqueezin� files� 11
                   Settin� fil� statu� ...........� 1� 
              Epilogu� ...........................� 12� 
              Credit� ............................� 12� 








�.PN1
.FO                                                                  PAGE #
                          Introduction

     ZSWEE� i� � dis� utilit� tha� i� buil� fro� NSWP207�  I� al� bega� �whe� �
� �wa� �unhapp� wit� th� wa� tha� NSW� displaye� WordSta� file� (i� �di� �no� �
lik� �sof� hyphen� an� ^O'� an� � fe� othe� characters� an� disassemble� �th� �
progra� �i� �orde� t� patc� i� t� displa� the� correctly�  Ove� th� �year� �� �
continue� wor� o� th� disassembl� an� finall� go� i� t� th� plac� wher� � wa� �
abl� t� ad� t� th� cod� wit� n� il� effects� Whe� � finall� migrate� t� th� � �
syste� �� �misse� man� o� th� function� o� NSWEE� an� decide� t� �tackl� �th� �
conversio� o� i� t� th� � system�  Sinc� the� � hav� converte� i� t� Z8� cod� �
fro� �808� �a� �th� � syste� doe� no� ru� o� anythin� othe� �tha� �� �Z8� �o� �
compatibl� processor�  Th� progra� a� configure� require� ZCP� 3.� o� greate� �
wit� �a� �extende� �TCA� a� i� use� som� cod� fro� �VLIB4� �fo� �th� �openin� �
screen� � I� �get� �th� scree� siz� an� �highlightin� �informatio� �fro� �th� �
environmen� �an� install� th� informatio� a� ru� time� I� yo� desir� �t� �ad� �
mor� �highlitin� informatio� suc� a� underlin� t� th� hilit� string� yo� �ma� �
d� �so� Th� begi� hilit� strin� i� 1� byte� beginin� a� 309E� followe� b� �1� �
mor� �fo� th� en� hilit� strin� a� 30AEH� The� ar� signalle� b� 'BEGIN>� �an� �
'END>� �jus� �befor� eac� string�  Yo� wil� nee� t� kno� th� lengt� �o� �you� �
hilit� �an� �en� �hilit� string� an� plac� th� �additiona� �byte� �following� �
ZSWEE� �wil� �plac� th� firs� strin� i� plac� fo� yo� fro� �th� �environment�  �
Th� �entir� strin� mus� no� b� mor� tha� 1� byte� a� th� 12t� mus� b� � �nul� �
(00H� �t� signa� th� en� o� th� string�  Th� othe� feature� change� fro� �th� �
origina� progra� ar� th� us� an� displa� o� th� director� name� fro� th� NDR� �
th� �correc� displa� o� WordSta� files� th� abilit� t� us� eithe� CP/� o� �W� �
arro� �key� t� mov� bac� an� forwar� i� th� fil� list� th� abilit� �t� �abor� �
wit� ^� o� X� t� us� � a� � synony� fo� � an� th� abilit� t� ru� th� CO� fil� �
o� �perfor� �� �comman� upo� th� fil� pointe� t� b� ZSWEE� �an� �finall� �th� �
abilit� �t� ru� an� comman� lin� yo� wis� fro� withi� ZWSEEP�  ZSWEE� ca� �b� �
rename� �t� whateve� nam� yo� prefe� a� i� discover� th� nam� i� wa� �invoke� �
b� fro� th� � syste� environment.
     � �hop� tha� yo� enjo� thi� program� an� us� i� well�  An� problems� �o� �
suggestion� �ma� b� directe� t� mysel� a� th� addres� o� th� firs� �page� �o� �
voic� at� (902� 89�-7252

                            Disclaime� an� warning

     Whil� �thi� progra� ha� bee� teste� o� man� systems� neithe� �Dav� �Ran� �
no� �� wil� accep� an� liabilit� o� responsibilit� t� th� use� o� �an� �othe� �
perso� �o� �entit� wit� respec� t� an� liability� los� o� damag� �caused� �o� �
alledge� t� b� cause� directl� o� indirectl� b� thi� program� including� �bu� �
no� limite� to� an� interruptio�  o� service� los� o� business� �anticipator� �
profit� o� cons�quentia� damage� resultin� fro� th� us� o� thi� program.
     Furthermore� �althoug� �thi� �progra� ha� bee� place� �int� �th� �publi� �
domain� �� alon� wit� Dav� Ran� retai� al� copyright� t� thi� program� �worl� �
wide� an� pursuan� t� this� thi� progra� MA� NO� B� SOL� B� AN� PART� �unles� �
specificall� �authorize� b� th� authors� i� writing� prio� t� th� firs� �cop� �
bein� �sold�  A� well� thi� progra� MA� NO� B� INCLUDE� I� AN� OTHE� �PACKAG� �
FO� SALE� eve� i� thi� progra� i� indicate� a� bein� 'i� th� publi� �domain'�  �
Al� o� th� abov� applie� t� bot� th� origina� a� wel� a� derived� o� modifie� �
copie� �o� th� original�  An� modifie�  copie� o� thi� progra� MUS� NO� �hav� �
th� copyrigh� notic� violated� change� o� altered.
     Pleas� repor� an� copyrigh� violation� t� th� author� �ZSWEE� Overview

     ZSWEE� �i� � director� an� fil� manipulatio� program�  Wit� it� yo� �ca� �
copy� �delete� �rename� �unsqueeze�  squeez� file� an� �ru� �othe� �programs�     �
Th� mos� importan� thin� t� remembe� whe� usin� ZSWEE� i� tha� i� provide� �� �
lis� �o� �you� file� i� ALPHABETICA� order�  Movin� aroun� i� �thi� �lis� �i� �
quit� easy� an� wil� soo� becom� secon� nature.
     I� thi� documentation� al� use� inpu� i� i� boldface� letters�  A� �well� �
whe� �th� �"current� fil� i� reference� i� thi� documentation� i� �mean� �th� �
fil� �jus� t� th� lef� o� you� input�  Thi� "current� fil� i� ofte� �referre� �
t� a� th� fil� yo� ar� "on".

Invokin� ZSWEEP

     T� �mak� �effectiv� �us� o� ZSWEEP� yo� mus� kno� �th� �variou� �option� �
availabl� t� yo� whe� yo� invok� ZSWEEP�  Her� ar� som� o� th� options:

A>ZS

     Thi� �forma� simpl� load� ZSWEEP� an� scan� th� defaul� driv� �an� �use� �
fo� �filenames� � Onc� �insid� ZSWEEP� yo� ma� chang� t� �� �differen� �driv� �
and/o� user� bu� whe� yo� exi� yo� wil� b� returne� t� th� director� tha� yo� �
calle� ZSWEE� from.

A>Z� *.COM

     Thi� �forma� load� ZSWEE� an� scan� th� curren� driv� an� use� �fo� �al� �
filename� wit� th� extensio� '.COM'�  Not� tha� ZSWEE� ca� fin� syste� �file� �
a� well� s� n� additiona� informatio� nee� b� given.

A>Z� B:*.CO� *�   

     Th� presenc� o� th� secon� asteris� indicate� t� ZSWEE� tha� yo� wis� t� �
sca� �al� �use� area� o� th� indicate� dis� drive�  I� thi� case� �al� �*.CO� �
file� o� al� use� area� o� driv� B.
     Combination� �o� th� abov� ar� acceptable� an� yo� ma� eve� lo� �t� �al� �
use� areas� an� fin� al� file� wit� th� specificatio� '*.� *'.

    Yo� ma� als� invok� ZSWEE� usin� name� directories

� ROOT� Z� WORDSTAR:*.COM

     Onc� insid� ZSWEE� yo� ar� presente� wit� � menu� the� � repor� o� whic� �
driv� �an� use� yo� ar� logge� to� ho� muc� spac� i� take� b� th� �file� �yo� �
hav� specified� ho� man� file� hav� bee� foun� wit� th� specific�tion� given� �
an� ho� muc� spac� i� lef� o� th� disk�  � sampl� follows:

Driv� A0/WORDSTAR:????????.??�  596� i� 3� files�  735� free.

     � �specia� �forma� o� thi� lin� show� tha� yo� ar� logge� �t� �al� �use� �
areas:

Driv� B*/N� NAME:????????.??� 950� i� 23� files�  2956� free.�     Fro� thi� point� yo� ma� execut� an� o� th� men� options.

     � �specia� displa� occur� i� n� file� ar� foun� wit� �th� �specificatio� �
yo� �hav� given� o� i� ther� ar� n� file� i� th� �give� �directory/drive/use� �
area(s):

N� files.

     Thi� �displa� ma� als� occu� i� yo� delet� al� th� file� ou� o� � �give� �
specification� � Whe� thi� occurs� you� men� choice� ar� limite� t� ONL� �'H� �
'S'� 'L� o� 'X'�  Thi� allow� yo� t� ge� th� Hel� screen� se� th� fre� �Spac� �
o� �� drive� t� Lo� t� anothe� directory/drive/user� o� t� eXit� �  N� �othe� �
choice� ar� valid� no� wil� the� b� accepted.


Comman� Structure

     Ther� ar� tw� primar� type� o� command� i� ZSWEEP� thos� tha� ac� o� on� �
fil� an� thos� tha� ac� o� man� files�  W� wil� g� throug� the� both� �Befor� �
doin� tha� though� let'� tr� movin� aroun� i� ZSWEE� first.

     T� �mov� �i� ZSWEEP� yo� mus� firs� understan� tha� th� �file� �o� �you� �
selecte� �director� wil� b� presente� t� yo� i� � sorte� manner� � Th� �file� �
ar� sorte� i� thi� order�  Filename� Fil� extension� use� area:

�   1� B0� -WOR�   .00�   0� �      
   2� B0� ARCAD�  .CO�   4� �    
   3� B0� ARCCOP� .CO�   2� � 

     A� �yo� ca� see� th� file� ar� numbere� fo� you� convenience� � Yo� �ma� �
no� �directl� �us� �thes� �numbers�  A� well� th� fil� �siz� �i� �als� �show� �
(rounde� t� th� neares� bloc� size).

     Not� �tha� i� yo� hav� enable� th� revers� vide� sequenc� (se� �Epilog)� �
yo� ma� se� som� o� th� letter� i� th� filenam� printe� i� revers� video� Th� �
char� belo� show� ho� t� decod� thi� information.

�          FFFFFFF� RSA
          1234567� /YR
          |||||||� OSC
   4� B0� ARCDE�  .CO�   2� � 

     A� �yo� ca� see� thi� look� confusing�  Really� though� i� i� not� � Th� �
tag� �F�-F� normall� ar� no� used� bu� ZSWEE� allow� yo� se� F�-F� �fo� �you� �
ow� �use�  Th� R/� ta� mean� tha� th� fil� ma� b� read� bu� no� �writte� �to�  �
Th� �SY� ta� mean� tha� th� fil� doe� no� appea� i� norma� DI� listings� �an� �
i� CP/� 3� MP� an� CP/� 8� als� mean� tha� thi� fil� i� availabl� t� al� use� �
areas�  Th� AR� ta� mean� that� i� set� th� fil� ha� bee� backe� u� sinc� �i� �
wa� las� accessed.
.PA�     No� �tha� �yo� understan� ho� file� ar� presented� w� ca� g� �throug� �� �
sampl� session�  Remember� use� inpu� i� i� boldface� letters.

A>Z� B:
        ��������������������������������������-�  
        �                                      |
        �   ZSWEE� � Versio� 1.�  04/04/9�     |
        �                                      |
        �        (c� Pet� Pardo� 199�          |
        �  Portion� (c� Dav� Ran� 1983� 198�   |
        �                                      |
        ��������������������������������������-+
                                                                                
Driv� B0/WOR�    :????????.??�   850� i�  6� files�   118� free.

   1� B0� -WOR�   .00�   0� � <SP>
   2� B0� ARCAD�  .CO�   4� � <SP>
   3� B0� ARCCOP� .CO�   2� � <CR>
   4� B0� ARCDE�  .CO�   2� � <CR>
   5� B0� ARCDI�  .CO�   2� � B
   4� B0� ARCDE�  .CO�   2� � B
   3� B0� ARCCOP� .CO�   2� � B
   2� B0� ARCAD�  .CO�   4� � B
   1� B0� -WOR�   .00�   0� � X� 

                      Singl� Fil� Commands� 

Help

     A� an� point� yo� ma� reques� th� mai� hel� men� b� pressin� '?'.

   1� B0� -WOR�   .00�   0� � ?
        ��������������������������������������-�  
        �                                      |
        �   ZSWEE� � Versio� 1.�  04/04/9�     |
        �                                      |
        �        (c� Pet� Pardo� 199�          |
        �  Portion� (c� Dav� Ran� 1983� 198�   |
        �                                      |
        ��������������������������������������-+
                                                                                
  � � Reta�  file�         � � � Squeeze/Unsqueez� tagge� file�                 
  � o� u� arro� � Bac� u�  � � � Renam� file(s�                                 
  � � Cop� fil�            � � � Chec� remainin� spac�                          
  � � Delet� fil�          � � � Ta� fil� fo� E,M,� o� �                        
  � � Eras� T/� file�      � � � Unta� fil�                                     
  � o� � � Fin� fil�       � � � Vie� fil�                                      
  � � G� t� (Run� progra�  � � � Wildcar� ta� o� file�                          
  � � Lo� ne� director�    � � o� ^� � Exi� t� � syste�                             
  � � Mas� fil� cop�       � � � Se� fil� attribute� tagge� file�               
  � � Prin� fil�           � � � psued� � syste� prompt.
  Return� spac� o� Dow� Arro� � Forwar� on� fil�                                
                                                                                �Movin� forwar� an� backward

     A� yo� ca� see� th� tw� mos� commo� command� wil� b� movin� forwar� �an� �
backward� �throug� th� directory�  Eithe� th� SPAC� ba� <SP>� o� �th� �RETUR� �
ke� �<CR� o� th� dow� arro� ma� b� use� t� mov� forward�  T� �mov� �backward� �
simpl� us� th� 'B� ke� o� th� u� arrow� Not� tha� al� command� i� ZSWEE� �ca� �
b� eithe� i� uppe� o� lowercase�  Inter�ally� lowercas� wil� b� converte� �t� �
uppercase� � I� yo� reac� th� en� o� th� director� wit� eithe� �command� �yo� �
wil� b� "wrappe� around� t� th� othe� en� automatically.

Exiting

     T� �exit� �jus� �us� ^� o� th� 'X� comman� a� show� �above� � Thi� �wil� �
retur� �yo� �t� th� sam� driv� an� use� are� tha� yo� �invoke� �ZSWEE� �from� �
regardles� o� anythin� yo� ma� hav� don� i� ZSWEEP.


Findin� � file

     Sinc� yo� ma� hav� man� hundred� o� file� selected� yo� ma� wis� t� mov� �
rapidl� �t� �� �particula� file�  Yo� ma� d� thi� throug� th� �'F'� �o� �FIN� �
command� � Th� 'J� i� accepte� fo� � synony� fo� 'F� fo� thos� accustome� �t� �
ZFILER

�   1� B0� -WOR�   .00�   0� � F�  Whic� file� BASCOM

   8� B0� BASCO�  .CO�  32� :

     Th�  Fin� comman� alway� start� lookin� fro� entr� numbe� one�  Yo� �ma� �
us� �th� �standar� CP/� synta� fo� wildcardin� (eg� t� fin� �th� �firs� �.HE� �
file� �yo� ma� us� *.HEX)� an� als� not� tha� th� Fin� comman� wil� fil� �al� �
blan� space� wit� questio� marks�  Thi� make� th� searc� string� 'B*.*'� 'B'� �
an� �'B??????.� � al� �fin� �th� �firs� fil� �beginnin� �wit� �'B'� � A� �yo� �
experiment� yo� wil� fin� othe� interestin� use� fo� thi� command.
     A� �thi� �point� yo� no� kno� ho� t� mov� throug� you� �directory� �bot� �
rapidl� an� on� ste� a� � time�  Let'� mov� o� t� som� mor� usefu� co�mands.

.PA�G� t� File

Yo� �ma� �temporaril� leav� ZSWEE� t� perfor� othe� task� wit� �a� �automati� �
retur� t� th� exac� spo� yo� lef� of� wit� th� 'G� command�  I� th� fil� �yo� �
G� t� i� � CO� fil� yo� wil� se� th� 'tail?� promp� t� whic� yo� ma� �respon� �
wit� whateve� informatio� yo� wis� t� fee� t� th� progra� (fil� name� option� �
etc.�  I� th� progra� i� no� � CO� fil� yo� wil� b� aske� 'Comman� t� perfor� �
o� �file?� t� whic� yo� ma� respon� wit� th� CO� fil� tha� yo� wis� �t� �hav� �
ac� upo� thi� file�  Fo� example:

  41� A0� Z3PLU�  .CO�   16� :
  42� A0� Z3PLU�  .LB�   28� � G�  Comman� t� perfor� o� file� LGE� <RET>
  Tail�  DEFAULT.Z3� <RET>
 
Notic� �tha� �onc� yo� hav� give� th� nam� o� th� comman� tha� �yo� �wis� �t� �
perfor� �Yo� �wil� �se� �th� 'Tail?� promp� t� whic� �yo� �ma� �respon� �wit� �
whateve� fil� name� o� option� yo� wish�  Onc� th� comman� ha� bee� performe� �
yo� wil� se� 'Strik� an� ke� �-� whic� yo� ma� d� a� soo� a� yo� hav� �viewe� �
whateve� informatio� ma� hav� resulte� fro� th� command�  Onc� yo� strik� th� �
ke� yo� wil� b� returne� t� th� exac� plac� wher� yo� lef� of� i� ZSWEEP� 


Viewin� an� Printin� � file

     Th� �Vie� command� invoke� wit� � 'V'� wil� typ� th� curren� �fil� �ont� �
th� scree� unsqueezin� th� fil� i� required�  Not� tha� thi� comman� wil� NO� �
preven� yo� fro� listin� AN� typ� o� file� s� yo� mus� us� you� ow� �judgmen� �
o� �wha� �ca� an� canno� b� listed�  A� th� en� o� eac� pag� o� �th� �screen� �
vie� wil� stop� an� allo� yo� t� abor� th� viewin� wit� � ^� o� � ^X�  T� ge� �
on� mor� lin� fro� th� file� hi� th� spac� bar�  T� ge� anothe� page� hi� th� �
<CR� o� RETUR� key.

     Th� Prin� command� invoke� wit� � 'P'� wil� sen� th� curren� file� �wit� �
n� �modification� o� paging� t� th� curren� LST� device�  Yo�  ma� abor� �th� �
prin� wit� � ^� o� ^X�  Al� othe� feature� o� th� Vie� comman� apply.


Deletin� � file

     Yo� �ca� �delet� th� curren� fil� jus� b� hittin� th� 'D� �key� � Befor� �
deletio� occurs� yo� wil� b� prompted.

�  12� B0� CDP�   �     40� � D�  Delet� file� Y
  12� B0� DEA�   .DA� 100� :

     I� �an� repl� othe� tha� 'y� o� 'Y� i� given� th� fil� i� �no� �deleted�  �
I� �th� �fil� i� deleted� i� i� remove� fro� th� lis� an� th� �nex� �fil� �i� �
give� th� curren� file'� number.
     I� th� fil� i� � Rea� Onl� file� yo� wil� b� prompte� again:

�  12� B0� CDP�   �     40� � D�  Delet� file� Y�  R/O� Delete� Y
  12� B0� DEA�   .DA� 100� :
�Copyin� � file

     Whil� �o� an� file� yo� ma� cop� tha� fil� to� A�  Anothe� name� o� �th� �
sam� ���directory/drive/use� ��� B� �� Anothe� ��name� ��o� ���� ���differen� �
directory/drive/use�   C� Th� sam� name� o� � differen� directory/drive/user
     ZSWEE� ��wil� ��preven� ��yo� �fro� �copyin� �� ��fil� ��t� ��th� ��sam� �
directory/drive/use� tha� th� sourc� fil� reside� on�  Othe� tha� that� ther� �
ar� �n� restriction� o� wher� yo� wis� th� fil� t� be�  I� � fil� �exist� �o� �
th� �sam� directory/drive/use� tha� yo� wis� t� plac� th� �destinatio� �file� �
th� �existin� fil� i� delete� automatically� eve� i� i� i� Rea� �Only� � Whe� �
ZSWEE� �copie� � file� al� th� attribute� o� th� origina� fil� ar� passe� �o� �
t� �th� �destinatio� file�  Thus� i� � fil� i� � SYS� R/� file� �ZSWEE� �wil� �
caus� �th� �destinatio� �fil� t� b� SYS� R/� afte� th� fil� �cop� �ha� �take� �
place.

�  12� B0� CDP�   �  40� � C�  Cop� t� (filespec)� C9:BACK.CDP

     I� �yo� wis� t� preserv� th� nam� o� th� file�  yo� ma� jus� �ente� �th� �
destinatio� �director� �o� drive/use� par� o� th� filespe� (eg� �C9� �I� �th� �
precedin� exampl� woul� hav� copie� th� fil� t� driv� � use� 9� retainin� th� �
nam� �CDP1)�  Jus� enterin� th� driv� par� o� th� filespe� cause� �ZSWEE� �t� �
retai� th� use� numbe� o� th� sourc� file�  Yo� ma� als� us� name� �director� �
reference� �i� �yo� prefer� jus� remembe� tha� al� cop� �operation� �mus� �b� �
followe� b� � colo� ':�  o� th� fil� wil� b� copie� t� � fil� o� tha� nam� i� �
th� curren� directory.
     I� �th� �filenam� i� followe� b� � space� the� � 'V'� th� fil� �wil� �b� �
verif� rea� afte� i� i� written�  ZSWEE� maintain� � CR� o� th� fil� a� i� i� �
writin� th� file� an� verifie� thi� CRC.

Renamin� files

     Th� Renam� comman� ('R'� ma� b� use� to� A� Chang� th� nam� o� on� �fil� �
B� �Chang� th� name� o� man� file� C� Chang� th� use� numbe� o� on� �fil� �D� �
Chang� th� use� numbe� o� man� files
     T� jus� chang� th� nam� o� on� file� th� synta� i� simple:

�  12� B0� TEST�  �  40� � R�  Ne� name� o� *� TEST2
  12� B0� TEST�  �  40� :

     Yo� ma� als� chang� th� use� number/director� o� th� file� a� follows:

�  12� B0� TEST�  �  40� � R�  Ne� name� o� *� B1:TEST1
                        or
�  12� B1� TEST�  �  40� � R�  Ne� name� o� *� WORK:TEST1

     Not� �tha� i� al� use� area� ar� no� specifie� i� th� logo� �o� �ZSWEEP� �
th� fil� ma� no� b� show� o� you� lis� whe� renamin� t� anothe� use� area.
     T� �chang� � grou� o� file� fro� on� nam� t� another� yo� ma� ente� �th� �
followin� comman� a� an� file:

�   9� B0� BASI�   .CO�  24� � R�  Ne� name� o� *� *
Ol� name� *.HEX� 
Ne� name� *.BAK�     A� �thi� poin� al� file� wit� th� extensio� .HE� wil� b� rename� t� �th� �
sam� filenam� bu� wit� th� extensio� .BAK�  Yo� wil� se� � runnin� displa� o� �
th� scree� a� eac� fil� i� renamed�  An� vali� wildcar� ma� b� use� t� selec� �
th� sourc� files� an� th� destinatio� file� wil� tak� on� characte� fro� �th� �
sourc� �fo� �eac� �'?� i� th� name�  A� asteris� �qualifie� �a� �fillin� �th� �
remainde� o� th� fiel� wit� '?'�  I� th� destinatio� fil� exists� th� �renam� �
i� no� made.
     Yo� �ma� �als� choos� t� renam� � grou� o� file� t� anothe� �use� �area� �
optionall� changin� thei� name� a� well:

�   9� B0� BASI�   .CO�  24� � R�  Ne� name� o� *� *
Ol� name� *.HEX� 
Ne� name� B1:*.BAK

     Thi� �comman� wil� renam� al� .HE� file� o� driv� � use� � t� �th� �sam� �
filename� �bu� �wit� �th� extensio� .BAK� an� plac� �th� �resultan� �fil� �i� �
user1� �Yo� ma� wan� t� tr� thi� comman� � fe� time� t� ge� th� han� o� �it� �
bu� i� i� extremel� powerful.


Th� Spac� command

     Th� �Spac� comman� 'S� simpl� ask� yo� fo� � driv� code� the� tell� �yo� �
th� �remainin� �spac� �o� �th� driv� yo� specif� �(yo� �ma� �als� �us� �name� �
directorie� here)�  Befor� doin� th� spac� check� � driv� rese� i� performed� �
s� fee� fre� t� chang� disks.


Th� Lo� Command

     Th� Lo� comman� 'L� allow� yo� t� chang� you� director� t� anothe� driv� �
o� �user�  Additionally� i� allow� yo� t� r�-specif� th� wildcar� �mas� �jus� �
lik� �enterin� �th� �ZSWEE� progra� fro� th� � system�  A� �well� �th� �driv� �
syste� �i� �reset� �s� �agai� yo� shoul� b� abl� t� �chang� �t� �� �differen� �
diskett� �a� �thi� �poin� o� t� anothe� par� o� �th� �sam� �diskette� � Name� �
director� reference� ma� b� use� wit� thi� comman� a� well.

�  16� B0� D�   .CO�   4� � L�  Ne� directory/mask� A14:*.HEX

        ��������������������������������������-�  
        �                                      |
        �   ZSWEE� � Versio� 1.�  04/04/9�     |
        �                                      |
        �        (c� Pet� Pardo� 199�          |
        �  Portion� (c� Dav� Ran� 1983� 198�   |
        �                                      |
        ��������������������������������������-+

Driv� A14/N� NAM� :????????.??�   144� i�   � files� 1118� free.

�  1� A14:ZSWEE�  .SR�  72K:

.PA�Th� Psued� � Syste� Prompt

ZSWEE� wil� allo� yo� t� ente� an� ru� an� comman� lin� yo� choos� s� lon� a� �
i� �doe� �no� �exceee� 12� characters�  Th� comman� t� invok� �th� �psued� �� �
syste� promp� i� th� 'Z� command�  Onc� i� ha� ru� you� comman� lin� yo� wil� �
b� returne� t� ZSWEE� a� th� exac� locatio� yo� lef� i� i.e� pointin� a� �th� �
sam� fil� numbe� a� whe� yo� left.

  41� A0� Z3PLU�  .CO�   16� :
  42� A0� Z3PLU�  .LB�   28� � Z� 
D0:ASSEMBLY>PW� <RET>
PWD� Versio� 2.0
D� � DI� Nam�     D� � DI� Nam�     D� � DI� Nam�     D� � DI� Name
����  ��������    ����  ��������    ����  ��������    ����  �������-
�  0� WORDSTA�    �  1� OUTTHINK
 
�  0� LETTER�     �  1� TEXT


                 Introductio� t� Multifil� Commands

     No� tha� al� th� command� tha� affec� singl� file� hav� bee� �described� �
i� �i� tim� t� introduc� th� concep� o� Multifil� commands� � Thes� �command� �
ar� one� tha� affec� a� fe� a� on� o� a� man� a� al� o� th� file� o� � singl� �
disk� � T� �affec� thes� files� though� w� mus� hav� som� wa� �o� �describin� �
whic� �file� �nee� t� b� affected�  CP/� ha� � wa� t� d� this� �usin� �"wil��
cards"�  Thi� program� o� th� othe� hand� use� th� concep� o� � fil� "tag".

Th� Ta� command

     Taggin� �� �file� �i� it� simples� form� ca� �b� �accomplishe� �jus� �b� �
depressin� th� 'T� ke� whe� th� fil� t� b� tagge� appears�  Wha� exactl� i� � �
tag� � � tagge� fil� i� � fil� i� th� lis� o� filename� tha� ha� a� �asteris� �
nex� t� th� colo� afte� th� nam� o� th� file� a� show� below.

�   9� B0� BASI�   .CO�  24� :*

     � �tagge� �fil� i� differen� fro� a� untagge� fil� i� tha� yo� �ma� �no� �
reques� a� operatio� tha� deal� wit� severa� unrelate� file� (eg.� File� tha� �
wil� no� matc� usin� onl� on� wildcard)�  � sample"tag� sessio� i� shown:

�   9� B0� BASI�   .CO�  24� � T�  Tagge� file� �   24� �  23K).
  10� B0� BRU�    .CO�  16� � T�  Tagge� file� �   40� �  39K).

     Not� �tha� �th� �'T� comman� automaticall� �perform� �� �"mov� �forward� �
operation.
     T� �th� righ� o� th� 'Tagge� files� messag� tw� number� �ar� �displayed� �
Th� �number� �ar� th� tota� siz� i� K� o� th� file� yo� hav� tagge� �s� �far� �
Thi� �i� �usefu� �if� �fo� example� yo� ar� movin� file� �fro� �on� �siz� �o� �
diskett� t� another� smaller� siz� diskette�  I� th� sourc� dis� hold� �500K� �
an� th� destinatio� hold� 256K� yo� ca� sto� th� taggin� operatio� whe� �you� �
siz� i� jus� les� tha� 256K�  Th� ta� functio� i� itsel� doe� no� perfor� an� �
operation� othe� tha� t� mar� th� fil� fo� � futur� "mass� operation.�     B� �no� th� astut� reade� wil� notic� tha� � hav� cleverl� skippe� �ove� �
th� �functio� �o� th� secon� numbe� display� th� on� �i� �parenthesis� � Thi� �
numbe� �i� th� combine� siz� o� th� tagge� files� I� 1� BLOCKS�  I� �yo� �ar� �
usin� � compute� syste� tha� support� man� differen� dis� sizes/formats� o� � �
syste� wit� � har� dis� attached� yo� ma� alread� kno� tha� CP/� ca� allocat� �
storag� onl� i� "BLOCKS"� an� tha� thes� "BLOCKS� ma� b� u� t� 16� i� length� �
Thi� �mean� �tha� �ZSWEE� �woul� sho� � fil� containin� �say� �51� �byte� �i� �
information� �a� �bein� u� t� 16� long� dependin� o� th� bloc� siz� �o� �you� �
disk� � Th� �secon� �numbe� i� th� ta� displa� show� �ho� �muc� �storag� �th� �
cumulativ� file� woul� tak� i� the� wer� store� o� � diskett� wit� 1� �block� �
whic� i� th� lowes� commo� denominator.

Wildcar� tagging

     Anothe� �wa� t� ta� file� i� th� wildcar� ta� function� � Thi� �functio� �
accept� � CP/� typ� wildcar� an� proceed� t� ta� al� th� file� tha� matc� th� �
wildcard� � T� �invok� this� jus� hi� 'W� an� yo� wil� b� prompte� �wit� �th� �
messag� �'Whic� �files� �� Ente� an� CP/� wildcard� righ� dow� �t� �� �uniqu� �
filename� an� i� tha� fil� exist� i� wil� b� tagge� an� displayed.

Untaggin� files

     I� yo� ca� ta� � file� yo� mus� b� abl� t� Unta� � fil� a� well.

�   9� B0� BASI�   .CO�  24� :*U�  Tagge� file� �   16� �  16K).
  10� B0� BRU�    .CO�  16� :*

     A� �yo� �ca� see� th� unta� functio� subtract� th� curren� �file'� �siz� �
fro� th� tota� the� display� th� tota� o� th� remainin� files.

Th� Mas� Cop� Command

     No� �tha� w� hav� � numbe� o� file� "tagged"� wha� d� w� d� �wit� �them� �
Wel� �th� �Mas� cop� functio� i� on� o� thos� tha� act� o� man� �files� � It� �
purpos� i� t� cop� th� tagge� file(s� fro� on� director� t� another.

�  12� B0� CDP�    �    40� � M�  Cop� to� WORK� V
Copyin�  �-� B0� BRU�   .CO� t� B1�  wit� verif� Verifyin� �-� fil� ok.

     Th� �'V� �i� optional� an� i� indicate� tha� yo� wis� t� hav� �th� �fil� �
verifie� afte� i� i� written.
     A� �yo� ca� see� th� file� hav� bee� sen� t� driv� A� use� 14� � I� �yo� �
wis� �th� �tagge� file� t� resid� i� th� sam� use� are� a� th� �sourc� �file� �
afte� �th� copy� d� no� specif� � use� are� i� th� Mas� command� � Thi� �wil� �
caus� ZSWEE� t� pu� th� fil� i� th� sam� use� are� a� th� sourc� file.
    ZSWEE� wil� no� allo� yo� t� cop� � fil� t� th� sam� driv� an� use� �are� �
a� th� source�  Th� cop� i� simpl� no� made.
    Name� directorie� ma� als� b� use� fo� th� mas� operation� i� yo� prefer�    

Afte� th� Mass

     Afte� �an� �mas� fil� operation� th� tag� ar� "reset� a� �eac� �fil� �i� �
copied�  Visually� the� chang� fro� � '*� t� � '#'�  Th� file� ar� �logicall� ��untagged� �an� wil� respon� a� such�  But� sinc� ZSWEE� remember� �them� �yo� �
ca� �automaticall� �reta� thes� files�  Thi� i� usefu� if� fo� �example� �yo� �
nee� t� cop� th� sam� file� t�  � numbe� o� differen� diskette� o� use� area� �
o� � drive�  T� invok� this� us� th� 'A� command.

�  12� B0� CDP�   �  40� � A
Retaggin�-� B0� BRU�  .CO� Tagge� file� �   16� �  16K)


Erasin� Files

     Yo� ma� wan� t� cop� � grou� o� files� the� delet� the� fro� th� �sourc� �
dis� �afte� th� cop� ha� bee� made�  T� d� this� yo� ca� us� eithe� �th� �'C� �
comman� �t� copy� followe� b� th� 'D� command� whic� i� tedious� o� � �comb��
natio� �o� th� 'T'� 'M'� 'A'� an� th� 'E� commands�  Th� 'E� �comman� �Erase� �
tagge� o� untagge� file� a� you� option� o� � globa� scale.

�  12� B0:CDP�   �   40� � E� Eras� Tagge� o� Untagge� file� (T/U)� T
        D� yo� wis� t� b� prompte� (Y/N/A)� N

Deletin�  �-� B0� BRU�   .COM

     I� �yo� specif� Untagge� files� th� untagge� file� wil� b� erased� � Yo� �
ma� �wis� �t� b� prompte� befor� eac� fil� i� t� b� deleted� an� yo� �ca� �d� �
thi� vi� th� secon� questio� o� yo� ma� Abor� th� reques� t� delete.

Squeezin� an� Unsqueezin� files

     Th� 'Q� comman� allow� yo� t� Squeez� an� Unsqueez� tagge� files� � Thi� �
fil� �squeez� �progra� �i� compatibl� �wit� �th� �origina� �squeeze/unsqueez� �
program� �writte� i� th� 'C� languag� b� Richar� Greenlaw�  Afte� hittin� �Q� �
yo� wil� se� th� prompt:

Squeeze� Unsqueez� o� Revers� (S/U/R)?

     Afte� �answerin� �thi� skil�-testin� question� yo� wil� b� �aske� �whic� �
directory/drive/use� �yo� �wis� t� plac� th� destinatio� files� � Th� �synta� �
her� i� th� sam� a� fo� th� Mov� command� excep� i� i� permissibl� t� 'Q� th� �
file� bac� t� th� sam� directory/drive/use� tha� the� originated.
     Whe� 'Q� i� invoked� yo� ar� aske� i� yo� wis� t� Squeeze� Unsqueez� �o� �
Reverse� � � �carriag� �retur� her� wil� retur� yo� t� th� �comman� �lin� �o� �
ZSWEEP.
     I� yo� selec� 'S� fo� Squeeze� al� tagge� file� wil� b� examine� t�  se� �
i� �i� �i� "worth� squeezin� them�  File� tha� exhibi� AN� �spac� �reduction� �
eve� i� i� i� onl� on� sector� wil� b� squeezed�  I� th� fil� i� no� �"worth� �
squeezin� i� wil� simpl� b� copie� t� th� destinatio� directory/drive/user.
     I� �yo� selec� 'U� fo� Unsqueeze� al� tagge� file� wil� b� �examine� �t� �
se� i� the� ar� squeezed�  I� the� are� the� wil� b� unsqueezed� an� move� t� �
th� �destinatio� directory�  I� the� ar� no� squeezed� the� the� �ar� �simpl� �
copied.
     I� �yo� �selec� �'R� fo� Reverse� al� file� tha� ar� �squeeze� �wil� �b� �
unsqueezed� �an� �al� file� tha� ar� unsqueeze� wil� b� squeeze� �(i� �i� �i� �
wort� it)� an� move� t� th� destinatio� directory.�     Th� mos� attractiv� featur� o� th� 'Q� comman� i� genera� i� th� abilit� �
t� Squeez� file� ONL� i� i� i� "worth� it�  Thi� mean� tha� b� usin� �ZSWEEP� �
yo� ca� archiv� dat� int� th� absolut� minimu� amoun� o� spac� possible�  Th� �
S� �algorith� �use� �i� ZSWEE� i� bette� tha� th� on� �i� �th� �origina� �'C� �
squeezer� �an� �produce� �th� �smalles� outpu� �fil� �possibl� �wit� �curren� �
technology.

     Th� �fil� �squeeze� �sectio� �wa� �don� �b� �Ji� �Lopushinsky� �an� ��i� �
copyrighte� �separatel� �b� �him�  H� als� ha� � publi� �domai� �stan� �alon� �
squeezer.

Settin� th� Tagge� File� Status

     Yo� ma� se� th� attribute� o� � grou� o� tagge� file� jus� lik� STAT� o� �
PROT�  T� d� this� ta� th� file� an� selec� th� 'Y� command.

  12� B0� CDP�   �    40� � Y�  Whic� flag� (�-4,R,S,A)� R,S
Settin� ��-� B0� BRU�    .CO� t� R/�  SYS

     Th� �flag� �yo� ma� se� ar� th� F�-F� flags� a� wel� a� th� �Rea� �Only� �
System� an� Archiv� (MP/M� CP/� � only� flags�   An� flag� yo� d� no� specif� �
wil� �b� �reset� � T� rese� al� th� flag� (i.e.� Chang� t� R/W� �DI� �an� �n� �
"Syso� tag"� jus� ente� � singl� comm� o� spac� a� th� "Whic� flags� �prompt�   �
Not� �tha� th� flag� i� th� "Whic� flags� questio� d� no� hav� t� b� �entere� �
wit� �� comm� betwee� them� a� anythin� (o� nothin� a� all!� wil� do� A� �fa� �
a� th� progra� i� concerne� 'RSA'� '� � A'� an� 'R,� A� ar� al� valid.

                            Epilogue

     Al� �th� function� o� ZSWEE� hav� no� bee� described�  Th� bes� �wa� �t� �
ge� mor� familia� wit� th� progra� i� t� actuall� US� it�  � thin� i� wil� b� �
on� o� you� mos� frequentl� use� program� jus� a� i� onc� wa� unde� CP/M�  I� �
yo� thin� o� anythin� tha� yo� fee� woul� b� especiall� usefu� t� hav� i� th� �
progra� pleas� forwar� you� suggestion� t� m� an� � wil� conside� them�  � a� �
presentl� �workin� o� changin� th� squeez� section� t� Crunc� a� i� �acheive� �
bette� �compressio� �an� i� becomin� mor� popula� a� wel� a� th� �abilit� �t� �
mov� int� � librar� an� ac� upo� th� file� i� i� jus� a� i� dis� mode.

                             Credits

Thank� t� Dav� Ran� wh� authore� th� origina� NSWEE� program� t� Bruc� Morga� �
wh� i� workin� o� NZCO� compatibilit� (particularl� use� area� 1�-31� a� � a� �
onl� �abl� t� tes� i� o� m� syste� whic� i� � Z3PLU� system� t� Ia� �Cottrel� �
wh� als� assiste� m� wit� Bet� Testing� t� th� author'� o� th� � syste� unde� �
whic� �th� progra� run� an� finall� t� th� author� o� al� th� fin� �librarie� �
fo� th� � system�   � a� releasin� th� progra� t� th� publi� domai� wit� �th� �
kin� �permissio� o� Dav� Ran� t� who� w� al� ow� � deb� o� gratitud� fo� �th� �
origina� �program� � Thi� fil� ha� bee� create� fro� NSWEEP207.DO� an� �s� �� �
expres� �m� gratitud� a� wel� t� Dav� McCrad� wh� prepare� th� origina� �fil� �
an� als� gav� hi� kin� permissio� fo� it� modification.

Apri� 5� 199�  Trur� N.S� Canada
