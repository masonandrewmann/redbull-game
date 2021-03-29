PGraphics img; //output graphics
PImage out;
int w, h, x, y;
String masterFolder = "scaled_assets/960x540";

//image arrays for all animations
PImage[] idleLeft = new PImage[9];
PImage[] idleRight = new PImage[9];
PImage[] walkLeft = new PImage[7];
PImage[] walkRight = new PImage[7];
PImage[] punchLeft = new PImage[7];
PImage[] punchRight = new PImage[7];
PImage[] kickLeft = new PImage[7];
PImage[] kickRight = new PImage[7];
PImage[] jumpLeft = new PImage[7];
PImage[] jumpRight = new PImage[7];
PImage[] winningMove1 = new PImage[12];
PImage[] winningMove2 = new PImage[12];
PImage[] winningMove3 = new PImage[12];
PImage[] winningMove4 = new PImage[13];

void loadAssets(){
    img = createGraphics(550, 400);
    x = 200;
    y = 100;
    w = 550;
    h = 400;
    out = createImage(w, h, ARGB);
    //load the MP4s
  //load the PNGs
  for (int i = 0; i < 7; i++){
    //load em
    walkLeft[i] = loadImage("../" + masterFolder + "/1_LEFT_WALK_V2/LEFT_WALK_FRAME_" + (i+1) + "_V2.png");
    walkRight[i] = loadImage("../" + masterFolder + "/1_RIGHT_WALK_V2/RIGHT_WALK_FRAME_" + (i+1) + "_V2.png");
    kickLeft[i] = loadImage("../" + masterFolder + "/2_LEFT_KICK/LEFT_KICK_FRAME_" + (i+1) + ".png");
    kickRight[i] = loadImage("../" + masterFolder + "/2_RIGHT_KICK/RIGHT_KICK_FRAME_" + (i+1) + ".png");
    punchLeft[i] = loadImage("../" + masterFolder + "/3_LEFT_PUNCH/LEFT_PUNCH_FRAME_" + (i+1) + ".png");
    punchRight[i] = loadImage("../" + masterFolder + "/3_RIGHT_PUNCH/RIGHT_PUNCH_FRAME_" + (i+1) + ".png");
    jumpLeft[i] = loadImage("../" + masterFolder + "/4_LEFT_JUMP/LEFT_JUMP_FRAME_" + (i+1) + ".png");
    jumpRight[i] = loadImage("../" + masterFolder + "/4_RIGHT_JUMP/RIGHT_JUMP_FRAME_" + (i+1) + ".png");
    
    //export em
    exportImage(walkLeft[i], "new/1_LEFT_WALK_V2/LEFT_WALK_FRAME_" + (i+1) + "_V2.png");
    exportImage(walkRight[i], "new/1_RIGHT_WALK_V2/RIGHT_WALK_FRAME_" + (i+1) + "_V2.png");
    exportImage(kickLeft[i], "new/2_LEFT_KICK/LEFT_KICK_FRAME_" + (i+1) + ".png");
    exportImage(kickRight[i], "new/2_RIGHT_KICK/RIGHT_KICK_FRAME_" + (i+1) + ".png");
    exportImage(punchLeft[i], "new/3_LEFT_PUNCH/LEFT_PUNCH_FRAME_" + (i+1) + ".png");
    exportImage(punchRight[i], "new/3_RIGHT_PUNCH/RIGHT_PUNCH_FRAME_" + (i+1) + ".png");
    exportImage(jumpLeft[i], "new/4_LEFT_JUMP/LEFT_JUMP_FRAME_" + (i+1) + ".png");
    exportImage(jumpRight[i], "new/4_RIGHT_JUMP/RIGHT_JUMP_FRAME_" + (i+1) + ".png");
    
    println("loop 1 complete!");
  }
  
  for (int i = 0; i < 9; i++){
    idleLeft[i] = loadImage("../" + masterFolder + "/5_LEFT_IDLE_V2/LEFT_IDLE_FRAME_" + (i+1) + "_V2.png");
    idleRight[i] = loadImage("../" + masterFolder + "/5_RIGHT_IDLE_V2/RIGHT_IDLE_FRAME_" + (i+1) + "_V2.png");
    exportImage(idleLeft[i], "new/5_LEFT_IDLE_V2/LEFT_IDLE_FRAME_" + (i+1) + "_V2.png");
    exportImage(idleRight[i], "new/5_RIGHT_IDLE_V2/RIGHT_IDLE_FRAME_" + (i+1) + "_V2.png");
  }
  
  //for (int i = 0; i < 12; i++){
  //  winningMove1[i] = loadImage("6_WINNING_MOVE_1/PNG_FOLDER/WINNING_MOVE_1_FRAME_" + (i+1) + ".png");
  //  winningMove2[i] = loadImage("6_WINNING_MOVE_2/PNG_FOLDER/WINNING_MOVE_2_FRAME_" + (i+1) + ".png");
  //  winningMove3[i] = loadImage("6_WINNING_MOVE_3/PNG_FOLDER/WINNING_MOVE_3_FRAME_" + (i+1) + ".png");
  //}
  //for (int i = 0; i <13; i++){
  //      winningMove4[i] = loadImage("6_WINNING_MOVE_4/PNG_FOLDER/WINNING_MOVE_4_FRAME_" + (i+1) + ".png");
  //}

  //playerOverlay = loadImage("0_GRAPHICS/PLAYER_1_FANG/PLAYER_1_FANG.png");

  //for (int i = 0; i <11; i++){
  //      comboBar[i] = loadImage("0_GRAPHICS/COMBO_BAR/COMBO_BAR_FRAME_" + (i+1) + ".png");
  //}
  println("DONE!");

}

void exportImage(PImage image, String fileName){
  out.copy(image, x, y, w, h, 0, 0, w, h);
  img.beginDraw();
  img.image(out, 0, 0);
  img.endDraw();
  img.save(fileName);
  
  img.beginDraw();
  img.clear();
  img.endDraw();
}

void setup(){
  background(10, 10);
  loadAssets();
}

void draw(){
  
}
//PImage test;
//PImage out;
//PGraphics img;

//int w, h, x, y;

//void setup(){
//  size(500, 750);
//  //background(0, 0, 0, 255);
//  img = createGraphics(500, 750);
//  x = 670;
//  y = 250;
//  w = 500;
//  h = 750;
//  test = loadImage("../redbull_master/data/1_LEFT_WALK/LEFT_WALK_FRAME_1.png");
//  out = createImage(w, h, ARGB);
//  out.copy(test, x, y, w, h, 0, 0, w, h);
//  img.beginDraw();
//  img.image(out, 0, 0);
//  img.endDraw();
  
//  img.save("out.png");
//}

//void loop(){
  
//}
