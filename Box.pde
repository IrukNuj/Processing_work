float ts;
float cxx, cyy;
int sum = 0;
 
class Box { 
  Body body; 
 
  // Constructor 
  Box(float x, float y) { 
    // Add the box to the box2d world 
    makeBody(new Vec2(x,y), box_w, box_h); 
  } 
 
 
  void killBody() { 
    box2d.destroyBody(body); 
  } 
 
 
  boolean done() { 
    Vec2 pos = box2d.getBodyPixelCoord(body);   
    //pos.y is the box current positon 
 
    if (pos.y > height + box_w + box_h) { 
      killBody(); 
      return true; 
    } 
    return false; 
  } 
 
 
  boolean compare() 
  { 
    Vec2 pos = box2d.getBodyPixelCoord(body);   
    //(pos.x, pos.y) is the box current positon 
    
    
    if ((abs(pos.y - goal_y) < box_h/2.0 + box_h && keyPressed )) 
    {
    if((goal_x[0] == pos.x && key == 'a') ||
        (goal_x[1] == pos.x && key == 'b') ||
        (goal_x[2] == pos.x && key == 'c'))
     {
       //得点を足す
       sum++;
       
       //文字
       text("GREAT", pos.x, pos.y - box_h);
       
       //画像
       if (video.available()) {
         video.read();//カメラからビデオ映像を撮影する
       }
       opencv.loadImage(video);
       opencv.useColor();
       //src = opencv.getSnapshot;
       //ビデオから現在1フレームから取り出す
       //一枚の静止画像を作った
       
       //光るパーティクル
       hikaru_able = 1;
       hikaru_timer = my_timer;
       cxx = pos.x;
       cyy = pos.y - 30; //pos.y;
       
       for (int pid = 0; pid < MAX_PARTICLE; pid++) {
         hikaru_p[pid].explode();
       }
       /////////////////////////////
       
       killBody();
       
       return true;
     }
     }
    
    return false;
  }
  /*/////////////////////////////
      fill(255); 
      ts = 16; 
      textSize(ts); 
      text("GREAT", pos.x, pos.y - box_h); 
 
      killBody(); 
      return true; 
    } 
    return false; 
  }
  ////////////////////////////*/
 
 
  void display() { 
    Vec2 pos = box2d.getBodyPixelCoord(body); 
    rectMode(CENTER); 
    pushMatrix(); 
    translate(pos.x,pos.y); 
    fill(0, 255, 0, 200); 
    stroke(0, 255, 0, 128); 
    rect(0,0, box_w, box_h); 
    popMatrix(); 
  } 
 
 
  void display_goal()  
  { 
    Vec2 pos = box2d.getBodyPixelCoord(body); 
     
    float a = map(goal_y - pos.y, 2.0*box_h,  0, 80, 255); 
    bww = box_w; 
    bhh = map(goal_y - pos.y, 0.0, 2.0*box_h, 0.0, 2.5*box_h); 
     
    if (goal_y - pos.y >= 0 && goal_y - pos.y < 2.0* box_h) 
    { 
        rectMode(CENTER); 
        pushMatrix(); 
        translate(pos.x , goal_y - box_h/2); 
        fill(255, 255, 0, a); 
        noStroke(); 
        rect(0,0, bww, bhh); 
        popMatrix(); 
 
    } 
  } 
 
 
  void makeBody(Vec2 center, float w_, float h_) { 
    PolygonShape sd = new PolygonShape(); 
    float box2dW = box2d.scalarPixelsToWorld(w_/2); 
    float box2dH = box2d.scalarPixelsToWorld(h_/2); 
    sd.setAsBox(box2dW, box2dH); 
 
    // Define a fixture 
    FixtureDef fd = new FixtureDef(); 
    fd.shape = sd; 
    fd.density = 4.8; 
    fd.friction = 0.5; 
    fd.restitution = 0.5; 
 
    // Define the body and make it from the shape 
    BodyDef bd = new BodyDef(); 
    bd.type = BodyType.DYNAMIC; 
    bd.position.set(box2d.coordPixelsToWorld(center)); 
 
    body = box2d.createBody(bd); 
    body.createFixture(fd); 
  } 
} 
 
 
 
void add_box(int type) 
{ 
    Box p = new Box(goal_x[type], start_y); 
    boxes.add(p); 
} 
