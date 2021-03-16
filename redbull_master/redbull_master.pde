import processing.video.*;
import processing.serial.*;

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
PImage[] comboBar = new PImage[11];

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
PImage[][] animations = new PImage[14][];

//keeping track of what part of the game we're in
int gameState = 0; //0 = call to action; 1 = gameplay; 2 = win; 3 = try again;

float bgDimmer = 0;


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

  playerOverlay = loadImage("0_GRAPHICS/PLAYER_1_FANG/PLAYER_1_FANG.png");

  for (int i = 0; i <11; i++){
        comboBar[i] = loadImage("0_GRAPHICS/COMBO_BAR/COMBO_BAR_FRAME_" + (i+1) + ".png");
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

void keyPressed(){
  if (gameState == 0){
    gameState = 1;
  }

  if (key == 'z'){
    println("punch");
    inputs[4] = 1;
  } else if (key == 'x'){
    inputs[5] = 1;
    println("kick");
  }
  if (key == CODED) {
    if (keyCode == LEFT){
      inputs[0] = 1;
    }
    if (keyCode == RIGHT){
      inputs[1] = 1;
    }
    if (keyCode == UP){
      inputs[2] = 1;
    }
    if (keyCode == DOWN){
      inputs[3] = 1;
    }
  }
}

void keyReleased(){
    if (key == 'z'){
    println("punch");
    inputs[4] = 0;
    fighter.punchAllow = true;
    fighter.punching = false;
  } else if (key == 'x'){
    inputs[5] = 0;
    println("kick");
    fighter.kickAllow = true;
    fighter.kicking = false;
  }

  if (key == CODED) {
    if (keyCode == LEFT){
      inputs[0] = 0;
    }
    if (keyCode == RIGHT){
      inputs[1] = 0;
    }
    if (keyCode == UP){
      inputs[2] = 0;
    }
    if (keyCode == DOWN){
      inputs[3] = 0;
    }
  }
}

void setup() {
  size(1920, 1080);
  loadAssets();

  //initialize serial comm
  String portName = Serial.list()[1]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);

  background.loop();
  callToActionScreen.loop();
}

void draw(){
  switch (gameState){
    case 0:
      image(callToActionScreen, 0, 0);
    break;

    case 1:
      image(background, 0, 0);
      // Display, cycle, and move all the animation objects
      fighter.decideAction(inputs);
      fighter.move();
      fighter.next();
      fighter.display();
      fighter.comboCheck();
      image(playerOverlay, 0, 0);
      image(comboBar[fighter.comboMeterNum], 0, 0);
      break;

    case 2:
      image(background, 0, 0);
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

    case 3:
    winScreen.play();
    image(winScreen, 0, 0);
    if(winScreen.time() >= winScreen.duration()){
      gameState = 0;
      winScreen.jump(0);
      winScreen.stop();
    }
    bgDimmer = 0;
    break;

  }


    //read inputs from arduino
    // if ( myPort.available() > 0)
    //   {  // If data is available,

    //       val = myPort.readStringUntil('\n');       // read it and store it in val
    //       //println(val);
    //       if (val != null){
    //         list = split(val, "a");
    //         for (int i = 0; i < list.length-1; i++){
    //           inputs[i] = Integer.parseInt(list[i]);
    //         }
    //         //println(inputs);
    //         //println("END PACKET");
    //       }
    // }

    // if(fighter.comboState == 4 && !comboSent){
    //   myPort.clear();
    //   myPort.write("c");
    //   comboSent = true;
    //   comboSigTime = millis() + comboSigTimeout;
    // }
    // if (millis() > comboSigTime) comboSent = false;
    //  myPort.clear();
}
