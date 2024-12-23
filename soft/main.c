#include "ChrFont0.h"
#include "crt0.c"

typedef enum {
    INIT,
    PLAYING,
    VIEWING_SCORE,
    END
} State;

extern State handle_init();
extern State handle_playing();
extern State handle_viewing();
extern State handle_end();

extern State interrupt_init();
extern State interrupt_playing();
extern State interrupt_viewing();
extern State interrupt_end();

static State state = INIT;

void interrupt_handler()
{
    switch (state) {
    case INIT:
        state = interrupt_init();
        break;
    case PLAYING:
        state = interrupt_playing();
        break;
    case VIEWING_SCORE:
        state = interrupt_viewing();
        break;
    case END:
        state = interrupt_end();
        break;
    }
}

void main()
{
    while (1) {
        switch (state) {
        case INIT:
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