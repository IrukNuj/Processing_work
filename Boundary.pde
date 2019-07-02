//壁型

class Boundary { 
  float x;//iti no x zahyou 
  float y;//iti no y zahyou
  float w;//yokohaba
  float h;//tatehaba 
  Body b; 
 
  Boundary(float x_,float y_, float w_, float h_) { 
    x = x_; 
    y = y_; 
    w = w_; 
    h = h_; 
 
    PolygonShape sd = new PolygonShape(); 
    float box2dW = box2d.scalarPixelsToWorld(w/2); 
    float box2dH = box2d.scalarPixelsToWorld(h/2); 
 
    sd.setAsBox(box2dW, box2dH); 
     
    // Create the body 
    BodyDef bd = new BodyDef(); 
    bd.type = BodyType.STATIC; 
    bd.position.set(box2d.coordPixelsToWorld(x,y)); 
    b = box2d.createBody(bd); 
    b.createFixture(sd,1); 
  } 
 
  // 壁を描く
  void display() { 
    //noStroke(); 
    stroke(0, 128, 255, 178); //壁の輪郭線の色
    fill(0, 128, 255, 128); // kabe no nuritubusi no iro
    rectMode(CENTER); //
    //rect(x,y,w,h); //
    rect(x, y, w - 30, h); //sikaku wo egaku
  } 
 
} 
