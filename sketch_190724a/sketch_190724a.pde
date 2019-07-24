int gameState;
int playerX = 200;
int playerY = 420;
int playerWidth = 40;
int playerHeight = 20;
boolean isHitted;

int blockWidth = 78;
int blockHeigtht = 30;

float ballX;
float ballY;
float ballSpdX;
float ballSpdY;
int ballWidth = 7;
int ballHeight = 7;


void setup(){
    size(400, 500);
    noStroke();
    colorMode(HSB, 100,100,100);
    gameInit();
}

void draw(){
    background(20, 20, 20);
    if(gameState == 0){
        gameTitle();
    } else if(gameState == 1){
        gamePlay();
    } else {
        gameOver();
    }
}

void gameInit(){
    gameState = 0;
    ballX = 100;
    ballY = 250;
    ballSpdX = 4;
    ballSpdY = 4;
    isHitted = false;
}
void gameTitle(){
    for(int i=0; i<100; i+=10){
        fill(i, 100,100);
        ellipse(70+i*3, 150, 50,50);
    }
    if (mousePressed){
        gameState = 1;
    }
}
void gamePlay(){
    playerMove();
    playerDisp();
    blockDisp();
    ballMove();
    ballDisp();
}

void gameOver(){

}

void playerMove(){
    playerX = mouseX;
    if((playerX+playerWidth) > width){
        playerX = width - playerWidth;
    }
}

void playerDisp(){
    fill(0,0,100);
    rect(playerX, playerY, playerWidth, playerHeight, 10);
}

void ballDisp(){
    imageMode(CENTER);
    // fill(0,0,100);
    fill(0,100,100);

    rect(ballX, ballY, ballWidth, ballHeight);
    imageMode(CORNER);
}

void ballMove(){
    ballX += ballSpdX;
    ballY += ballSpdY;

    // 画面上下での跳ね返り
    if ((ballY > height) || (ballY < 0)){
        ballSpdY = -ballSpdY;
    }

    // 左右での反射
    if ((ballX < 0) || (width < ballX)){
        ballSpdX = -ballSpdX;
    }

    if((!isHitted) && (playerX < ballX) && (playerX + playerWidth > ballX) && (playerY < ballY) && (playerY + playerHeight > ballY)){
        ballSpdY = -ballSpdY;
        isHitted = true;
    }

    if ( ballY < playerY - playerWidth/2){
        isHitted = false;
    }
}

void blockDisp{
    int xx, yy;

}
