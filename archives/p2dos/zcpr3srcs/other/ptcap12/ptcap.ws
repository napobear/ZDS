                      PTCA� (PBB� TCA� Modifier)

Versio� 1.2    05/16/8�                              

     Whe� � firs� installe� PBB� an� deceide� t� us� th� TCA� support� �
� wa� usin� th� lates� versio� o� TCAP�� versio� 1.9�� � wa� tol� the� �
tha� whe� � upgrade� th� TCAP�� � woul� hav� t� manuall� chang� al� o� �
th� entrie� i� m� use� bas� t� reflec� th� user� prope� termina� �
selection�� A�� th� time�� thi� di� no� see� lik� tha�� muc� o� � �
sacrafice�� Afte� all�� ho�� man� user� ca� ther� be�� Well�� afte� �
installin� fiv� ne� TCAP'� an� upgradin� PBB� t� handl� � use� bas� o� �
40� users�� � deceide� tha� somethin� ha� t� b� don� t� facilitat� th� �
upgrad� process� Thu� cam� PTCAP.

     PTCAР wa� designe� t� completel� instal� � ne� TCA� withou�� th� �
nee� t� manuall� chang� th� use� base� I� wil� rea� th� ne� TCA� t� b� �
installe� an� th� curren� TCA� int� memor� an� the� proces� th� use� �
base� Th� user� recor� i� rea� i� an� th� ol� termina� inde� numbe� i� �
use� t� fin� th� ol� termina� i� string�� Th� ne� TCA� fil� i� the� �
scanne� fo� � match�� Whe� � matc� i� found�� th� ne� inde� numbe� i� �
calculate� an� place� int� th� use� record�� AL� record� ar� processe� �
t� eliminat� th� ris� o� corruptin� th� use� index�� Processin� i� no� �
lightnin� fast�� bu� th� jo� get� done�� Complet� processin� o� � 40� �
recor�  use�  bas�  take� les� tha� � minutes�� Fo� safet� reasons�� � �
completel� ne� USE� fil� i� create� calle� USERS.NEW�� Onc� satisfie� �
tha� th� integrit� o� th� fil� ha� bee� maintained� yo� jus� renam� i� �
t� USERS.PBӠ an� renam� th� ne� TCA� fil� t� whateve� yo� us� a� � �
defaul� name� an� yo� ar� read� t� go.

SYNTAX:

          PTCA� newfil� [oldfile� [� o� ?]

          Newfil� i� th� ne� TCA� fil� yo� wis� t� install�� Yo� nee� �
          no� specif� th� extent� TC� i� th� defaul� extent.

          Oldfile�� whe� specified�� i� th� nam� o� th� currentl� use� �
          TCA� file� I� no� specified� � defaul� nam� o� Z3TCAP.TC� i� �
          used.
          
          Th� '/� an� '?� ar� optiona� an� bot� invok� th� interna� �
          hel� features.

     Plac� thi� progra� o� th� sam� D� a� you� PBB� syste� files�� o� �
i� usin� ZCPR3.x�� anywher� o� you� searc� path�� Th� progra� wil� �
automaticall�� lo� int� th� D� yo� hav� specifie� a� th� syste� driv� �
an� use� area� THES� VALUE� AR� DEFINE� INTERNALL� I� THI� PROGRA� AN� �
MUS� B� SE� FO� YOU� SYSTEM�� Yo� wil� hav� t� edi� th� sourc� cod� t� �
sui� you� syste� need� an� reassembl� usin� M8� o� SLR180+�� Afte� th� �
assembly� yo� wil� hav� t� LIN� wit� SYSLIB36.REL.




�The following commands should be used:

Assembly -     M80 =PTCAP12        using M80 or
               SLR180P PTCAP12/6   if using SLR180+

Link     -     L80 PTCAP12/P:100,SYSLIB36/S,Z3LIB13/S,PTCAP12/N/U/E
     
NOTE:�         Yo�� wil� hav� t� mak� sur� tha�� SYSLIB36.RE̠ an� 
���������������Z3LIB13.REL are both in your working DU.


     Whe� th� modificatio� i� completed�� th� TCA� file� wil� remai� �
unaltered�� You� origina� use� bas� i� no� change� an� th� ne�� fil� �
necessar� i� create� i� th� sam� disk/use� area�� Th� ne� use� bas� i� �
calle� USERS.NEW��� Renam� you� ol� USERS.PBӠ t� somethin� lik� �
USERS.OLĠ the� renam� USERS.NE� t� USERS.PBS�� Thi� wil� complet� th� �
installatio� o� th� ne� use� base�� Renam� you� curren� Z3TCAP.TCР t� �
Z3TCAPxx.TCP�� wher� x�� i� th� versio� numbe� o� th� previou� file� �
the� renam� th� curren� versio� t� Z3TCAP.TCP�� Thi� wil� complet� th� �
installatio� o� th� ne� TCA� file� Whe� yo� hav� complete� testin� th� �
ne�� use� bas� an� TCAP�� yo� ma� eras� th� USERS.OLĠ fil� an� th� �
Z3TCAPxx.TC� file.

     Th� ne� use� file� wil� contai� ne� inde� number� reflectin� th� �
sam� termina� selection� use� i� th� previou� file� 

IMPORTANT�     An� terminal� liste� i� th� ol� fil� tha� d� no� appea� �
i� th� ne� listin� wil� b� update� a� thoug� th� use� di� no�� reques� �
� terminal�� I� version� 2.� o� later� recor� � specifie� th� termina� �
i� strin� a� (Non� requested).

     I� thi� case�� eithe� suppor� fo� tha� particula� termaina� ha� �
bee� dropped�� o� someon� ha� change� th� i� string� i� th� files� Th� �
onl�� change� tha�� shoul� b� mad� t� th� TCA� file� shoul� b� th� �
additio� o� ne� terminals�� Non� shoul� eve� b� droppe� an� n� on� �
shoul� eve� chang� th� wa� th� terminal� ar� identified�� Althoug� �
researc� ha� prove� tha� som� terminal� hav� actuall�� bee� droppe� �
fro� th� listings�� I� upgradin� fro� versio� 2.� t� 2.� alone�� fou� �
terminal� hav� bee� droppe� fro� th� list� Whe� thi� happens� th� use� �
wil� jus� hav� t� re-selec� his/he� termina� o� thei� nex�� call�� A� �
completion� th� progra� wil� selec� th� tota� numbe� o� terminal� tha� �
hav� bee� droppe� fro� th� list��� Th� user� affecte� wil� b� �
automaticall�� route� bac� throug� th� termina� selectio� proces� o� �
their next call.

I� yo� hav� an� difficultie� o� suggestions�� pleas� direc� the� t� m� �
a� on� o� th� number� liste� below� 

Acces� Programmin� RA�   Ceda� Mill� Z-Nod� 2�    Dalla� Connection
(503��644-090�           (503� 644-4621           (214� 964-4356 
SYSOP� Terr� Pint�       SYSOP� Be� Gre�          SYSOP� Rus� Pencin
(503� 646-493� Voice
6:00p� t� 10:00p� ONLY

Than� yo� fo� you� suppor� an� Happ� Modeming.�