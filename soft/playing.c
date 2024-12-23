#include "crt0.c" // NOLINT

#include "defines.h"
#include "lcd.c"

#define abs(x) ((x) < 0 ? -(x) : (x))

static int* sin_table;
static int* cos_table;

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

void draw_racket1(Racket* racket1)
{
    // draw line from racket1.pos to racket1.endPoint
    // using bresenham's line algorithm
    int x0 = racket1->pos.x;
    int y0 = racket1->pos.y;
    int x1 = racket1->endPoint.x;
    int y1 = racket1->endPoint.y;
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

void draw_racket2(Racket* racket2)
{
    // draw line from racket2.pos to racket2.endPoint
    // using bresenham's line algorithm
    int x0 = racket2->pos.x;
    int y0 = racket2->pos.y;
    int x1 = racket2->endPoint.x;
    int y1 = racket2->endPoint.y;
    int dx = abs(x1 - x0);
    int dy = abs(y1 - y0);
    int sx = x0 < x1 ? 1 : -1;
    int sy = y0 < y1 ? 1 : -1;
    int err = dx - dy;
    int e2;

    for (;;) {
        lcd_set_vbuf_pixel(y0, x0, 0, 0, 255);
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

void read_dials(Racket* racket1, Racket* racket2)
{
    volatile int* dial1 = (int*)0xff14;
    unsigned dial1_value = (*dial1) >> 2;
    lcd_putc(1, 0, '0' + dial1_value / 100);
    lcd_putc(1, 1, '0' + (dial1_value % 100) / 10);
    lcd_putc(1, 2, '0' + dial1_value % 10);
    int dial1_cos = cos_table[dial1_value];
    int dial1_sin = sin_table[dial1_value];
    lcd_putc(0, 0, ('0' + dial1_cos / 100));
    lcd_putc(0, 1, '0' + (dial1_cos % 100) / 10);
    lcd_putc(0, 2, ('0' + dial1_cos % 10));
    racket1->endPoint.y = racket1->pos.y + (16 * dial1_cos) / 100;
    racket1->endPoint.x = racket1->pos.x + (16 * dial1_sin) / 100;

    // volatile int* dial2 = (int*)0xff18;
}

void draw_rackets()
{
    lcd_clear_vbuf();
    read_dials(&racket1, &racket2);

    draw_racket1(&racket1);
    draw_racket2(&racket2);
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
    draw_rackets();
}

void main()
{
#include "cos_table.h"
#include "sin_table.h"
    sin_table = _sin_table;
    cos_table = _cos_table;
    State state = INIT;
    racket1.pos.x = 16;
    racket1.pos.y = 16;
    racket1.endPoint.x = 16;
    racket1.endPoint.y = 32;

    racket2.pos.x = 80;
    racket2.pos.y = 16;
    racket2.endPoint.x = 80;
    racket2.endPoint.y = 32;
    lcd_init();
    while (1) {
        state = handle_playing();
    }
}

void interrupt_handler()
{
    interrupt_playing();
}