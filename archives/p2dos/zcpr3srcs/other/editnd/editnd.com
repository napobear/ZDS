�Z3ENV �\���*	�	�s�1�͵���jă>�2b�[̓ ��=�{��* #�[+s#r�͎:b�:a̎:\��:^��b:]��G�!� ~2���#�O ��x2`=��(͘ �:b�(��=ɯ�!"P"R"T!  "X"ZN!d|�> 6:O�(� � (�F(#�q(�KY:X!O���2[���(�2a=�2a2�!c�~��G~� > #���*P�#~� +~�/(�>8!O�2X�=��~�/(��>2O>2X��>�*P~�A8��>��C-y2;��(++")2_�=ɯ>�  P>,*T� *R� *V�(>�8�CY�=ɯ>2a��?�/�Q�RbX5SGZ� ��"a5AR[	V�>�*�T]�w�K���=2\�:_�(+ *)T]	��(�����T]����!�5*��B"�=2\ɯ>�:_�(**)
 	"T�a:_�(�!"T:_�(�*)##"R�a!"T�a*V"T:_�ʟ!> ��*R> �͢*TF ͢!>�[) ��=2\�!�:��(4*)�K-p#q#�h2]ɯ>�>�2^�5*�T]�K��w�����!��[�*� ���4 �� ��S��*�"�*��[�"�*���R�"����:`<� !N�[�!d�(�(�,�P�: > w#�=2`x2c�w�S�=�6 #6,#> �:a�(9:�(ͮ :�(%ͮtype ? or / for error diagnosis
 ͮCommand (? for help):  �2`=!��q"�2��R��!��R�~���ͮ No Entries in Directory �ͮ DU : DIR Name - Password     ���Rͮ----  --------   --------     � �R �n �f~�(V��cGͥ�R �~�@͌#~�ͮ:  #͙ͮ -  ͙��ͮ     �y��R�R~͌#�y��R�ͥ�R�=�* #�~#fo"+�5s#r*	###�P�H���C���M"�2��n"�"�*� �S��!� }�o"���[�"�"��[��"��2b:p�  :2�ͫ(	#p ���=�!�!!�ʹ�5*P#~����2[�����#~� �=�:/2�:/2�:/2�!v!eʹ�*P##~�(O!����!����y22��>ɯ>�F###~�>	�###���/�HsB|E�O�0�C�S�:��(F=�O !S	~#fo�ͮ
???????---> !�ʹͮ<---

 �ͩ�R�2�!f:� =�!,ʹ:b���5���!�� ��*�"��~����*��[��K����C\�C^�C`�=�����K������C��v�������P��ɾ�����>
�O~͌#� �=��Sorry - Wheel privileges are required for this pgm.
 Can't find System Named Directory!
 This is a ZCPR3 program which must 
be installed with Z3INS.
 ���+	g	�	�	
L

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
		CRNDR version 1.0a
	CHange Resident Named DiRectory

SYNTAX:    CRNDR   [<command>  [ \ <command>]...]
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

                                                                                                                                                             ��                                                                                                                                                                                                                    �  �                                                                                      ������~�����
#~+��
##�=�� 	�����2uv��K�:u��9�b�E���E��G���E�b�5>������Y#�K�> �Y���͝��ͷx2~y2ͻG~�Aړ���2~#����i����ʭ�i��#������O�5�����2:~G:O��=����������� ��� �����#������ 	������OG��=�~���!�3�=��_��.��:��,��<��>ȷ��;ɯ�� ~��b#�i�fWy�f�f��f�f��fO�9y����7��0��
�s?�7�           ���� ~�������� �w�����*. ~����*$ ~#fo�|����*, ~����*" ~#fo�����*- ~����* ^#V#~�ѷ���*) ~#fo~���"�  ����"Z\���"d*^}�o|�g�S�*d}�o|�g�S"\*Z�!\����*\>�����*d��                            �����\��*^"hDMx�y�ڹ:f�ʸ*\�*dx�ʸs#r#�*`��ä*h"j�*j|g}o��"j"p*p#"p�*h}�|�ھ*p"l*j�*l}�o|�g"l��|����*j"n�%��*l�*n;��:f�ʹ*^"l*d"r*\"t*lDM*r�*t��M��oy��Bͮ
SORT Pointer Error �  *r~#~*`DM*t�*r~#fo��N�q��#x�*`�*t"t*r##"r*l+"l|��6�����:f��
���*`DM��Nwy#�x�������"�����*���  *`DM!  z��	���*\��*dDM�+)	�+)	N�q#N�q�:f��2���J�*dDM�+)	�+)	�N#F�^#V`i�*b���H �Y�������i#x��\�m?������2�"��
� *�#~#�o|� g6 �:��ʥ�~�ʤ��w#×���+~#�   �ʹ����� ~#���	���_����
��������ù ùùy�ʹùy�G>�G�O> ͌��ù������� ����d�,
�,�0͌���� ��6�.�_y��H��H> ͌{� y�0͌{��>͌>
͌��� Ҍ� ʌ�ʌ�ʌ�
ʌ�ʌ��>^͌��@͌������O* .������������Y �� �X� ��������� �� � O�G�������H 	�	������	�	����H ��������|����}��~#x��������	�	�~+x���	��կ2��!  "���i�N�*�}�o|�g"��M>�2����w��2��*�:���f�7�����|g}o�f�c��}o|g�f�c   �~#�ʕͨʉ+���~#�ʕͨÕ��O�	!��ʼ#²y���  	
��a��{��_������_ � ������bk��F#"##��###��*�#~#fo����  ���O�F�##�P��Es#r#�9�`��Ey��4�x���`�P��E����~�#w������� �P�	�P���� ��	��`�*|}��z$. ��~�1