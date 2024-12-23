#include "crt0.c"
#include "ChrFont0.h"

int a = 15, b = 0;
unsigned char lcd_vbuf[64][96];

void interrupt_handler(){}

void lcd_wait(int n) {
	for (int i = 0; i < n; i++);
}
void lcd_cmd(unsigned char cmd) {
	volatile int *lcd_ptr = (int *)0xff0c;
	*lcd_ptr = cmd;
	lcd_wait(1000);
}
void lcd_data(unsigned char data) {
	volatile int *lcd_ptr = (int *)0xff0c;
	*lcd_ptr = 0x100 | data;
	lcd_wait(200);
}
void lcd_pwr_on() {
	volatile int *lcd_ptr = (int *)0xff0c;
	*lcd_ptr = 0x200;
	lcd_wait(700000);
}
void lcd_init() {
	lcd_pwr_on();   /* Display power ON */
	lcd_cmd(0xa0);  /* Remap & color depth */
	lcd_cmd(0x20);
	lcd_cmd(0x15);  /* Set column address */
	lcd_cmd(0);
	lcd_cmd(95);
	lcd_cmd(0x75);  /* Set row address */
	lcd_cmd(0);
	lcd_cmd(63);
	lcd_cmd(0xaf);  /* Display ON */
}
void lcd_set_vbuf_pixel(int row, int col, int r, int g, int b) {
	r >>= 5; g >>= 5; b >>= 6;
	lcd_vbuf[row][col] = ((r << 5) | (g << 2) | (b << 0)) & 0xff;
}
void lcd_clear_vbuf() {
	for (int row = 0; row < 64; row++)
		for (int col = 0; col < 96; col++)
			lcd_vbuf[row][col] = 0;
}
void lcd_sync_vbuf() {
	for (int row = 0; row < 64; row++)
		for (int col = 0; col < 96; col++)
			lcd_data(lcd_vbuf[row][col]);
}

void lcd_putc_16(int y, int x, int c) {
    int v2, h2;

for (int v = 0; v < 16; v++) {      
        for (int h = 0; h < 16; h++) {
            if (v%2==1) {
                v2 = v/2-1;
            } else {
                v2 = v/2;
            }
            if (h%2==1) {
                h2 = h/2-1;
            } else {
                h2 = h/2;
            }
            if ((font8x8[(c-0x20)*8+h2] >> v2) & 0x01) {
                lcd_set_vbuf_pixel(y*16+v, x*16+h, 0, 255, 0);
            }
        }
    }
}

void lcd_putc(int y, int x, int c) {
	for (int v = 0; v < 8; v++)
		for (int h = 0; h < 8; h++)
			if ((font8x8[(c - 0x20) * 8 + h] >> v) & 0x01)
				lcd_set_vbuf_pixel(y * 8 + v, x * 8 + h, 0, 255, 0);
}

void lcd_digit(int y, int x) {
    int digita1, digita2, digitb1, digitb2;
    static int a = 15, b = 0;

    digita2 = (a == 0) ? ' ' : (a/10)  + '0';
    digitb2 = (b == 0) ? ' ' : (b/10)  + '0';
    digita1 = (a % 10) + '0';
    digitb1 = (b % 10) + '0';

    lcd_putc(y, x, digita2);
    lcd_putc(y, x+1, digita1);
    lcd_putc(y, x+2, ' ');
    lcd_putc(y, x+3, digitb2);
    lcd_putc(y, x+4, digitb1);   
}

void main() {
    lcd_init();
    lcd_clear_vbuf();
    lcd_digit(2, 0);
    lcd_sync_vbuf();
}

