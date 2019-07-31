/**
* ボタン類をとりしきるクラス
*/
class Ui {
  // ボタンの番号
  static final int SKIP = 1;

  int skipButtonX = 640 - 80;
  int skipButtonY = 640 + 5;
  int skipButtonWidth = 70;
  int skipButtonHeight = 30;

  void display() {
    displaySkipButton();
  }

  void displaySkipButton() {
    stroke(100);
    fill(100,100,100);
    rect(skipButtonX, skipButtonY, skipButtonWidth, skipButtonHeight);
    textSize(18);
    fill(0);
    text("Skip",skipButtonX + 14, skipButtonY + 23);
  }

  /**
  * 「AIが考えてる」と表示する
  */
  void showThinking() {
    textSize(20);
    fill(0);
    text("AI thinking..", 20 , 640 + 30);
  }

  void showResultMessage(String message, int score) {
    textSize(40);
    fill(0);
    String resultMessage;
    resultMessage = String.format("%s - %s", 32+score, 32-score);
    text(message, 160 , 320);
    text(resultMessage, 160 , 360);

  }

  /**
  * その座標で押されたボタンがあればそのボタンの番号を返す
  */
  int hitAnyButton(int x, int y) {
    // スキップボタンが押されたかどうか
    if(x > skipButtonX && x < skipButtonX + skipButtonWidth &&
       y > skipButtonY && y < skipButtonY + skipButtonHeight ){
      return SKIP;
    }
    return 0;
  }
}
