#ifndef LCD_H
#define LCD_H

void lcd_init();
void lcd_wait(int n);
void lcd_pwr_on();
void lcd_cmd(unsigned char cmd);
void lcd_putc(int y, int x, int c);
void lcd_data(unsigned char data);
void lcd_sync_vbuf();
void lcd_clear_vbuf();
void lcd_set_vbuf_pixel(int row, int col, int r, int g, int b);

#endif /* LCD_H */