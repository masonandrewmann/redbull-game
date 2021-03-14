import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 
import processing.serial.*; 

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
int inputs[] = {0, 0, 0, 0, 0, 0}; //button inputs from arduino

//assets
Fighter fighter;    //our fighter
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

//array of all animations arrays for our fighter
PImage[][] animations = new PImage[10][];


public void loadAssets(){
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
    kickLeft[i] = loadImage("2_LEFT_KICK/LEFT_KICK_FRAME_" + (i+1) + ".png");
    kickRight[i] = loadImage("2_RIGHT_KICK/RIGHT_KICK_FRAME_" + (i+1) + ".png");
    punchLeft[i] = loadImage("3_LEFT_PUNCH/LEFT_PUNCH_FRAME_" + (i+1) + ".png");
    punchRight[i] = loadImage("3_RIGHT_PUNCH/RIGHT_PUNCH_FRAME_" + (i+1) + ".png");
    jumpLeft[i] = loadImage("4_LEFT_JUMP/LEFT_JUMP_FRAME_" + (i+1) + ".png");
    jumpRight[i] = loadImage("4_RIGHT_JUMP/RIGHT_JUMP_FRAME_" + (i+1) + ".png");
  }
  for (int i = 0; i < 2; i++){
    idleLeft[i] = loadImage("5_LEFT_IDLE/LEFT_IDLE_FRAME_" + (i+1) + ".png");
    idleRight[i] = loadImage("5_RIGHT_IDLE/RIGHT_IDLE_FRAME_" + (i+1) + ".png");
  }
  for (int i = 0; i < 12; i++){
    winningMove1[i] = loadImage("6_WINNING_MOVE_1/PNG_FOLDER/WINNING_MOVE_1_FRAME_" + (i+1) + ".png");
    winningMove2[i] = loadImage("6_WINNING_MOVE_2/PNG_FOLDER/WINNING_MOVE_2_FRAME_" + (i+1) + ".png");
    winningMove3[i] = loadImage("6_WINNING_MOVE_3/PNG_FOLDER/WINNING_MOVE_3_FRAME_" + (i+1) + ".png");
  }
  for (int i = 0; i <13; i++){
        winningMove4[i] = loadImage("6_WINNING_MOVE_4/PNG_FOLDER/WINNING_MOVE_4_FRAME_" + (i+1) + ".png");
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

  // Make Fighter object
  fighter = new Fighter(animations, 100, 500);
}

public void movieEvent(Movie m) {
  m.read();
}

public void setup() {
  
  loadAssets();

  //initialize serial comm
  String portName = Serial.list()[1]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);

  background.loop();
}

public void draw(){
  image(background, 0, 0);
  fill(255);
  rect(300, 300, 300, 300);
    //read inputs from arduino
    if ( myPort.available() > 0)
      {  // If data is available,

          val = myPort.readStringUntil('\n');       // read it and store it in val
          //println(val);
          if (val != null){
            list = split(val, "a");
            for (int i = 0; i < list.length-1; i++){
              inputs[i] = Integer.parseInt(list[i]);
            }
            //println(inputs);
            //println("END PACKET");
          }
    }

  // Display, cycle, and move all the animation objects
    fighter.decideAction(inputs);
    fighter.move();
    fighter.next();
    fighter.display();
    // fighter.comboCheck();
    // if(fighter.comboState == 4 && !comboSent){
    //   myPort.clear();
    //   myPort.write("c");
    //   comboSent = true;
    //   comboSigTime = millis() + comboSigTimeout;
    // }
    // if (millis() > comboSigTime) comboSent = false;
    //  myPort.clear();
}
// Daniel Shiffman
// Hanukkah 2011
// 8 nights of Processing examples
// http://www.shiffman.net

// The animation object

class Animation {
  float x;  // location for Animation
  float y;  // location for Animation

  // The index into the array is a float!
  // This allows us to vary the speed of the animation
  // It will have to be converted to an int before the actual image is displayed
  float index = 0; 
  
  // Speed, this will control both the animations movement
  // as well as how fast it cycles through the images
  float speed;
  float frameSpeed;

  // The array of images
  PImage[] images;
  
  Animation(PImage[] images_, float x_, float y_) {
    images = images_;
    x = x_;
    y = y_;
    
    // A random speed
    speed = 5;
    frameSpeed = 0.2f;
    // Starting at the beginning
    index = 0;

  }

  public void display() {
    // We must convert the float index to an int first!
    int imageIndex = PApplet.parseInt(index);
    image(images[imageIndex], x, y);
  }

  public void move() {
    // Object only moves horizontally
    x += speed;
    if (x > width) {
      x = -images[0].width;
    }
  }

  public void next() {
    // Move the index forward in the animation sequence
    index += frameSpeed;
    // If we are at the end, go back to the beginning
    if (index >= images.length) {
      // We could just say index = 0
      // but this is slightly more accurate
      index -= images.length;
    } 
  }
}
// Daniel Shiffman
// Hanukkah 2011
// 8 nights of Processing examples
// http://www.shiffman.net

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

  float frameSpeed; //animation speed
  PImage[] currAnim; //animation to draw

  int comboState;
  float comboTimer;
  int comboTimeout;

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
    pos = new PVector(x_, y_);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    groundHeight = y_;
    mass = 30;

    frameSpeed = 0.2f;
    // Starting at the beginning
    index = 0;
    comboState = 0;
    comboTimer = 0;
    comboTimeout = 1000;
    currAnim = idleRight;
    punchRegistered = false;
    kickRegistered = false;
  }

  public void display() {
    // We must convert the float index to an int first!
    int imageIndex = PApplet.parseInt(index);
    image(currAnim[imageIndex], pos.x, pos.y);
  }

  public void move() {
    applyGrav();
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    if (pos.x > width) {
      pos.x = -currAnim[0].width;
    }
    if (pos.y > groundHeight) pos.y = groundHeight;
  }

  public void next() {
    // Move the index forward in the animation sequence
    index += frameSpeed;
    // If we are at the end, go back to the beginning
    if (index >= currAnim.length) {
      // We could just say index = 0
      // but this is slightly more accurate
      index -= currAnim.length;
    }
  }

  public void decideAction(int[] inputs){
    // inputs = [LEFT, RIGHT, UP, DOWN, PUNCH, KICK]
    int left = inputs[0];
    int right = inputs[1];
    int up = inputs[2];
    int down = inputs[3];
    int punch = inputs[4];
    int kick = inputs[5];

    //movement
    if (left == 1){
      vel.x = -8;
      currAnim = walkLeft;
      //index = 0;
    } else if (right == 1){
      vel.x = 8;
      currAnim = walkRight;
      //index = 0;
    } else {
      vel.x = 0;
      currAnim = idleRight;
      //index = 0;
    }

    //action
    if (punch == 1){
      currAnim = punchRight;
      index = 0;
    } else if (kick == 1){
      currAnim = kickRight;
      index = 0;
    } else if (down == 1){
      currAnim = idleRight;
      acc.x = acc.x - vel.x/2;
      index = 0;
    } else if (up == 1){
      currAnim = idleRight;
      if (pos.y == groundHeight) vel.y = -30;
    }

    //reset action variables
    if (punch == 0 && punchRegistered) punchRegistered = false;
    if (kick == 0 && kickRegistered) kickRegistered = false;
  }

  public void applyGrav(){
    PVector gravity = new PVector(0, 0.1f * mass);
    //PVector f = PVector.div(gravity, mass);
    acc.add(gravity);
  }

  public void comboCheck(){
    if(comboState == 4){
      text("COMBO COMPLETED", 10, 100);
    } else {
      text("State", 10, 100);
    }
    switch(comboState){
      case 0: //starting state
        if(inputs[4] == 1 && !punchRegistered){
          comboState = 1;
          comboTimer = millis() + comboTimeout;
          punchRegistered = true;
        }
        textSize(100);
        //text("State 0", 10, 100);
      break;

      case 1: //p
        if (millis() > comboTimer){
          comboState = 0;
        } else if (inputs[4] == 1 && !punchRegistered){
          comboState = 1;
          comboTimer = millis() + comboTimeout;
          punchRegistered = true;
        } else if (inputs[5] == 1 && !kickRegistered){
          comboState = 2;
          comboTimer = millis() + comboTimeout;
          kickRegistered = true;
        }
        textSize(100);
        //text("State 1", 10, 100);
      break;

      case 2: //pk
        if (millis() > comboTimer){
          comboState = 0;
        } else if (inputs[4] == 1 && !punchRegistered){
          comboState = 1;
          comboTimer = millis() + comboTimeout;
          punchRegistered = true;
        } else if (inputs[5] == 1 && !kickRegistered){
          comboState = 3;
          comboTimer = millis() + comboTimeout;
          kickRegistered = true;
        }
        textSize(100);
        //text("State 2", 10, 100);
      break;

      case 3: //pkk
        if (millis() > comboTimer){
          comboState = 0;
        } else if (inputs[4] == 1 && !punchRegistered){
          comboState = 4;
          comboTimer = millis() + comboTimeout;
          punchRegistered = true;
        } else if (inputs[5] == 1 && !kickRegistered){
          comboState = 0;
          comboTimer = millis() + comboTimeout;
          kickRegistered = true;
        }
        textSize(100);
        //text("State 3", 10, 100);
      break;

      case 4: //pkkp COMBO COMPLETED!
        textSize(100);
        //text("COMBO COMPLETED", 10, 100);
        // image(winner, 100, 100);
        if (millis() > comboTimer + 2000){
          comboState = 0;
        }
      break;
    }
  }
}
  public void settings() {  size(1920, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "redbull_master" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
