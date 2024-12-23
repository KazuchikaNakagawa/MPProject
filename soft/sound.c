#include "crt0.c"
#include "lcd.c"

void interrupt_handler(){}


void main() {
    volatile int *iob_ptr = (int *)0xff1c;
    *iob_ptr = 1; lcd_wait(7000000);
    *iob_ptr = 2; lcd_wait(7000000);
    *iob_ptr = 3; lcd_wait(7000000);
    *iob_ptr = 4; lcd_wait(7000000);
    *iob_ptr = 5; lcd_wait(7000000);
    *iob_ptr = 6; lcd_wait(7000000);
    *iob_ptr = 7; lcd_wait(7000000);
    *iob_ptr = 8; lcd_wait(7000000);
    *iob_ptr = 9; lcd_wait(7000000);
    *iob_ptr = 10; lcd_wait(7000000);
    *iob_ptr = 11; lcd_wait(7000000);
    *iob_ptr = 12; lcd_wait(7000000);
    *iob_ptr = 13; lcd_wait(7000000);
}

