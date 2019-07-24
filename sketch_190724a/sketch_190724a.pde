int gameState;
int px = 200;
int py = 420;
int pw = 40;
int ph = 20;

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
    ballSpdX = 2;
    ballSpdY = 2;
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
    ballMove();
    ballDisp();
}

void gameOver(){

}

void playerMove(){
    px = mouseX;
    if((px+pw) > width){
        px = width - pw;
    }
}

void playerDisp(){
    fill(0,0,100);
    rect(px, py, pw, ph, 10);
}

void ballDisp(){
    imageMode(CENTER);
    fill(0,0,100);
    rect(ballX, ballY, ballWidth, ballHeight);
    imageMode(CORNER);
}

void ballMove(){
    ballX += ballSpdX;
    ballY += ballSpdY;
}
