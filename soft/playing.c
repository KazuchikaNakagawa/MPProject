#include "cos_table.h"
#include "defines.h"
#include "lcd.c"
#include "sin_table.h"

#define abs(x) ((x) < 0 ? -(x) : (x))

typedef struct {
    int x;
    int y;
} RacketPos;

typedef struct {
    RacketPos pos;
    RacketPos endPoint;
} Racket;

// 96x64px
// racket -> 16px len
static Racket racket1 = { { 16, 16 }, { 16, 32 } };
static Racket racket2 = { { 80, 16 }, { 80, 32 } };

void draw_racket1()
{
    // draw line from racket1.pos to racket1.endPoint
    // using bresenham's line algorithm
    // int x0 = racket1.pos.x;
    // int y0 = racket1.pos.y;
    // int x1 = racket1.endPoint.x;
    // int y1 = racket1.endPoint.y;
    // int dx = abs(x1 - x0);
    // int dy = abs(y1 - y0);
    // int sx = x0 < x1 ? 1 : -1;
    // int sy = y0 < y1 ? 1 : -1;
    // int err = dx - dy;
    // int e2;

    // for (;;) {
    //     lcd_set_vbuf_pixel(y0, x0, 0, 255, 0);
    //     if (x0 == x1 && y0 == y1)
    //         break;
    //     e2 = 2 * err;
    //     if (e2 > -dy) {
    //         err -= dy;
    //         x0 += sx;
    //     }
    //     if (e2 < dx) {
    //         err += dx;
    //         y0 += sy;
    //     }
    // }
    lcd_set_vbuf_pixel(racket1.pos.y, racket1.pos.x, 0, 255, 0);
    lcd_set_vbuf_pixel(racket1.endPoint.y, racket1.endPoint.x, 0, 255, 0);
}

void draw_racket2()
{
    // draw line from racket2.pos to racket2.endPoint
    // using bresenham's line algorithm
    int x0 = racket2.pos.x;
    int y0 = racket2.pos.y;
    int x1 = racket2.endPoint.x;
    int y1 = racket2.endPoint.y;
    int dx = abs(x1 - x0);
    int dy = abs(y1 - y0);
    int sx = x0 < x1 ? 1 : -1;
    int sy = y0 < y1 ? 1 : -1;
    int err = dx - dy;
    int e2;

    for (;;) {
        lcd_set_vbuf_pixel(y0, x0, 0, 255, 0);
        if (x0 == x1 && y0 == y1)
            break;
        e2 = 2 * err;
        if (e2 > -dy) {
            err -= dy;
            x0 += sx;
        }
        if (e2 < dx) {
            err += dx;
            y0 += sy;
        }
    }
}

void read_dials()
{
    volatile int* dial1 = (int*)0xff14;
    unsigned dial1_value = (*dial1) >> 2;
    int dial1_cos = cos_table[dial1_value];
    int dial1_sin = sin_table[dial1_value];
    racket1.endPoint.x = (16 * dial1_cos) / 100;
    racket1.endPoint.y = (16 * dial1_sin) / 100;

    // volatile int* dial2 = (int*)0xff18;
}

void draw_rackets()
{
    read_dials();
    lcd_clear_vbuf();
    draw_racket1();
    draw_racket2();
    lcd_sync_vbuf();
}

State handle_playing()
{
    while (1) {
    }
    return PLAYING;
}

void interrupt_playing()
{
    lcd_clear_vbuf();
    lcd_putc(5, 5, 'P');
    lcd_sync_vbuf();
}

void main()
{
    State state = INIT;
    lcd_init();
    while (1) {
        state = handle_playing();
    }
}

void interrupt_handler()
{
    interrupt_playing();
}