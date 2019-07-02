import gab.opencv.*; 
import processing.video.*; 
  
PImage src; 
OpenCV opencv; 
Capture video; 
 
 
void setup_image()  
{ 
  video = new Capture(this, 640, 480); //カメラを設置する
  video.start(); //カメラ撮影スタートする
   
  colorMode(RGB, 255, 255, 255, 255); 
  opencv = new OpenCV(this, 640, 480); 
////////////////} 
 
 
//一枚目の画像を作る 
/////////////////void draw_image_processing()  
/////////////////{ 
  if (video.available()) { 
    video.read(); 
  } 
   
  // Load the new frame of our camera in to OpenCV 
  opencv.loadImage(video); 
  opencv.useColor();  
  src = opencv.getSnapshot(); 
  
  if(keyPressed) 
  {  
   image(src, 0, 0, src.width/2, src.height/2); 
  } 
} 
