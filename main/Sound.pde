import ddf.minim.*;
Minim minim;
AudioSample putStone_sound;

void setup_sound(){
    minim = new Minim(this);
    putStone_sound = minim.loadSample("../Sound/putStone.mp3");
}
