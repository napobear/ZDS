1�����4                                                                                                                                                                                                                                                    _�`>_��h___8_�_��s2X��_H>�2�j�� ��̀
��  ͊
͑�@�! �o~#fo���S���L
g͑a���L
L�y͑�9���9���97��ͦ	͑�9E�����
 ͷ���
 ͷ���
 ͷ���
 ͷ͑�9��>����������9>����>����>�2��{	�0�͏	�2�������  ͈�!������  ��!60
̀͑��!0̀͑��!.0̀͑#��!0;	/��!0;	9��!0;	͑!  "�"�! 2"�:��������= ��̀
��  ͊
͑�@�! �o~#fo�! 2"��}��͑�9M��:���9>2�! 2"�͛
�9����͊
�Y�͑! 2"�ͺ�͑�9`���9t���
�,��͑�9ͫ�9ͺ�9:�/2��9:�/2��9���9����L
�92�! 2"�K�����=*��}"�:�=2��9*�#"�}�>�m!  "�*�#"�}�m���9����͊
�Y�����L
�92�! 2"�b�����=*�ͺ"�:�=2��9*�#"�}�>��!  "�*�#"�}�����9N������͊
�Y�9! 2 >�w#w#�͑! 2"�ͺ�X͑�9͞�=ͩ��z��������9͑*�#"�}�?�F!  "�*�#"�}���F����9�����͊
�Y�9!  "�"�"�"�"�! "�͑͑͞*��:���	:���	:��:���	:���	M��:�2�*�"���! 2"��}:�2�*�"���! 2"�ͺͩ��H��������9*�#"�"�}�>��!  "�"�*�#"�*�#"�*�}��������9O����͊
�Y�9!  "�"�"�"�"�! "�͑͑͞*��:���	:���	:��:���	:���	M��:�2�*�"���! 2"��}:�2�*�"���! 2"�ͺͩ��&��������9*�#"�"�}�>��!  "�"�*�#"�*�#"�*�}��°����9y���9>2�ͯ
�9�0�͏	������9�+��{	�ͅ��Q�� ! 0͘��ͅ�+�����+���í�+��͑! 2"��}��������͞�=! 2"��2�:��ě
͑͑͑ͩ�� ��������͑*�#"�}�>��!  "�*�#"���E��:���	:���	P��:���	:���	\��:���	:���	:���	h���#Nͷ+Nͷ##��ͷ
ͷ��ͷͷ����� ���������Y� ��������� ����	� ͑�wz��	����t���o	�@�	����o	� �	����o	����o		�wz���.	����o	��<	���o	�@�J	;���o	��X	����o	��f	����o	����o	���
͑�7���:��(	��ͦ	�����:��('��ͦ	͑���:�W�2���wz�
�z2����F#Ny��	x��	 ͷ(ͷ��N#F��
��)ͷ������	���	����Ɛ'�@'Oͷ����_�#>�Oͷ���������L
�2�͑ ���L
�2�͑ ���L
�2�͑���̀
��~
�/�~
�G�~
͓
G̀
��~
�/�~
�G�~
͓
���7���͊
����a��{�� ��0�
���������]T��m���������! 0�1�m������� �C�
!�
�
>��
�
������C�
!�
�
>��
�
���      O +O +"�
>�	~��+��60#6$�G>���%�%�G�*�
 	���kb~<�F=��
�@�
?w#�2�N6#6��x�%�%6$+}�|���0G~�0p�Z����MD�B��}���~��&8&�}� ��}���~O� 8.ͷͶ}� �Ó������&8�:��(�����ͩ����� ����`���{��˯�������G��G���͑|�}����ͷ��� ͷ��Ɛ'�@'O�#|�7�{�z��>���>�����:���͏	�ͅ��wz��e>�g�M��ɯ�2����:�=�qy��n�����+�� ͅ�Q��*� >���@����w#��w#>����wz�������+��0ͅ�Q��*� >���~#��~#��>���� ������>����wz����:�<2�Wͅ*�}2�Uͅ|2�Tͅ
ͅ��>�2��wz���@�O�2:�=2��27ɷ��>�2��wz���u�X:�=2��X7ɷ�{���@����W����>���z��{��� �� ���>����
IDE Disk Drive Test Program
$Initilizing Drive Error.
$Error obtaining Drive ID.
$Drive Initilized OK.

$Model: $S/N:   $Rev:   $Cylinders: $, Heads: $, Sectors: $CPM TRK = $ CPM SEC = $  (LBA = 00$)$

                 MAIN MENU
(R) Read mode      (W) Write Mode
(P) Port Status    (S) Disk Status
(B) Bit Set        (C) send Byte
(ESC) Quit

$Cmd > $
Warning: this will change data on the drive, are you sure? (Y/N)...$
Sector Read OK
$
Sector Write OK
$Enter CPM style TRK & SEC values (in hex).
$Drive Error, Status Register = $Drive Error, Error Register = $Starting sector number,(xxH) = $Track number (LOW byte, xxH) = $Track number (HIGH byte, xxH) = $Head number (01-0f) = $Number of sectors to R/W = $Drive Busy (bit 7) stuck high.   Status = $Drive Ready (bit 6) stuck low.  Status = $Drive write fault.    Status = $Unknown error in status register.   Status = $Bad Sector ID.    Error Register = $Uncorrectable data error.  Error Register = $Error setting up to read Drive ID
$Sector not found. Error Register = $Invalid Command. Error Register = $Track Zero not found. Error Register = $Unknown Error. Error Register = $
To Abort enter ESC. Any other key to continue. $Fill sectors with 0H (e.g for CPM directory sectors).$
Read multiple sectors from current disk/CF card to RAM buffer.
How many 512 byte sectores (xx HEX):$
Write multiple sectors RAM buffer current disk/CF card.
How many 512 byte sectores (xx HEX):$
Reading Sector at:- $
Writing Sector at:- $
Sorry, that was not a valid menu option!$
Disk Format Complete.
$
Disk partition copy complete.
$
Copy disk partition to a second area on disk (CF card).
>>> This assumes that tracks greater than MAXTRK (for CPM, 0FFH) are unused <<<
>>> on this disk. Be sure you have nothing in this "Backup partition area". <<<
Warning: This will change data in the partition area, are you sure? (Y/N)...$ 
At end of disk partition!
$Reading track: $H. Writing track: $H$
Restore disk with data from backup partition on disk (CF card).
Warning: This will change data on disk, are you sure? (Y/N)...$ 
Restore of disk data from backup partition complete.
$
-- More -- $Pre status: $  Post status: $Reg. status: $Port status: $Port number: $Out Byte: $           RAM STORE AREA --------> 2   �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           v<--Start buffer area                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            End of buffer-->