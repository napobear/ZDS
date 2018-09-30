//
//  '########'########::'######:::'##::: ##'########'########:'#######:::'#####:::
//  ..... ##: ##.... ##'##... ##:: ###:: ## ##.....:..... ##:'##.... ##:'##.. ##::
//  :::: ##:: ##:::: ## ##:::..::: ####: ## ##:::::::::: ##:: ##:::: ##'##:::: ##:
//  ::: ##::: ##:::: ##. ######::: ## ## ## ######::::: ##:::: #######: ##:::: ##:
//  :: ##:::: ##:::: ##:..... ##:: ##. #### ##...::::: ##::::'##.... ## ##:::: ##:
//  : ##::::: ##:::: ##'##::: ##:: ##:. ### ##::::::: ##::::: ##:::: ##. ##:: ##::
//   ######## ########:. ######::: ##::. ## ######## ########. #######::. #####:::
//  ........:........:::......::::..::::..:........:........::.......::::.....::::
//
//  Sysbios C interface library
//  P.Betti  <pbetti@lpconsul.eu>
//
//  Module: c_bios header
//
//  HISTORY:
//  -[Date]- -[Who]------------- -[What]---------------------------------------
//  27.09.18 Piergiorgio Betti   Creation date
//


#include <cpm.h>

int chmod(register char * name, int mode)
{
	struct fcb 	fc;
	register short	luid;

	if(!setfcb(&fc, name)) {
		luid = getuid();
		setuid(fc.uid);
		if(!(mode & S_IWRITE))
			fc.ft[0] |= 0x80;
		if(mode & S_SYSTEM)
			fc.ft[1] |= 0x80;
		if(mode & S_ARCHIVE)
			fc.ft[2] |= 0x80;
		mode = bdos(30, (uint16_t)&fc);
		setuid(luid);
		return mode;
	}
	return -1;
}
