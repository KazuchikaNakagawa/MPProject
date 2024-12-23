#ifndef DEFINES_H
#define DEFINES_H

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

extern void interrupt_init();
extern void interrupt_playing();
extern void interrupt_viewing();
extern void interrupt_end();

//プレイヤーAとプレイヤーBの勝利数が0~3の時にhandle_viewing()に勝利数を渡してください(プレイヤーAが左、プレイヤーBが右)
int win_a, Win_b;

#endif /* DEFINES_H */