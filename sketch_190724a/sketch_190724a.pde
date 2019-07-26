void setup() {
    size(400,400);
}

void draw() {
    stroke(0);
    fill(0,140,0);

  // 縦に8回くりかえす
    for(int i = 0; i < 8; i++){
        // 横に8回くりかえす
        for(int j = 0; j < 8; j++){
        // 長方形を描く。x座標はj*50、y座標はi*50、縦横の長さは50。
        rect(j * 50, i * 50, 50, 50);
        }
    }
}
