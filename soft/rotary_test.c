#include "crt0.c"
#include "ChrFont0.h"

void main()
{
	volatile int *led_ptr = (int *)0xff08;
	volatile int *rte_ptr & 0x3;
	lcd_init();
	for(;;) {
		*led_ptr = (*rte_ptr) & 0x3;
		lcd_clear_vbuf();
		lcd_digit3(0,0, (*rte_ptr) >> 2);
		lcd_sync_vbuf();
	}
}
