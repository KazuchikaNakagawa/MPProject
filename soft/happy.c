void main() {
    volatile int *iob_ptr = (int *)0xff1c;
    *iob_ptr = 1; lcd_wait(7000000);
    *iob_ptr = 2; lcd_wait(7000000);
    *iob_ptr = 3; lcd_wait(7000000);
    *iob_ptr = 0; lcd_wait(7000000);
}