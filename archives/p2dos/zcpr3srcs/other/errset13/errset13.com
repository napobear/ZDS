�Z3ENV   *	����ʌ�/ F#~�C(�Z���6 ���w#���
 External error handling turned off ���� ��
 Command line too long ���6�͝(��~�(��~�  ��
 No error handler loaded -��
 Error handler command line set to:  ���
 �!� ͞~��~��#����

		ERRSET Version 1.3 [ZSIG]

  Syntax:

	ERRSET		display current error command line
	ERRSET CMDLINE	set new error command line
	ERRSET /C	clear external error handling
	ERRSET /Z	zero out external error handling

  Example:  ERRSET A15:VERROR

	An explicit DU: or DIR: prefix can speed error handling.
	NOTE: the command line entered is not checked for validity.

 �                         ��͸�###~�� 	 ~���0����* ���������w#�(	����w=������ ~ѷ��*�" ~#fo���"��  ������� ~#��Y�	�C�]��0�
�5��5��9�
 �
�
y��
�
y�G>�G�O> ͊�O�
����� Ҋ� ʊ�ʊ�ʊ�
ʊ�ʊ��>^͊��@͊������O* .���������~#�ʫ;ʟ+���~#�ʫ;¯ë��O�	!����#��y���  	
                                 