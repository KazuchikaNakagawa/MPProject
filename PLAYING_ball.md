# ボール構造体について
## 求められる機能
- 移動
- 跳ね返り
- ラケットとの衝突判定

## ボールの構造体
```c
typedef struct {
    int x;
    int y;
    double r;
    double vx;
    double vy;
} Ball;
```

### 移動
```c
void move_ball(Ball* ball);
```
割り込みで呼び出します。
壁に当たると壁で(一瞬)止まり、跳ね返り(vxを反転)します。

### ラケットとの衝突判定
ラケット側に任せます。
```c
void set_ball_velocity(Ball* ball, double vx, double vy);
```