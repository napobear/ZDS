�.Z3ENV   �   LAP.COM
 Source Copyright (c) Bob Andersson 1987                    Sorry, the program needs a Z80.
$TPA TOO SMALL
 Program not installed.
    Destination file exists! Overwrite (Y/N) ?  No Disk Space. PROGRAM ABORTING.
    Load Aand Path - Done.
 	LAP --- LDR And PATH.    VERSION 1.0 	^^^^^^^^^^^^^^^^^^^^^ 
   Usage:- 1/ LAP    or      2/ LAP DIR:FILENAME:TYP /C 

   LAP helps to automate the system segment and path load usually done as    part of the cold-boot start-up alias and saves space in that alias script. 
   1/  Reload the system segments and path from an internal image. 
   2/  Capture the system segments and path from the computer memory and        write a new version of LAP.COM to disk using the specified filename.        This is the way to install LAP on your system. 

  
	LAP --- LDR And PATH.    VERSION 1.0 	^^^^^^^^^^^^^^^^^^^^^ 
   Author: Bob Andersson.    Date:   November 1987. 
  �����H��L��^#V#��W~�7(�# �z����0	� 0�R�� :� �>� %�������_�(� �� ��� �7?��������������	
 G:G��x��*S=(*U=(	*O=(*Q~�(h#�\ ~�#�_͉������͕����������� �� �9�9�!�	�ngy���8�;�;��C(����K(b����Ɉ�����Id*@ ��qx�(��:N:M��G�������:LG!� +|� ��������>� >
� ����� ��#���O���� #����y��~#���\ �#��2G���0(###�0(�7�>�2G"H����~(2L�~%2�� 	~2M##~2N#"O�C�C"Q�C"S�C"U��Z3ENV��!E~_�����4 _!�N#F#~��� � � 	 �  ��	## N+~+ng���!  �(	= �MD�gx�|�����(�������(��������� ��  �{Cɯ=�KW	� � �� �//C �sC1C�2K!� ~��l!] > ��l2K:J�(! 	�N0*	�N�'*	�N��*  ��Ry�[:��:K�ʽ!] G�0�'!m �0�'*H 	�2Eͮ�ͮ�ͮ�ͮ�ͮ�ͮ��!J6�� � 2F:i _ � !h ]T6  ��\ � <(:\ � ������ �(�˯�Y(�T�¯� ��\ � \ � <(/ �� \ � <(�!� ���7�R0��\ � ��\ � \ � ��:F_ � ��*H 	�2E�ͮ�ͮ�ͮ�ͮ�ͮ�ͮ���> ���	 ������