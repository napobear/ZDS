1h��H�@�����v�����t���������E
��>���> 2&͌
�_�2&W�H�^�  ����rr�H�^�  ��H!6!
�����H!!�����H!.!�����H!!���H!!���H!!��!  ""! #":�����P�H�Sͺ��H����  ����@�!�o~#fo�! #"��
�'�����H:���>2%! #"������H�>���Y�q�! #"��k����H��!�H�]ڃ�S����(���7��:/2��:&/2&���B��1�H͐��2#! #"��H�Sͺ*��
":#=2#��*#"}�>��!  "*#"}����H����H�>���Y�q��H͐��2#! #"�H�Sͺ*�":#=2#��*#"}�>�0!  "*#"}�0��H����H��H�>���Y��! # >�w#w#��! #"�ʯ����ͺ�&����>��H�>����*#"}�?!  "*#"}��Q�H����H�>���Y��!  """""! "�����H:�*:�*��H:�*:�*��H:2*"�S! #"��
:2*"�S! #"��&��>��H�>���*#""}�>�V!  ""*#"*#"*}���)k�H����H�>���Y��!  """""! "�����H:�*:�*��H:�*:�*��H:2*"�S! #"��
:2*"�S! #"��&��}�>��H�>���*#""}�>�4!  ""*#"*#"*}�����H��&�H��>2%����͌
�_W�H�^��͖8B���ͱ�^ ! !��
:!�  )�͖����ͱ�^ ! !��
�:!�  �>ɯ����͖�^��͖�^��*͖�^�! #"��
�c��H�>���ͺ! #"�2%:�������&��>��H�>���*#"}�>�K!  "*#"�K��H:�*:�*��H:�*:�*��H:�*:
�*:	�*�H�#N�2+N�2##�����2
�2���2�2����͒�����������͇����������|���������~�$�ZO�2#�L�������z� ���{!�H���@L�H��� v�H����H��	��z��ʵ9�H�������H���@����H�����]�H�������H����H�����H��7���F#Ny�*x�* �2(�2��N#F�&	�H)�2�����;��;����Ɛ'�@'O�2����_�#>�O�2�������H͐�2���H͐�2���H͐�2����������/���G����G������/���G�������7��>������O�2����a��{�� ��0�
���������]T�͹	���������! !�"͹	������� �C=	!=	?	>�G	?	������C=	!=	?	>�G	?	���    O +" O +"E	>�	~��c	+�R	�60#6$�G>���q	�q	�f	G�*E	 	���kb~<ʒ	=��
ڌ	�
?w#�~	Қ	6#6��x�q	�q	6$+}�|���0G~�0pæ	�x2"�*MD���B�o
�}�J
�~�_
͂
8&�r
}� ��}��O
~O� 8.�2�
}� ����J
���͂
8�:%�(:G�@
x2��&���0
� ��>�`�?
�{�?
˯���H�>��G��G�r
���|�_
}��h
��x
�2��W
 �2��Ɛ'�@'O�#|�7�{�z��>���>��� 
���  �m��������z��
���¼
y�º
��=�^ɯ��S͖�^ ��ͱ�^* >���@����w#��w#>�����z��^��S͖�^0��ͱ�^* >���~#��~#��>���� ������>�����z��^�*��H|2T��z�*}2
U��z�*:2	W��z�*�H
�������z���@ʯ�7ɷ�����z�����µ7ɷ�{���@����W{�����>���z��{��� �� {�� >����
IDE Disk Drive Test Program (V2.0) (Using CPM3 BIOS Routines)
CPM Track,Sectors --> LBA mode
$Initilizing Drive Error.
$Error obtaining Drive ID.
$Drive Initilized OK.

$Model: $S/N:   $Rev:   $Cylinders: $, Heads: $, Sectors: $CPM TRK = $ CPM SEC = $  (LBA = 00$)$

                 MAIN MENU
(L) Set LBA value  (R) Read Sector to Buffer  (W) Write Buffer to Sector
(D) Display ON     (S) Sequental Sec Read     (F) Format Disk
(V) Read N Sectors (X) Write N Sectors        (B) Backup disk
(G) Restore Backup
(U) Power Up       (N) Power Down             (ESC) Quit


Current settings:- $

                 MAIN MENU
(L) Set LBA value  (R) Read Sector to Buffer  (W) Write Buffer to Sector
(D) Display OFF    (S) Sequental Sec Read     (F) Format Disk
(V) Read N Sectors (X) Write N Sectors        (B) Backup disk
(G) Restore Backup
(U) Power Up       (N) Power Down             (ESC) Quit

Current settings:- $

Please enter command >$
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
-- More -- $Pre status: $  Post status: $           RAM STORE AREA --------> #   �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   v<--Start buffer area                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            End of buffer-->