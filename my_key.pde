float falling_time = 1.85; 
 
void keyPressed()  
{  
  if(key == 'p' && state == 0) 
  { 
    state = 1; 
    my_timer = 0.0; 
    index = 0; 
    song.rewind(); 
    song.play(); 
  } 
   
  if(key == 'e' && state == 1) 
  {
    state = 2;
    song.pause();
  }
  
  if(key == 'r' && state == 2)
  {
    state = 0;
  }
} 
