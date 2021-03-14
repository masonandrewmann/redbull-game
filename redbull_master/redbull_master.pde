import processing.video.*;
import processing.serial.*;

//fetching input data from microcontroller
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
String[] list;
int inputs[] = {0, 0, 0, 0, 0, 0}; //button inputs from arduino

//assets
// Fighter fighter;    //our fighter
Movie background;   //background image
Movie callToActionScreen; //intro screen
Movie winScreen;
Movie tryAgainScreen;
Movie comboVideo1;  //combo video
Movie comboVideo2;  //combo video
Movie comboVideo3;  //combo video
Movie comboVideo4;  //combo video
PImage playerOverlay;  //player healthbar

//image arrays for all animations
PImage[] idleLeft = new PImage[2];
PImage[] idleRight = new PImage[2];
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
  //load the MP4s
  background = new Movie(this, "0_BACKGROUND/BACKGROUND.mp4");
  callToActionScreen = new Movie(this, "0_CALL_TO_ACTION_SCREEN/CALL_TO_ACTION_SCREEN.mp4");
  tryAgainScreen = new Movie(this, "0_TRY_AGAIN_SCREEN/TRY_AGAIN_SCREEN.mp4");
  winScreen = new Movie(this, "0_WIN_SCREEN/WIN_SCREEN.mp4");
  comboVideo1 = new Movie(this, "6_WINNING_MOVE_1/WINNING_MOVE_1_VID.mp4");
  comboVideo2 = new Movie(this, "6_WINNING_MOVE_2/WINNING_MOVE_2_VID.mp4");
  comboVideo3 = new Movie(this, "6_WINNING_MOVE_3/WINNING_MOVE_3_VID.mp4");
  comboVideo4 = new Movie(this, "6_WINNING_MOVE_4/WINNING_MOVE_4_VID.mp4");

  //load the PNGs
  for (int i = 0; i < 7; i++){
    walkLeft[i] = loadImage("1_LEFT_WALK/LEFT_WALK_FRAME_" + (i+1) + ".png");
    walkRight[i] = loadImage("1_RIGHT_WALK/RIGHT_WALK_FRAME_" + (i+1) + ".png");
    kickLeft[i] = loadImage("1_LEFT_KICK/LEFT_KICK_FRAME_" + (i+1) + ".png");
    kickRight[i] = loadImage("1_RIGHT_KICK/RIGHT_KICK_FRAME_" + (i+1) + ".png");
    punchLeft[i] = loadImage("1_LEFT_PUNCH/LEFT_PUNCH_FRAME_" + (i+1) + ".png");
    punchRight[i] = loadImage("1_RIGHT_PUNCH/RIGHT_PUNCH_FRAME_" + (i+1) + ".png");
    jumpLeft[i] = loadImage("1_LEFT_JUMP/LEFT_JUMP_FRAME_" + (i+1) + ".png");
    jumpRight[i] = loadImage("1_RIGHT_JUMP/RIGHT_JUMP_FRAME_" + (i+1) + ".png");
  }
  for (int i = 0; i < 2, i++){
    idleLeft[i] = loadImage("1_LEFT_IDLE/LEFT_IDLE_FRAME_" + (i+1) + ".png");
    idleRight[i] = loadImage("1_RIGHT_IDLE/RIGHT_IDLE_FRAME_" + (i+1) + ".png");
  }
  for (int i = 0; i < 12; i++){
    winningMove1[i] = loadImage("6_WINNING_MOVE_1/PNG_FOLDER/WINNING_MOVE_1_FRAME_" + (i+1) + ".png");
    winningMove2[i] = loadImage("6_WINNING_MOVE_2/PNG_FOLDER/WINNING_MOVE_2_FRAME_" + (i+1) + ".png");
    winningMove3[i] = loadImage("6_WINNING_MOVE_3/PNG_FOLDER/WINNING_MOVE_3s_FRAME_" + (i+1) + ".png");
  }
  for (int i = 0; i <13; i++){
        winningMove4[i] = loadImage("6_WINNING_MOVE_4/PNG_FOLDER/WINNING_MOVE_4_FRAME_" + (i+1) + ".png");
  }

}

void setup() {
  size(1920, 1080);
  loadAssets();
  // myMovie = new Movie(this, "BACKGROUND.mp4");
  // myMovie.loop();
}

void draw(){
  // image(myMovie, 0, 0);
  //fill(255);
  rect(300, 300, 300, 300);
}

void movieEvent(Movie m) {
  m.read();
}
