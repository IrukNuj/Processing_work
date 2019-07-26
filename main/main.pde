Board board;
Ai ai;
int stoneColor = 1; // 1:黒、-1:白とする

void setup() {
  size(400,400);
  board = new Board();
  board.initGame();
  ai = new Ai(board);
}

void draw() {
  board.display();
}

void mouseClicked() {
  Cell cell = board.getCellAtXY(mouseX, mouseY);
  ArrayList<Cell> cellsToFlip = board.cellsToFlipWith(cell, stoneColor);

  //引っ繰り返せるマスがある場合は石が置ける
  if(cellsToFlip.size() > 0){
    //石を置く
    cell.putStone(stoneColor);

    // それぞれひっくりかえす
    for(Cell c: cellsToFlip){
      c.flip();
    }
  } else {
    // ひっくりかえせるマスがない場合は何もしない
  }

  stoneColor *= -1; // ターンエンド。石の色を反転させる
  // 白だったらAIのターン
  if( stoneColor == -1){
     turnForAi();
  }
}

void turnForAi() {
    // 置くマスを考えてかえす
  Cell cell = ai.think();
  // そこに置いた場合にひっくりかえすマス
  ArrayList<Cell> cellsToFlip = board.cellsToFlipWith(cell, stoneColor);

  // 石を置いて
  cell.putStone(stoneColor);
  // それぞれひっくり返す
  for(Cell c: cellsToFlip){
    c.flip();
  }

  stoneColor *= -1; // ターンエンド
}
