�Z3ENV �\���*	�U�s1�����jă>�2p�[̓ ��=�{�* #�[9s#r���:p�:o��:j��:l��y:k��^�!� ~2���#�O ��x2n=��(͘ �:p�(��=ɯ�!'"^"`"b!  "f"h\!r|�*> 6:]�(� � (�F(#�q(�Kg:f!]���2i��Y(�2o=�2o2�!q�~��G~� > #���*^�#~� +~�/(�>8!]�2f�=��~�/(��>2]>2f��>�*^~�A8���>��C;y2Iͷ(++"72m�=ɯ>�  P>,*b� *`� *d�(>�8�Cg�=ɯ>2o��?/Q�RyX5S^Z� ��&b8DT\	m�>�*��wT]�K����C�=2j�:m�(+ *7T]	��(�����T]����!�5*��B"�=2jɯ>�:m�((*7
 	"b*:m�(�!'"b:m�(�*7##"`!'"b*d"b:m�(7!'L ��*`L �ͱ*bT ͱ!L�[7 ��=2j�!�:��(4*7�K;p#q#�h2kɯ>�>�2l�5*�T]�K��w�����!��[�*� ���4 �� ��S��*�"�*��[�"�*���R�"����:n<� !N�[�!r�(�(�,�P�: > w#�=2nx2q�w�S�=�6 #6,#> �:o�(9:�(�{ :�(%�{type ? or / for error diagnosis
 �{Command (? for help):  �2n=!��Y"�2������:��  �{ No Entries in Directory
 =���{Entries - ����{   Maximum - :��������{ DU : DIR Name - Password     ����{----  --------   --------     ���H*�~�(M�(	G���� �~�@�#~���{:  #Ͷ�{ -  Ͷ�{     �y���~�#��y��������=�* #�~#fo"9�5s#r*	###͂ m�(c�(h"�2�ͽ"�"�*� �S��7 }�o"���[�"�"��[��"��2p:~�  :2���(	#~ ���=�!�!"!�́�5*^#~���2i��Y��#~� �=�:/2�:/2�:/2�!�!t́�*^##~�(O!����!����y22��>ɯ>�F###~�>	�###���/H�B�E�O�0�C�S�:��(F=�O !b	~#fo��{
???????---> !�́�{<---

 �͸���2�!t:� =�!;́:p���5���!�� ��*�"�͗����*��[��K���*�"��Cj�Cl�=������{��������͂��ɾ�����>
�O~�#� �=��Sorry - Wheel privileges are required for this pgm.
 Can't find System Named Directory!
 This is a ZCPR3 program which must 
be installed with Z3INS.
 �� 	:	v	�	�	
[

		ERROR CODE DESCRIPTIONS

Code 1 - First argument is invalid. Missing space?
Code 2 - First arg interpreted as invalid DU or DIR form.
Code 3 - For this command, the DU must exist in the NDR.
Code 4 - NDR buffer is full. The append was not performed.
Code 5 - Too many arguments. Missing command separator?
Code 6 - Too many commas. Only one has syntactic meaning.
Code 7 - New command separator was not supplied.
Code 8 - Invalid option character. Missing command separator?
Code 9 - Invalid separater. It's a command or option char!

One of these code values will be placed in the ZCPR3 program
error byte (where IF can find it) when an error occurs in a
command in the invoking command line. In the interactive mode
no errors are reported to the operating system.

 
		COMMAND OPTIONS (preceded by "/")

/	Display Help. If error, show error diagnostic
H	Toggle display of help after error diagnostic
B	Toggle audible notice of command error
E	Toggle visual notice of command error
S<ch>	Change command separator to character <ch>
O	Display this screen of option selections
C	Display the list of error codes

Option commands start with '/' and end with a carriage
return or command separator. Multiple options from the
list above may be included in any order. For example,
	/hbeo<cr>	is perfectly acceptable.
Note that if you assign a new separator, the assignment
takes place immediately, and your next separator must be
the one you assigned!

 
		EDITND version 1.2a
	EDIT resident Named Directory

SYNTAX:    EDITND  [<command>  [ \ <command>]...]
	<command> = <verb> [name] [,] [password]

Typical Commands ( [xxx] means xxx is optional)
(DU/DIR)[:]		delete Named Directory entry
(DU/DIR)[:] NAME	add/change a directory name only
(DU/DIR)[:] NAME,[PW]	add/change name & password
(DU/DIR)[:] ,[PW]	Change password only
(DU/DIR)[:] [NAME],	Password is deleted.

? or / or //		Display Help & Explain last error.
<CR>			empty cmd shows current NDR.
Q or q			Quit & return to Z (no changes)
R or r			Restart with original NDR
S or s			Sort the NDR entries
X or x			eXit to Z with .NDR updated
Z or z			Zap (erase) ALL NDR entries
/oo...			Other options. Type /O to see them.

                                                                                                                                                             ��                                                                                                                                                                                                                    �  �                     � ��~�(��# 	~� #���� 	����������(��n�n�(�����ͪ(	͠#��> ������(O� ͪ(F͠�A8G#ͪ( ͪ(ͣ8,O{�����_# �ͪ Ki`� ��B�(��=�8���8���������()�� �(!=GO���� #����(� 	��������0��
?�~�_��.��,��>��:0� Яɿ������( �>������. �.�$ ����, �.�" *|�(~#fo�����- �.��� =�0�x��� �D��*) ^#V���*|�(~���*�w���*|�(^#V#~���"��bk��F#"##�(
###�*#~#fo�����������S$*|�(9DM)8481�* �R8)*|�(��*$s#r#�* ��x� ��"����=��ɯ*$���������:&�(]:'� W*|�(P"(!  "**(+|�(?"(**#"*T]��~#fo��n�R0����M**���s#r#~#�# �+~#� ��+r+s��������S�:&� �j�K ������+)	 ��+w#�`��n��+T]�K !��	!  0>)�)�0	= �x� ��[����S�:&� �j���+)	N#F�^#V`i�*"��+)�K$	��" ���!�[�*"***�<�}���E +"*"(*(#"(�*��R8�**��R8�(��͚0��>����ͼ�� ͼO�G��������Fz��z���7�DM!  >)��j�0	= �������
� �#~#�_ 6 �����+~#���́���� ~#� ����	(��(��
(	�(� ����y/�<G> ������ �ѷ��>�>
���� ������&d��&
�������.��,0��g}� �|�> (��0G�|�����O>ͫ�����~�(͠w#�������O�F�##�g�(#s#r#(�u�(y�(�x� ��u�g�(����~�#w������� (��	(����� ��	���H ͋������� �(+�?������a��{��_���ͳ����o��* o����*�� j���,                                                    