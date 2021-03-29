import processing.video.*;
import processing.serial.*;
import processing.sound.*;


//fetching input data from microcontroller
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
String[] list;
int inputs[] = {0, 0, 0, 0, 0, 0, 0}; //button inputs from arduino
int prevInputs[] = {0, 0, 0, 0, 0, 0, 0}; // left, right, up, down, punch, kick
int comboSigTime = 0;
int comboSigTimeout = 6000;
boolean comboSent = false; 

//font for timer
PFont fightingFont;

//assets
Fighter fighter;    //our fighter
//Movie background;   //background image
Movie callToActionScreen; //intro screen
Movie winScreen;
Movie resetScreen;
//Movie comboVideo1;  //combo video
//Movie comboVideo2;  //combo video
//Movie comboVideo3;  //combo video
//Movie comboVideo4;  //combo video
PImage staticBackground;
PImage playerOverlay;  //player healthbar
PImage[] comboBar = new PImage[11];

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

//sound files
SoundFile bgMusic;
SoundFile punchSound;
SoundFile kickSound;
SoundFile introSound;
SoundFile beginSound;
SoundFile[] winSound = new SoundFile[4];
SoundFile resetSound;

//array of all animations arrays for our fighter
PImage[][] animations = new PImage[14][];

//keeping track of what part of the game we're in
int gameState = 0; //0 = call to action; 1 = gameplay; 2 = win; 3 = try again;
boolean playWinSound = false;
int masterTimer = 0;

float bgDimmer = 0;






void loadAssets() {
  //load the MP4s
  //background = new Movie(this, "0_BACKGROUND/BACKGROUND.mp4");
  callToActionScreen = new Movie(this, "0_CALL_TO_ACTION_SCREEN/CALL_TO_ACTION_SCREEN.mp4");
  resetScreen = new Movie(this, "0_TRY_AGAIN_SCREEN/TRY_AGAIN_SCREEN.mp4");
  winScreen = new Movie(this, "0_WIN_SCREEN/WIN_SCREEN.mp4");
  callToActionScreen.frameRate(20);
  resetScreen.frameRate(20);
  winScreen.frameRate(20);
  //comboVideo1 = new Movie(this, "6_WINNING_MOVE_1/WINNING_MOVE_1_VID.mp4");
  //comboVideo2 = new Movie(this, "6_WINNING_MOVE_2/WINNING_MOVE_2_VID.mp4");
  //comboVideo3 = new Movie(this, "6_WINNING_MOVE_3/WINNING_MOVE_3_VID.mp4");
  //comboVideo4 = new Movie(this, "6_WINNING_MOVE_4/WINNING_MOVE_4_VID.mp4");
  staticBackground = loadImage("0_BACKGROUND/BACKGROUND.png");

  //load the PNGs
  for (int i = 0; i < 7; i++) {
    walkLeft[i] = loadImage("1_LEFT_WALK_V2/LEFT_WALK_FRAME_" + (i+1) + "_V2.png");
    walkRight[i] = loadImage("1_RIGHT_WALK_V2/RIGHT_WALK_FRAME_" + (i+1) + "_V2.png");
    kickLeft[i] = loadImage("2_LEFT_KICK/LEFT_KICK_FRAME_" + (i+1) + ".png");
    kickRight[i] = loadImage("2_RIGHT_KICK/RIGHT_KICK_FRAME_" + (i+1) + ".png");
    punchLeft[i] = loadImage("3_LEFT_PUNCH/LEFT_PUNCH_FRAME_" + (i+1) + ".png");
    punchRight[i] = loadImage("3_RIGHT_PUNCH/RIGHT_PUNCH_FRAME_" + (i+1) + ".png");
    jumpLeft[i] = loadImage("4_LEFT_JUMP/LEFT_JUMP_FRAME_" + (i+1) + ".png");
    jumpRight[i] = loadImage("4_RIGHT_JUMP/RIGHT_JUMP_FRAME_" + (i+1) + ".png");
  }
  for (int i = 0; i < 9; i++) {
    idleLeft[i] = loadImage("5_LEFT_IDLE_V2/LEFT_IDLE_FRAME_" + (i+1) + "_V2.png");
    idleRight[i] = loadImage("5_RIGHT_IDLE_V2/RIGHT_IDLE_FRAME_" + (i+1) + "_V2.png");
  }
  for (int i = 0; i < 12; i++) {
    winningMove1[i] = loadImage("6_WINNING_MOVE_1/PNG_FOLDER/WINNING_MOVE_1_FRAME_" + (i+1) + ".png");
    winningMove2[i] = loadImage("6_WINNING_MOVE_2/PNG_FOLDER/WINNING_MOVE_2_FRAME_" + (i+1) + ".png");
    winningMove3[i] = loadImage("6_WINNING_MOVE_3/PNG_FOLDER/WINNING_MOVE_3_FRAME_" + (i+1) + ".png");
  }
  for (int i = 0; i <13; i++) {
    winningMove4[i] = loadImage("6_WINNING_MOVE_4/PNG_FOLDER/WINNING_MOVE_4_FRAME_" + (i+1) + ".png");
  }

  playerOverlay = loadImage("0_GRAPHICS/PLAYER_1_FANG/PLAYER_1_FANG.png");

  for (int i = 0; i <11; i++) {
    comboBar[i] = loadImage("0_GRAPHICS/COMBO_BAR/COMBO_BAR_FRAME_" + (i+1) + ".png");
  }

  //load the sounds
  bgMusic = new SoundFile(this, "SOUNDS/bg.mp3");
  bgMusic.amp(0.3);
  punchSound = new SoundFile(this, "SOUNDS/punch.wav");
  kickSound = new SoundFile(this, "SOUNDS/kick.wav");
  introSound = new SoundFile(this, "SOUNDS/announcer/intro.wav");
  beginSound = new SoundFile(this, "SOUNDS/announcer/beginning.wav");
  resetSound = new SoundFile(this, "SOUNDS/announcer/reset.wav");

  for (int i = 0; i < 4; i++) {
    winSound[i] = new SoundFile(this, "SOUNDS/announcer/WIN/WIN_" + (i+1) + ".wav");
  }

  //set up animations array for fighter
  animations[0] = idleLeft;
  animations[1] = idleRight;
  animations[2] = walkLeft;
  animations[3] = walkRight;
  animations[4] = punchLeft;
  animations[5] = punchRight;
  animations[6] = kickLeft;
  animations[7] = kickRight;
  animations[8] = jumpLeft;
  animations[9] = jumpRight;
  animations[10] = winningMove1;
  animations[11] = winningMove2;
  animations[12] = winningMove3;
  animations[13] = winningMove4;

  // Make Fighter object
  fighter = new Fighter(animations, 100, 0);
}

void movieEvent(Movie m) {
  m.read();
}

//void keyPressed(){
//  if (gameState == 1){
//    gameState = 2;
//  }

//  if (key == 'z'){
//    println("punch");
//    inputs[4] = 1;
//  } else if (key == 'x'){
//    inputs[5] = 1;
//    println("kick");
//  } else if (key == 'r'){
//    gameState = 7;
//  }
//  if (key == CODED) {
//    if (keyCode == LEFT){
//      inputs[0] = 1;
//    }
//    if (keyCode == RIGHT){
//      inputs[1] = 1;
//    }
//    if (keyCode == UP){
//      inputs[2] = 1;
//    }
//    if (keyCode == DOWN){
//      inputs[3] = 1;
//    }
//  }
//}

//void keyReleased(){
//    if (key == 'z'){
//    println("punch");
//    inputs[4] = 0;
//    fighter.punchAllow = true;
//    fighter.punching = false;
//  } else if (key == 'x'){
//    inputs[5] = 0;
//    println("kick");
//    fighter.kickAllow = true;
//    fighter.kicking = false;
//  }

//  if (key == CODED) {
//    if (keyCode == LEFT){
//      inputs[0] = 0;
//      fighter.inputsAllow[0] = true;
//    }
//    if (keyCode == RIGHT){
//      inputs[1] = 0;
//      fighter.inputsAllow[1] = true;
//    }
//    if (keyCode == UP){
//      inputs[2] = 0;
//      fighter.inputsAllow[2] = true;
//    }
//    if (keyCode == DOWN){
//      inputs[3] = 0;
//      fighter.inputsAllow[3] = true;
//    }
//  }
//}

void readTeensy() {
  //read inputs from arduino
  if ( myPort.available() > 0)
  {  // If data is available,

    val = myPort.readStringUntil('\n');       // read it and store it in val
    //println(val);
    if (val != null) {

      list = split(val, "a");
      for (int i = 0; i < list.length-1; i++) {
        prevInputs[i] = inputs[i];
        inputs[i] = Integer.parseInt(list[i]);
      }
      println(inputs);
      println("END PACKET");
    }
  }
  for (int i = 0; i < 6; i++) {
    if (inputs[i] == 1 && prevInputs[i] == 0) {
      teensyKeyPressed(i);
    } else if (inputs[i] == 0 && prevInputs[i] == 1) {
      teensyKeyReleased(i);
    }
  }

  //if winning combo has been done, send signal to arduino to release the drink
  if (gameState == 6 && !comboSent) {
    int i =0;
    while (i< 2) {
      myPort.clear();
      myPort.write("c");
      comboSent = true;
      comboSigTime = millis() + comboSigTimeout;
      println("sending c to teensy");
      i++;
    }
  }
  if (millis() > comboSigTime) comboSent = false;
  myPort.clear();
  //print("has the combo been sent?");
  //println(comboSent);
}

//Replicating functionality of builtin keyPressed() function for serial data from teensy
void teensyKeyPressed(int code) {
  if (gameState == 1) {
    gameState = 2;
  }

  //  if (code == 'z'){
  //    println("punch");
  //    inputs[4] = 1;
  //  } else if (key == 'x'){
  //    inputs[5] = 1;
  //    println("kick");
  //  } else if (key == 'r'){
  //    gameState = 7;
  //  }
  //  if (key == CODED) {
  //    if (keyCode == LEFT){
  //      inputs[0] = 1;
  //    }
  //    if (keyCode == RIGHT){
  //      inputs[1] = 1;
  //    }
  //    if (keyCode == UP){
  //      inputs[2] = 1;
  //    }
  //    if (keyCode == DOWN){
  //      inputs[3] = 1;
  //    }
  //  }
}

//Replicating functionality of builtin keyPressed() function for serial data from teensy
void teensyKeyReleased(int code) {
  if (code == 4) {
    println("punch");
    inputs[4] = 0;
    fighter.punchAllow = true;
    fighter.punching = false;
  } else if (code == 5) {
    inputs[5] = 0;
    println("kick");
    fighter.kickAllow = true;
    fighter.kicking = false;
  }
  if (code == 0) {
    inputs[0] = 0;
    fighter.inputsAllow[0] = true;
  } else if (code == 1) {
    inputs[1] = 0;
    fighter.inputsAllow[1] = true;
  } else if (code == 2) {
    inputs[2] = 0;
    fighter.inputsAllow[2] = true;
  } else if (code == 3) {
    inputs[3] = 0;
    fighter.inputsAllow[3] = true;
  }
}

void setup() {
  size(1920, 1080);
  frameRate(20);

  //get font ready
  fightingFont = createFont("FONTS/hollowpoint.ttf", 64);
  textFont(fightingFont);

  textSize(200);
  fill(255);
  textAlign(CENTER);
  background(0, 200, 140);
  text("loading...", width/2, height/2);
  textAlign(LEFT);
  //load images, videos and sounds
  loadAssets();

  //initialize serial comm
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
  //hi


  bgMusic.loop();
  masterTimer = millis();
}

void draw() {
  //background(255);
  //TO USE TEENSY INPUTS, UNCOMMENT THE FOLLOWING LINE AND COMMENT OUT keyPressed() AND keyReleased() functions
  readTeensy();
  switch (gameState) {
  case 0:
    //call to action sound
    introSound.play();
    callToActionScreen.loop();
    image(callToActionScreen, 0, 0);
    gameState = 1;
    break;

  case 1:
    //call to action
    image(callToActionScreen, 0, 0);
    break;

  case 2:
    //play begin sound
    callToActionScreen.stop();
    masterTimer = millis();
    beginSound.play();
    gameState = 11;
    break;

  case 11:
    //prepare for gameplay
    //background.loop();
    gameState = 3;
    break;

  case 3:
    //gameplay
    image(staticBackground, 0, 0);
    // Display, cycle, and move all the animation objects
    fighter.decideAction(inputs);
    fighter.move();
    fighter.next();
    fighter.display();
    fighter.comboCheck();
    image(playerOverlay, 0, 0);
    image(comboBar[fighter.comboMeterNum], 0, 0);
    //timer
    int currTime = 20 - (millis() - masterTimer)/1000;
    text("TIMER: " + currTime, 1300, 100);
    if (currTime <= 0) {
      gameState = 7;
    }
    break;

  case 4:
    //winning combo
    image(staticBackground, 0, 0);
    noStroke();
    fill(0, bgDimmer);
    bgDimmer += 5;
    rect(0, 0, width, height);
    fighter.move();
    fighter.next();
    fighter.display();
    fighter.comboDone();
    image(playerOverlay, 0, 0);
    break;

  case 5:
    //victory sound
    int tmp = (int)random(0, 4);
    winSound[tmp].play();
    winScreen.play();
    image(winScreen, 0, 0);
    gameState = 6;
    break;

  case 6:
    //victory screen
    image(winScreen, 0, 0);
    if (winScreen.time() >= winScreen.duration()) {
      gameState = 9;
      winScreen.jump(0);
      winScreen.stop();
    }
    break;

  case 7:
    //failure sound
    resetSound.play();
    resetScreen.play();
    image(resetScreen, 0, 0);
    gameState = 8;
    break;

  case 8:
    //failure screen
    image(resetScreen, 0, 0);
    if (resetScreen.time() >= resetScreen.duration()) {
      resetScreen.jump(0);
      resetScreen.stop();
      gameState = 10;
    }
    break;

  case 10:
    noStroke();
    fill(0, bgDimmer);
    bgDimmer += 3;
    rect(0, 0, width, height);
    if (bgDimmer >= 255) {
      gameState = 9;
    }
    break;

  case 9:
    //resetting
    playWinSound = false;
    bgDimmer = 0;
    gameState = 0;
    break;
  }
}
