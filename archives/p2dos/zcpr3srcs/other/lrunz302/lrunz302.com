ÆZ3ENV  COMMAND LBRLRUNZ3  Version 3.0
$ Copyright (c) 1982  Gary P. Novosielski 
 Modified for Use Under ZCPR3 by David Miles$*	}�(8) ~#f�(_o~� Z�	� Wheel Byte Not Set ==> Aborting $��LRUNZ3  must be Installed before it is run $!  9"�	� �U* |�	W �� x��~#�! � ��� �bx�({� �~#�o}o0��33o:�G:�O�!L"͎� �p!� ��� ! ��� ! �� 2��  � 2��� < W�2�*		 ~#f���o~����G>$� :�<G#~#��O>$� :�OX�� � � �� �<(��� � � �� ���!� ~���> #��� �*� |���*� +��|��+��� ���!� �@�h(�  ���^#V�"��#^#V�"��� � �z/W{/_�v�`��`!� ^ �#6 �#~���� (��- #��Rv�R��~#� �x2��!�N � �!� \ �Rl �R��	� *���
Correct syntax is:

	LRUN [-<lbrname>] <command line>

Where <lbrname> is the optional library name
(Note the preceding "-".  ) If omitted,
the default command library is used.

<command line> is the name and parameters
of the command being run from the library,
just as if a separate .COM file were being run.
$��!v� # ����`�v�͂͒���6 #6 #�6 #��������;ȷ�#�#~+�:�~�@##�ͪ~�.�#y�(�ͪ����#�*( �>? ����#�~�.��,��;�� ��:��=��<��>ȷ�ͅLibrary not found$ͅName after "-" isn't a library$!w^#��� ���͍ -- Command not in directory$ͅNo program in memory$�ͅProgram too large to load$COM�	� �	� �� �	� �� -- Aborting$
$                                                                          �*� >�o��g)))))))�͆!- �d*� "� �2� ! "� *� }�(D+"� *� T]� 	"� � � !� � 	*� #"� �>�2 !  "� 	� � � � � 
 � ��X� � � � 
Bad Load$    $$$     SUB                                       �"	                             