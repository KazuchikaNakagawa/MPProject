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

typedef struct {
    int x;
    int y;
    int vx;
    int vy;
} Ball;

// 96x64px
// racket -> 16px len
static Racket racket1 = { { 16, 16 }, { 16, 32 } };
static Racket racket2 = { { 80, 16 }, { 80, 32 } };
static Ball ball = { 48, 32, 1, 0 };

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
    // lcd_putc(1, 0, '0' + dial1_value / 100);
    // lcd_putc(1, 1, '0' + (dial1_value % 100) / 10);
    // lcd_putc(1, 2, '0' + dial1_value % 10);
    int dial1_cos = cos_table[dial1_value];
    int dial1_sin = sin_table[dial1_value];
    // lcd_putc(0, 0, ('0' + dial1_cos / 100));
    // lcd_putc(0, 1, '0' + (dial1_cos % 100) / 10);
    // lcd_putc(0, 2, ('0' + dial1_cos % 10));
    racket1->endPoint.y = racket1->pos.y + (16 * dial1_cos) / 100;
    racket1->endPoint.x = racket1->pos.x + (16 * dial1_sin) / 100;

    volatile int* dial2 = (int*)0xff18;
    unsigned dial2_value = (*dial2) >> 2;
    lcd_putc(1, 3, '0' + dial2_value / 100);
    lcd_putc(1, 4, '0' + (dial2_value % 100) / 10);
    lcd_putc(1, 5, '0' + dial2_value % 10);
    int dial2_cos = cos_table[dial2_value];
    int dial2_sin = sin_table[dial2_value];
    lcd_putc(0, 3, ('0' + dial2_cos / 100));
    lcd_putc(0, 4, '0' + (dial2_cos % 100) / 10);
    lcd_putc(0, 5, ('0' + dial2_cos % 10));
    racket2->endPoint.y = racket2->pos.y + (16 * dial2_cos) / 100;
    racket2->endPoint.x = racket2->pos.x + (16 * dial2_sin) / 100;
}

void draw_rackets()
{
    lcd_clear_vbuf();
    read_dials(&racket1, &racket2);

    draw_racket1(&racket1);
    draw_racket2(&racket2);
    lcd_sync_vbuf();
}

void draw_ball(Ball* ball)
{
    // drawing 5x5px ball
    for (int i = -2; i <= 2; i++) {
        for (int j = -2; j <= 2; j++) {
            lcd_set_vbuf_pixel(ball->y + i, ball->x + j, 255 / (1 + abs(i * j)), 255 / (1 + abs(i * j)), 255 / (1 + abs(i * j)));
        }
    }
}

void move_ball(Ball* ball)
{
    ball->x += ball->vx;
    ball->y += ball->vy;
    if (ball->x <= 0 || ball->x >= 95) {
        // now bouncing,, but should be point lost
        ball->vx = -ball->vx;
    }
    if (ball->y <= 0 || ball->y >= 63) {
        ball->vy = -ball->vy;
    }
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
    draw_ball(&ball);
    move_ball(&ball);
}

void main() // NOLINT
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

    ball.x = 48;
    ball.y = 32;
    ball.vx = 1;
    ball.vy = 0;

    lcd_init();
    while (1) {
        state = handle_playing();
    }
}

void interrupt_handler()
{
    interrupt_playing();
}