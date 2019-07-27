�Z3ENV �SALIA�a*	���s�*�0 "��*	� ����:] � ��/�ͫͲ���> *���*� ��x#�ͳ�f�1(�2(�Sʔ�X�����*� "��O

Default insert is �+~�(�ON��OF��O  Change? (y/N�͙�_�Y(>N͂ ~/w�O

Install characters recognized as word separators.  You can use no more
than the number below.  To use fewer, just repeat some of them.  Do not
start with a space.  <CR> to skip.

Current   ->�*�> �~͂#��O
Change to ->�͔�ͬ(�~�(���ͳ�(
*���)҅2��}�P~#�����*Ă�(>#> ͂�5:�<���_DE�����O�:�G!��(~#� ���U����:��g�K��j�o�0��ɯ���:���0��G��o�C���b�P͙� ���������u � (� (� (� (È�t͇̀�m�JÈ�m:���t�� ��_DEL ����?~���)���1�?�w͙�#(��_ ��Î>��w>#�1È�O ������͂�����[� *���K��jG:��2��)��bɯ2�2�2��!�!�4{��6 �!�!�~�(5�s�ͻ�� >*������:i 2��:�_ � !h �w#����<����O Done��\ � 2�y������ ������� ��_File: �\ Ͳ�(=Gx�A͂*�& �A�O���7͎���O�~#� (͂��O]����U��~#��͂����e��~#���(�(͂�������������_� ������_��Ü����� �(��������* 	 6��� �6������ >0��!�"��� 0�@�a��{��_�����#(##� �#���^#V��ͳ�O                    COMMAND KEY INSTALLATION FOR SALIAS 1.3


     The command keys for the SALIAS editor are either single control keys
(^A to  ^_ and DEL) or two-key sequences introduced by a meta key (e.g. ^KX).
The commands executed via meta key are control characters with the high bit
set.  Each command must have a unique key.  If not, the first occurence
determines the key function.

     You can alter the command key set to your preference.  The
installation is screen oriented.  At each function, enter a letter (in upper
or lower case) to represent a control character.  Follow it with a "#" to
mark it as a meta key triggered command.  Use "-" to disable a function.

     SALIAS is set up to be similar to WordStar.  The "WS Submenu" command
automatically implements ^QS, ^QD, ^QY, ^QF, and ^QA.  Disable the Submenu
with "-" in order to install your own command choices.  (This inelegant step
is needed to avoid an unpleasant surprise when ^QS or ^QD saves the file
instead of moving the cursor.)

     Strike any key ...   ͙��OScanning order of commands is down each column left to right.
Each command must have a unique key.
"I" = TAB, "[" = ESC,  DEL = Delete Key,  "-" = Disable

 ���OCursor Movement:  ^E - Up, ^D - Rt, ^X - Dn, ^S - Lt   (Or Arrow Keys)
Skip:  CR        Quit:  ESC                                           
 ���O                  SALIAS 1.3 INSTALLATION

 � �O


   1 - Information
   2 - Install keys

   S - Save changes and quit
   X - Quit

Choice:  ͙����ͳ�{���O No fil���OSAINSTAL - Command key installation for SALIAS 1.3a
  Syntax:  SAINS13 SALIAS13.COM ��O Only for SALIAS 1.3a �!� 6<�
�� �#^ #�6 ��~#� (�+��Meta-key #1 Meta-key #2 WS submenu Cursor rt Cursor lt Cursor up Cursor dn Backspace Word rt Word lt End/start of line Up screen Down screen Delete char Delete word rt Delete line Delete char lt Carriage return Insert line Indent line Repeat find/replace Enter control char Insert/overwrite Exit to FILE MODE Find Replace Delete to eol Clear (Zap) End of line Start of line Help Save and resume Save and clear Save and quit Quit Rename Read a file Indent script Toggle mode Undo changes Print script           ��*�~�!�� V###~���͓��=������*�~�!��  ������~���͓��=������*�~�!�,  ��������~��,͓��=�������*�~�!�` ~2�##��~��`����e:�ͪ����=������%-�2�2����%ʊ�\ʂ͂�n͂�n�d�)�D�)�2�#�3�
�.��+���>���r���R���i���I��͂�n>2��n>2��n�:O�����X�nG�:�͂:���2��n�:͂���:d�q
�q�0͂���:��:d �q
 �:���P��K:���:�����F�KO:���i��gi�a���e�g�0��|�t��z�0y�ʍz͂���   ~�ʦ#�\ ~#͂Ózê����O���*?+ ~���>G���������������������~#���\��#���"?� "���"��  �*���~����!#~+��!##�=�� 	���*? ^#V#~�ѷ�"?�  ����'�j��jd �j
 �j}�0͂����� }�o|�g�y�l}�o|�gy��� y�0Â���ͤ>.͂ͤ������ Ă¤����� �� � O�G�����*�}���$. ���                                       