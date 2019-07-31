Board board;
Computer computer;
Ui ui;

int myStone = Cell.BLACK;
int computerStone = Cell.WHITE;
int turn = Cell.BLACK;

int computerTurnStartTime;

void setup() {
  size(640 ,640 );
  setup_sound();
  board = new Board();
  board.initGame();
  computer = new Computer(board, computerStone);
  ui = new Ui();
  bgm.play();
}

void draw(){
  background(255);
  board.display();

  if(board.getAvailableCells().size() == 0){
    gameOver();
    return;
  }
  ui.display();

  if(isMyTurn()){
    showGhost();
  }
  if(!isMyTurn()) {
    if( computerTurnStartTime == 0){
      computerTurnStartTime = millis();
    }
    ui.showThinking();

    if(millis() - computerTurnStartTime > 1000){
      turnForcomputer();
      computerTurnStartTime = 0;
    }
  }
}

void showGhost() {
  Cell cell = board.getCellAtGeometry(mouseX, mouseY);
  if(cell != null){
    cell.showGhost(myStone);
  }
}

boolean isMyTurn() {
  return (myStone == turn);
  }

void turnEnd() {
  turn = (myStone == turn) ? computerStone : myStone;
}


void mouseClicked() {
  if(!isMyTurn()){
    return;
  }

  if(ui.hitAnyButton(mouseX, mouseY) == ui.SKIP){
    turnEnd();
    return;
  }

  Cell cell = board.getCellAtGeometry(mouseX, mouseY);
  ArrayList<Cell> cellsToFlip = board.cellsToFlipWith(cell, myStone);

  if(cellsToFlip.size() > 0){
    cell.putStone(myStone);

    for(Cell c: cellsToFlip){
      c.flip();
    }

    turnEnd();
  }
}

void turnForcomputer() {
  Cell cell = computer.think();

  if(cell ==null){
    turnEnd();
    return;
  }

  ArrayList<Cell> cellsToFlip = board.cellsToFlipWith(cell, turn);

  cell.putStone(turn);
  for(Cell c: cellsToFlip){
    c.flip();
  }
  turnEnd();
}

void gameOver() {
  board.initGame();
  String message;
  int score = board.calcScore();
  if( board.winner() == myStone ){
    message = "あなたの勝ち！";
  } else if ( board.winner() == computerStone ){
    message = "あなたのまけ...";
  } else {
    message = "引き分け";
  }
  rect(200, 250, 240, 180);
  ui.showResultMessage(message, score);
  noLoop();
}
