.he   ZXLATE - 8080 TO Z80 SOURCE CODE TRANSLATOR                            #


                ZXLATE - AN 8080 TO Z80 SOURCE CODE TRANSLATOR
                     Copyright (c) 1986 by G. Benson Grey
                        All Rights Reserved, Worldwide

����ZXLATŠ i� a� 808� t� Z8� Sourc� Cod� Translato� i� th� traditio� o� �
����Richar� Conn'� ZXLATE� an� Fran� Zerilli'� XLATE10� an� i� � direc� �
����descendan�� fro� th� tw� programs�� Thi� versio� ha� bee� labele� a� �
����Versio� 1�� Revisio� � sinc� i� wa� completel� re-writte� i� Z8� code� �
����I� addition� i� i� designe� t� operat� o� system� whic� utiliz� Richar� �
����Conn'� exceptiona� comman� processo� replacement�� ZCPR3� ZXLAT� relie� �
����o� ZCPR3'� SYSLIB3�� VLI� an� Z3LI� relocatabl� libraries�� I� mus�� b� �
����assemble䠠 usin砠 M8�� (o� equivalent�� an� linke� wit� L8��� (o� �
����equivalent).

����ZXLATŠ i� largel� � complet� re-writ� o� Fran� Zerilli'� XLATE�� Th� �
����defaul� location� wer� remove� fro� th� fron� o� th� progra� a� eac� o� �
����th� option� ha� � manua� overrid� fro� th� comman� line�� ZXLAT� ha� � �
����variet�� o� option� whic� ar� use� t� contro� th� translatio� o� �
����programs.

����Th� option� defin� suc� thing� a� whethe� multipl� command� separate� �
����b�� Digita� Research'� �� separato� shoul� b� outpu� o� separat� line� �
����(default�� o� lef� intact�� i� opcode� shoul� b� followe� b�� � spac� �
����(20H� o� � ta� (09� default)�� wha� colum� t� alig� comment� i� (4�� i� �
����th� default)�� an� whethe� t� translat� specia� TD̠ opcode� (n� �
����translat� default)�� translat� D� an� EQ� (n� translat� default)�� an� �
����whethe� t� translat� th� "standar� Z80.LIB� macro� t� Z8�� opcode� �
����(default).

����The standard command line syntax for invoking ZXLATE is:

            ZXLATE [du:]filename.typ [du:filename.typ] / [options]

����Item� enclos� i� squar� bracket� ar� optional�� Th� spac� betwee� th� �
����filename.ty� an� separato� an� betwee� th� separato� an� th� option� �
����ar� required�� Th� du�� refe� t� th� standar� ZCP� syste� o� dis� an� �
����use� specification� followe� b� � colon�� Th� onl� ite� whic� mus�� b� �
����specifie� i� th� sourc� filename�� Th� filetype� i� omitted� i� assume� �
����t� b� .ASM�� I� th� destinatio� filename.ty� i� no� specified�� ZXLAT� �
����wil� creat� a� outpu� fil� o� du:filename.Z80� wher� du:filenam� i� th� �
����sam� a� th� sourc� file� I� th� destinatio� fil� i� specified� an� par� �
����of the filename specification may be given. A typical example is:

                ZXLATE B1:SOURCE.ASM A0:DESTIN.MAC / E U M C=33

����wher� B1:SOURCE.AS͠ i� th� inpu� file�� A0:DESTIN.MA� i� th� outpu� �
����file�� TD� extende� mneumonic� wil� b� translated�� labels� opcode� an� �
����operand� wil� b� translate� t� uppe� case�� .Z8� an� ASEǠ statement� �
����wil� b� outpu�� t� th� beginnin� o� A0:DESTIN.MAà file�� multipl� �
����command� o� on� lin� wil� b� translate� t� command� o� separat� lines� �
����and comments will be aligned in column 33.
.cp 4�
����Th� sourc� an� destinatio� file� ma� b� o� an�� lega� Disk/User�� N� �
����check� ar� don� b� ZXLAT� a� t� th� validit� o� thes� specifications� �
����However�� i� improperl� specified� � Disk/Use� Erro� wil� b� issue� an� �
����the program will be terminated.

����Invokin� ZXLATŠ wit� n� parameter� o� a� ZXLAT� /�� wil� caus� a� �
����interna� hel� fil� t� b� displaye� o� th� console� Th� followin� singl� �
����character� ma� b� use� t� chang� th� defaul� value� a� ru� time�� Th� �
����square brackets are not part of the specification.

���������[A]�������Outpu�� .Z8� an� ASE� assemble� pseudo-op� t� �
�������������������th� destinatio� fil� fo� M80.

���������[C=nn]����Alig� comment� i� colum� nn�� (C=4�� i� th� �
�������������������default.�� Note�� ther� mus� b� n� intervenin� �
�������������������space� betwee� th� � an� th� � o� betwee� th� �
�������������������� an� th� colum� number� ZXLAT� doe� no� chec� �
�������������������th� colum� numbe� a� bein� vali� an� wil� �
�������������������attemp��� t� alig� t� whateve� colum i� �
�������������������specifie� i� i� i� possible.

���������[D]�������Translat堠 D � an䠠 EQՠ� statements��� (N� �
�������������������translatio� i� th� default.)

���������[E]�������Translat� TD̠ pseudo-op� int� standar� Z8� �
�������������������mnemonics.

���������[L]�������Translat� labels�� opcode� an� operand� t� �
�������������������lowe� case��� (N� cas� translatio� i� th� �
�������������������default.)

���������[M]�������Pu��� instruction� separate� b��� DRI'� � �
�������������������separato� int� singl� lines�� Remov� th� � �
�������������������separato� (default).

���������[S]�������Separate opcode from operand by a space (20H).

���������[T]�������Separat� opcod� fro� operan� b� � ta� (09H� �
�������������������(default).

���������[Z]�������Translat堠 Z80.LI � macr� pseudo-op� int� �
�������������������standar� Z8� mnemonic� (default).

����An�� o� th� abov� option� ma� b� specifie� o� th� comman� line�� The� �
����mus�� b� preceede� b� th� � separato� t� b� recognize� b�� ZXLATE�� N� �
����othe� synta� check� ar� don� o� th� sourc� file� ZXLAT� wil� ignor� an� �
����instructions (opcodes) which are not defined it its internal tables.

����ZXLAT� wil� recogniz� th� M8� .COMMEN� pseudo-op� An� text appearin� i� �
����thi� typ� o� statement�� wil� b� copie� verbati� t� th� destinatio� �
����file.
.cp 4�
����Th� "standar� Z80.LIB� fil� ha� ha� severa� ne� addition� sinc� i�� wa� �
����firs�� released�� Th� majorit� o� th� addition� ar� onl� t� renam� som� �
����o� th� Jum� (JP� an� Jum� Relativ� (JR� instructions�� Th� ne�� code� �
����hav堠 bee� adde� t� ZXLATE'� table� wit� th� correspondin� Z8� �
����instructio� bein� generated��� Thes� firs�� appeare� i� J�� Sage'� �
����experimenta� ZCPR31� an� RCP14� whic� hav� no� bee� release� t� publi� �
����domain.

����I�� i� m� desir� t� contribut� t� th� real� o� publi� domai� software� �
����Thi� i� jus� on� o� � serie� o� program� whic� wil� b� develope� fo� �
����use by serious microcomputer users.
�
����Thi� progra� i� registere� wit� th� U� Governmen� an� i� copyrigh� (c� �
����1986 by G. Benson Grey and Virtual Micro Systems International.

����An�� comment� an� o� suggestion� regardin� th� progra� ma� b� addresse� �
����to:

����          G. Benson Grey, Sysop         [503] 641-6101 Voice
����          Portland  ZNODE #24           [503] 644-4621 Data 1200
����          12275 NW Cornell Rd, Ste 5
����          Portland, OR 97229-5611   


����Th� ZNODŠ syste� dat� phon� i� availabl� fro� 22.0�� - 06.0�� daily� �
����Voic� phon� call� wil� b� accepte� fro� 06.0� - 220�� daily�� Collec� �
����call� wil� no� b� accepte� unde� an� circumstances.

