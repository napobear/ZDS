

#include <stdio.h>
#include <limits.h>
#include <time.h>

extern unsigned int highestOneBitPosition(unsigned long);

main()
{
	unsigned long exp_max_long = ULONG_MAX + 2;
	unsigned long extimated_ulong = 0;
	int long_bits = 0;
        time_t mytime;
	
	printf("Test of unsigned long size:\r\n");
	printf("\nC compiler max: %ld\r\n", exp_max_long);
	printf("\nSizeof unsigned long: %d\r\n", sizeof(exp_max_long));

	extimated_ulong = 1;
	do {
		exp_max_long = extimated_ulong;
		long_bits = highestOneBitPosition(extimated_ulong);
		extimated_ulong *= 2;
	} while (extimated_ulong > exp_max_long);

	printf("\nExtimated size: %d bit\r\n", long_bits + 1);

        time(&mytime);
	printf("ciao Pino\r\n");
        printf("Sono le %s\r\n", ctime(&mytime));

	exit(0);
}


unsigned int highestOneBitPosition(unsigned long a) {
	unsigned int bits=0;
	while (a!=0) {
		++bits;
		a>>=1;
	};
	return bits;
}
