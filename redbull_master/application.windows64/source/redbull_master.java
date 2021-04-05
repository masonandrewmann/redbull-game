import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 
import processing.serial.*; 
import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class redbull_master extends PApplet {






//fetching input data from microcontroller
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
String[] list;
int inputs[] = {0, 0, 0, 0, 0, 0, 0}; //button inputs from arduino
int prevInputs[] = {0, 0, 0, 0, 0, 0, 0}; // left, right, up, down, punch, kick, reset
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

int timeLimit = 40; //seconds allowed





public void loadAssets() {
  //load the MP4s
  //background = new Movie(this, "0_BACKGROUND/BACKGROUND.mp4");
  callToActionScreen = new Movie(this, "0_CALL_TO_ACTION_SCREEN/CALL_TO_ACTION_SCREEN.mov");
  resetScreen = new Movie(this, "0_TRY_AGAIN_SCREEN/TRY_AGAIN_SCREEN.mov");
  winScreen = new Movie(this, "0_WIN_SCREEN/WIN_SCREEN.mov");
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
  bgMusic.amp(0.3f);
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

public void movieEvent(Movie m) {
  m.read();
}

//void keyPressed() {
//  if (gameState == 1) {
//    gameState = 2;
//  }

//  if (key == 'z') {
//    println("punch");
//    inputs[4] = 1;
//  } else if (key == 'x') {
//    inputs[5] = 1;
//    println("kick");
//  } else if (key == 'r') {
//    gameState = 7;
//  }
//  if (key == CODED) {
//    if (keyCode == LEFT) {
//      inputs[0] = 1;
//    }
//    if (keyCode == RIGHT) {
//      inputs[1] = 1;
//    }
//    if (keyCode == UP) {
//      inputs[2] = 1;
//    }
//    if (keyCode == DOWN) {
//      inputs[3] = 1;
//    }
//  }
//}

//void keyReleased() {
//  if (key == 'z') {
//    println("punch");
//    inputs[4] = 0;
//    fighter.punchAllow = true;
//    fighter.punching = false;
//  } else if (key == 'x') {
//    inputs[5] = 0;
//    println("kick");
//    fighter.kickAllow = true;
//    fighter.kicking = false;
//  }

//  if (key == CODED) {
//    if (keyCode == LEFT) {
//      inputs[0] = 0;
//      fighter.inputsAllow[0] = true;
//    }
//    if (keyCode == RIGHT) {
//      inputs[1] = 0;
//      fighter.inputsAllow[1] = true;
//    }
//    if (keyCode == UP) {
//      inputs[2] = 0;
//      fighter.inputsAllow[2] = true;
//      fighter.jumpAllow = true;
//    }
//    if (keyCode == DOWN) {
//      inputs[3] = 0;
//      fighter.inputsAllow[3] = true;
//    }
//  }
//}

public void readTeensy() {
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
  for (int i = 0; i < 7; i++) {
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
public void teensyKeyPressed(int code) {
  if (gameState == 1) {
    gameState = 2;
  }

  //reset button pressed
  if (code == 6) {
    gameState = 0;
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
public void teensyKeyReleased(int code) {
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
    fighter.jumpAllow = true;
  } else if (code == 3) {
    inputs[3] = 0;
    fighter.inputsAllow[3] = true;
  }
}

public void setup() {
  
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


  bgMusic.loop();
  masterTimer = millis();
}

public void draw() {
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
    int currTime = timeLimit - (millis() - masterTimer)/1000;
    fill(255);
    textSize(100);
    text(currTime, 625, 115);
    fill(0);
    text(currTime, 627, 117);
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
    if (winScreen.time()+.05f >= winScreen.duration()) {
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
    if (resetScreen.time()+.05f >= resetScreen.duration()) {
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

// The animation object

class Fighter {
  PVector pos;      //position of fighter
  PVector vel;      //velocity of fighter
  PVector acc;      //acceleration of fighter
  int mass;         //mass of fighter

  float groundHeight; // y value for ground

  // The index into the array is a float!
  // This allows us to vary the speed of the animation
  // It will have to be converted to an int before the actual image is displayed
  float index;

  float xOffset = width / 3; //offset the combos because they aren't centered
  int comboReady; //0 for no combo, 1-4 for combos 1-4 respectively
  boolean attacking;

  float frameSpeed; //animation speed
  PImage[] currAnim; //animation to draw

  int comboState1;
  float comboTimer;
  int comboTimeout;
  boolean attackTimeout;
  boolean[] inputsAllow = {false, false, false, false, false, false};
  boolean kickAllow;
  boolean punchAllow;
  boolean jumpAllow;
  boolean punching;
  boolean kicking;
  boolean playWinSound;
  String comboStream = "xxxxxx";
  int comboMeterNum;

  boolean facingRight; //facingRight facing: true is right, false is left

  //action state variables
  boolean punchRegistered;
  boolean kickRegistered;

  // The array of images
  PImage[] idleLeft;
  PImage[] idleRight;
  PImage[] walkLeft;
  PImage[] walkRight;
  PImage[] punchLeft;
  PImage[] punchRight;
  PImage[] kickLeft;
  PImage[] kickRight;
  PImage[] jumpLeft;
  PImage[] jumpRight;
  PImage[] combo1;
  PImage[] combo2;
  PImage[] combo3;
  PImage[] combo4;


  Fighter(PImage[][] animations, float x_, float y_) {
    idleLeft = animations[0];
    idleRight = animations[1];
    walkLeft = animations[2];
    walkRight = animations[3];
    punchLeft = animations[4];
    punchRight = animations[5];
    kickLeft = animations[6];
    kickRight = animations[7];
    jumpLeft = animations[8];
    jumpRight = animations[9];
    combo1 = animations[10];
    combo2 = animations[11];
    combo3 = animations[12];
    combo4 = animations[13];
    pos = new PVector(x_, y_);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    groundHeight = y_ - 50;
    mass = 60;

    frameSpeed = 0.8f;
    // Starting at the beginning
    index = 0;
    comboState1 = 0;
    comboTimer = 0;
    comboTimeout = 2000;
    comboReady = 0;
    attacking = false;
    currAnim = idleRight;
    punchRegistered = false;
    kickRegistered = false;
    facingRight = true;
    attackTimeout = false;
    punchAllow = true;
    kickAllow = true;
    jumpAllow = true;
    punching = false;
    kicking = false;
    comboMeterNum = 0;
    // for int
  }

// draw our fighter on the screen
  public void display() {
    // We must convert the float index to an int first!
    int imageIndex = PApplet.parseInt(index);
    if (comboReady == 0){
      image(currAnim[imageIndex], pos.x + 400, pos.y + 200);
    } else {
      image(currAnim[imageIndex], 0, 0);
    }

  }

//move our fighter around the screen
  public void move() {
    applyGrav();
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    if (pos.x > width/2) {
      pos.x = width/2;
    } else if (pos.x < -width/2){
      pos.x = -width/2;
    }
    if (pos.y > groundHeight) pos.y = groundHeight;
  }

//cycle through our fighter's animation
  public void next() {
    // Move the index forward in the animation sequence
    index += frameSpeed;
    // If we are at the end, go back to the beginning
    if (index >= currAnim.length) {
      if (attacking){
        if (punching){
          punchAllow = false;
        } else if (kicking){
          kickAllow = false;
        }
        if (facingRight){
          currAnim = idleRight;
        } else {
          currAnim = idleLeft;
        }
        attacking = false;
        attackTimeout = false;

      }
      // We could just say index = 0
      // but this is slightly more accurate
      // index -= currAnim.length;
      index = 0;
    }
  }

//look at input array and decide what our fighter should be doing
  public void decideAction(int[] inputs){
    // inputs = [LEFT, RIGHT, UP, DOWN, PUNCH, KICK]
    int left = inputs[0];
    int right = inputs[1];
    int up = inputs[2];
    int down = inputs[3];
    int punch = inputs[4];
    int kick = inputs[5];

    if (!attacking){
      //movement
      if (left == 1){
        vel.x = -30;
        //enter walking state if not in the air
        if (pos.y >= groundHeight){
          if (currAnim != walkLeft) index = 0;
          currAnim = walkLeft;
          facingRight = false;
        }
        // index = 0;
      } else if (right == 1){
        vel.x = 30;
        //enter walking state if not in the air
        if (pos.y >= groundHeight){
          if (currAnim != walkRight) index = 0;
          currAnim = walkRight;
          facingRight = true;
        }
        //index = 0;
      } else {
        vel.x = 0;
        if(facingRight){
          // if (currAnim != idleRight) index = 0;
          currAnim = idleRight;
        } else {
          // if (currAnim != idleLeft) index = 0;
          currAnim = idleLeft;
        }
        //index = 0;
      }

      if (up == 1 && jumpAllow){
        if (facingRight){
          // if (currAnim != jumpRight) index = 0;
          currAnim = jumpRight;
          jumpAllow = false;
        } else {
          // if (currAnim != jumpLeft) index = 0;
          currAnim = jumpLeft;
          jumpAllow = false;
        }
        // index = 0;

        if (pos.y == groundHeight) vel.y = -25;
    }

    if (pos.y < groundHeight){
      if (facingRight){
        // if (currAnim != jumpRight) index = 0;
        currAnim = jumpRight;
      } else {
        // if (currAnim != jumpLeft) index = 0;
        currAnim = jumpLeft;
      }
    }
    }


    //action
    if (punch == 1 && !attacking && punchAllow){
      if (!attacking){
        punchSound.play();
      }
      attacking = true;
      punching = true;
      if (facingRight){
        if (currAnim != punchRight) index = 0;
        currAnim = punchRight;
      } else {
        if (currAnim != punchLeft) index = 0;
        currAnim = punchLeft;
      }
      // index = 0;
    } else if (kick == 1 && !attacking && kickAllow){
      if (!kicking){
        kickSound.play();
      }
      attacking = true;
      kicking = true;
      if (facingRight){
        if (currAnim != kickRight) index = 0;
        currAnim = kickRight;
      } else {
        if (currAnim != kickLeft) index = 0;
        currAnim = kickLeft;
      }
    }


    // //reset action variables
    if (punch == 0 && punchRegistered) punchRegistered = false;
    if (kick == 0 && kickRegistered) kickRegistered = false;
  }

//apply gravity to our fighter
  public void applyGrav(){
    PVector gravity = new PVector(0, 0.1f * mass);
    //PVector f = PVector.div(gravity, mass);
    acc.add(gravity);
  }

//check if we've done a combo
  public void comboCheck(){

    //update the input string
    if (inputs[4] == 1 && !punchRegistered && !attackTimeout){
      //add punch to combo string
      comboStream = comboStream.substring(1, 6) + "p";
      punchRegistered = true;
      attackTimeout = true;
      comboTimer = millis() + comboTimeout;
    } else if (inputs[5] == 1 && !kickRegistered && !attackTimeout){
      //add kick to combo string
      comboStream = comboStream.substring(1, 6) + "k";
      kickRegistered = true;
      attackTimeout = true;
      comboTimer = millis() + comboTimeout;
    } else if(inputs[0] == 1 && inputsAllow[0]){
      //add left to combo string
      comboStream = comboStream.substring(1, 6) + "l";
      comboTimer = millis() + comboTimeout;
      inputsAllow[0] = false;
    } else if(inputs[1] == 1 && inputsAllow[1]){
      //add right to combo string
      comboStream = comboStream.substring(1, 6) + "r";
      comboTimer = millis() + comboTimeout;
      inputsAllow[1] = false;
    } else if(inputs[2] == 1 && inputsAllow[2]){
      //add up to combo string
      comboStream = comboStream.substring(1, 6) + "u";
      comboTimer = millis() + comboTimeout;
      inputsAllow[2] = false;
    } else if(inputs[3] == 1 && inputsAllow[3]){
      //add down to combo string
      comboStream = comboStream.substring(1, 6) + "d";
      comboTimer = millis() + comboTimeout;
      inputsAllow[3] = false;
    }
    //display the combo stream for debugging
    //fill(0);
    //textSize(100);
    //text(comboStream, 1000, 200);

    comboMeterNum = 0;
    //calculate the combo meter value
    for (int i = 0; i < comboStream.length(); i++){
      if (comboStream.charAt(i) == 'p' || comboStream.charAt(i) == 'k'){
           comboMeterNum++;
      }
    }
      comboMeterNum *= 2;
      if (comboMeterNum > 9){
        comboMeterNum = 9;
      }
    //reset if the combo timer runs out
    if (millis() > comboTimer){
      comboStream = "xxxxxx";
    }

    if(comboStream.substring(3, 6).equals("drp")){
      //Tekken Yoshimitsu Soul Stealer QCF + P: DRP
        //textSize(100);
        //text("One: COMBO COMPLETED: drpss", 10, 100);
        gameState = 4;
        currAnim = combo1;
        //background.stop();
        // image(winner, 100, 100);
        comboReady = 1;
    } else if (comboStream.substring(3, 6).equals("rrk")){
      //Tekken 7 Eddy Combo FF+4: ffk
        //textSize(100);
        //text("Two: COMBO COMPLETED: ffk", 10, 100);
        gameState = 4;
        currAnim = combo2;
        //background.stop();
        comboReady = 2;
    } else if (comboStream.substring(0, 6).equals("ldrkkp")){
      //soul calibur type combo
        //textSize(100);
        //text("Three: COMBO COMPLETED: ldrkkp", 10, 100);
        gameState = 4;
        currAnim = combo3;
        //background.stop();
        comboReady = 3;
    } else if (comboStream.substring(0, 6).equals("lrpukp")){
      // the devtron rhubarb special
        //textSize(100);
        //text("Four: COMBO COMPLETED: lrpukp", 10, 100);
        gameState = 4;
        currAnim = combo4;
        //background.stop();
        comboReady = 4;
    }

    //COMBO 1
    // switch(comboState1){
    //   case 0: //starting state
    //     if(inputs[4] == 1 && !punchRegistered && !attackTimeout){
    //       comboState1 = 1;
    //       comboTimer = millis() + comboTimeout;
    //       punchRegistered = true;
    //       attackTimeout = true;
    //     }
    //     textSize(100);
    //     text("One: State 0", 10, 100);
    //   break;

    //   case 1: //p
    //     if (millis() > comboTimer){
    //       comboState1 = 0;
    //     } else if (inputs[4] == 1 && !punchRegistered && !attackTimeout){
    //       comboState1 = 1;
    //       comboTimer = millis() + comboTimeout;
    //       punchRegistered = true;
    //       attackTimeout = true;
    //     } else if (inputs[5] == 1 && !kickRegistered && !attackTimeout){
    //       comboState1 = 2;
    //       comboTimer = millis() + comboTimeout;
    //       kickRegistered = true;
    //       attackTimeout = true;
    //     }
    //     textSize(100);
    //     text("One: State 1: p", 10, 100);
    //   break;

    //   case 2: //pk
    //     if (millis() > comboTimer){
    //       comboState1 = 0;
    //     } else if (inputs[4] == 1 && !punchRegistered && !attackTimeout){
    //       comboState1 = 1;
    //       comboTimer = millis() + comboTimeout;
    //       punchRegistered = true;
    //       attackTimeout = true;
    //     } else if (inputs[5] == 1 && !kickRegistered && !attackTimeout){
    //       comboState1 = 3;
    //       comboTimer = millis() + comboTimeout;
    //       kickRegistered = true;
    //       attackTimeout = true;
    //     }
    //     textSize(100);
    //     text("One: State 2: pk", 10, 100);
    //   break;

    //   case 3: //pkk
    //     if (millis() > comboTimer){
    //       comboState1 = 0;
    //     } else if (inputs[4] == 1 && !punchRegistered && !attackTimeout){
    //       comboState1 = 4;
    //       comboTimer = millis() + comboTimeout;
    //       punchRegistered = true;
    //     } else if (inputs[5] == 1 && !kickRegistered && !attackTimeout){
    //       comboState1 = 0;
    //       comboTimer = millis() + comboTimeout;
    //       kickRegistered = true;
    //     }
    //     textSize(100);
    //     text("One: State 3: pkk", 10, 100);
    //   break;

    //   case 4: //pkkp COMBO COMPLETED!
    //     textSize(100);
    //     text("One: COMBO COMPLETED: pkkp", 10, 100);
    //     gameState = 2;
    //     currAnim = combo1;
    //     // image(winner, 100, 100);
    //     comboReady = 1;
    //     if (millis() > comboTimer + 2000){
    //       comboState1 = 0;
    //     }
    //   break;
    // }
  }


  public void comboDone(){
    if (index >= 11){
      gameState = 5;
      comboReady = 0;
      comboState1 = 0;
    }
  }
}
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "redbull_master" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}