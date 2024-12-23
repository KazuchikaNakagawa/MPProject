# マイクロプロセッサ実験　計画
## メンバー
62213348 寺田

62213887 中川

62219527 宮崎

62222611 渡貫

## 必須条件
 - 画面の右端にP1ラケット、左端にP2ラケット
 - ボールは直線移動、ボールがラケットの位置に存在する時にボタンを押すとボールが跳ね返る

## 原案
 - スカッシュ（壁に跳ね返る）
 - ラケットの位置によって角度が変わる
 - ダイヤル？をつかってみたい
 - 点数表示（セグメント, or 画面上）

## 外部仕様
 - スタート画面でBTN0を押してゲームスタート
 - 最初だけボールが画面中央からP2に向かって直進
 - ラケットが表示されており、ダイヤルを回して振る(角度、速度が変わる)
 - 各プレイヤーのラケットはボールの座標に応じて一定速度で移動(厳しいコースを狙うと有利)
 - 25点満点で得点ごとに画面表示(デュースなし)

## 内部仕様
### ステート
```c
typedef enum {
    INIT,
    PLAYING,
    VIEWING_SCORE,
    END
} State;

State handle_init();
State handle_playing();
State handle_viewing();
State handle_end();
```
main関数は対応する関数を呼び出し、戻り値のステートに遷移する。
`INIT`ステートではスタート画面を表示する。BTN0の押下により`PLAYING`になる。

`PLAYING`ではボールの移動、ラケットの移動、ダイヤル操作の待ち受けが行われる。ボールの座標が画面外になり、得点が変化すると`VIEWING_SCORE`に遷移する。

`VIEWING_SCORE`では得点の状況が表示される。
BTN0でゲームが再開される。勝敗が決まったらENDに遷移する。

`END`では勝利したプレイヤーの名前が表示される。
BTN0で再び`INIT`に遷移し、次のゲームを待つ。

### `INIT`ステート
`check_btn0()`関数等をwhileで呼び出して遷移する。
適宜余力があればアニメーションを追加する。

### `PLAYING`ステート
while文のなかで
- ダイヤルの入力確認(`check_dials`)
- ボールの座標計算(`move_ball(Ball*)`)
- ボールがコート外にいるか判定する関数(`check_ball(Ball*)`)

を呼ぶ。

### `VIEWING_SCORE`ステート
スコアを表示し、while文の中で`check_btn0()`などを
呼ぶ。

## 担当セクション
- `INIT`, `END`:渡貫
- `PLAYING`のラケット部分: 宮崎
- `PLAYING`のボール部分: 中川
- `VIEWING_SCORE`の部分: 寺田

## フローチャート
[こちら](https://docs.google.com/presentation/d/1i-vFEwM2cyURMkjosglFH6J28HER-Qemv2EnI0zyA0k/edit?usp=sharing)