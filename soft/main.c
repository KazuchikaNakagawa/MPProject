#include "defines.h"
#include "lcd.c"
#include "lcd.h"

static State state = INIT;

void interrupt_handler()
{
    switch (state) {
    case INIT:
        interrupt_init();
        break;
    case PLAYING:
        interrupt_playing();
        break;
    case VIEWING_SCORE:
        interrupt_viewing();
        break;
    case END:
        interrupt_end();
        break;
    }
}

void main()
{
    while (1) {
        switch (state) {
        case INIT:
            lcd_init();
            state = handle_init();
            break;
        case PLAYING:
            state = handle_playing();
            break;
        case VIEWING_SCORE:
            state = handle_viewing();
            break;
        case END:
            state = handle_end();
            break;
        }
    }
}