import ddf.minim.*;
Minim minim;
AudioSample putStone_sound;
AudioPlayer bgm;

void setup_sound(){
    minim = new Minim(this);
    putStone_sound = minim.loadSample("../Sound/putStone.mp3");
    bgm = minim.loadFile("../Sound/bgm.mp3");
}
