�Z3ENV  !  9"515*	�7�CZ3LOC  Version 1.3 :] �Z��� ���C
Syntax:
Z3LOC	 Gives the addresses of the CCP,
	 BDOS, BIOS, and, if active, the
	 lowest RSX and the DateStamper.

Z3LOC Z	 Adds all key ZCPR3 addresses. Þ2�C
System  Elements   Base  Addresses
----------------   --------------- * ���C
    CCP		 Ͱ��* ��C
    BDOS	 Ͱ�v* . �C
    BIOS	 Ͱ��|* ��ʬ�C
    RSX (lowest)    �������C
    DateStamper     ���:] �Z:���C
Non-ZCPR3 system or Z3LOC is uninstalled Þ�C
Env Descriptor	  ͣ�C

Pack: FCP	 	 ͣ�O��!��I�C
      IOP	  ͣ�q��!��I�C
      RCP	  ͣʗ���C recs) �C

Buf: Cmd Line	  ͣ�����C chars) �C
     Ext FCB	  ͣ�C
     Ext Path	   ͣ�	���C elements)
     Ext Stk	  ͣ�C
     Messages	  ͣ�C
     Named Dir	  ͣ�g���C entries) �C
     Shell Stk	  ͣ�C
     Wheel Byte	   ͣ*5��*;	 ^#V��C    }����C[Not implemented] ���>h����C ( á�*;}���=�� �^#V��=��###�$�2~��$�C (ZCPR  ##nͧ��X =��C#�-�C (BGii) ��:��Y>0!�Ioͧ�#^#V##~#fo�=�n>��N�Ì��"0�}�>"�C (CP/M  oç�C (ZRDOS  }ͽ>.�}ͽ>)���0�D� �"�|�D����C ( ��	�L���CHD64180/Z180) ��CZ80/NSC800) ��C8080/8085) �                               ";�  |��}����I����� ~#�ʝ�	ʇͺ��t�
�y��y��}�N �N�Ny��N�Ny�G>�G�O> ͺ�N�������d͹
͹�0ͺ���� ���û�_y������{� y�0ͺ{��|��}���������������
� �7ú�0ú�>ͺ>
ͺ����� �������_� �����                                                                                       