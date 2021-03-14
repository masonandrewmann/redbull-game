// Daniel Shiffman //<>//
// Hanukkah 2011
// 8 nights of Processing examples
// http://www.shiffman.net
import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
String[] list;

int inputs[] = {0, 0, 0, 0, 0, 0}; //button inputs from arduino

Fighter fighter;    //our fighter
PImage bg;          //background image
PImage winner;  //foreground image
PImage walkMaster;  //image containing all walk animation frames
PImage idleMaster;  //image containing all idle animation frames

//image arrays for all animations
PImage[] idle = new PImage[4];
PImage[] walkLeft = new PImage[4];
PImage[] walkRight = new PImage[4];
PImage[] punchOne = new PImage[1];
PImage[] punchTwo = new PImage[1];
PImage[] kickOne = new PImage[1];
PImage[] kickTwo = new PImage[1];
PImage[] jump = new PImage[1];
PImage[] crouch = new PImage[1];

//array of all animations arrays for our fighter
PImage[][] animations = new PImage[9][];

// value to scale all images by because they're tiny
int scaleVal = 10;

// combo counter
int combo = 0;
boolean comboSent = false;
int comboSigTime = 0;
int comboSigTimeout = 3000;

void setup() {
  size(1000, 1000);
  frameRate(40);

  // create image array for idle
  idleMaster = loadImage("Character/IDLE/SMS_Ranger_Idle_2_strip4.png");
  for (int i = 0; i < idle.length; i++){
    idle[i] = createImage(idleMaster.width / 4, idleMaster.height, ARGB);
    idle[i].copy(idleMaster, i * idleMaster.width / 4, 0, idleMaster.width / 4, idleMaster.height, 0, 0, idleMaster.width / 4, idleMaster.height);
    idle[i].resize(idle[i].width * scaleVal, idle[i].height * scaleVal);
  }
 
  
  //create image array for walkRight
  walkMaster = loadImage("Character/RIGHT/SMS_Ranger_Walk_2_strip4.png");
  for (int i = 0; i < walkRight.length; i++){
    walkRight[i] = createImage(walkMaster.width / 4, walkMaster.height, ARGB);
    walkRight[i].copy(walkMaster, i * walkMaster.width / 4, 0, walkMaster.width / 4, walkMaster.height, 0, 0, walkMaster.width / 4, walkMaster.height);
    walkRight[i].resize(walkRight[i].width * scaleVal, walkRight[i].height * scaleVal);
  }
  //create image array for walkLeft
  for (int i = 0; i < walkLeft.length; i++){
    walkLeft[i] = createImage(walkRight[i].width, walkRight[i].height, ARGB);
    for(int j = 0 ; j < walkRight[i].width; j++){       
      for(int k = 0; k < walkRight[i].height; k++){
        walkLeft[i].set(walkRight[i].width - 1 - j, k, walkRight[i].get(j, k));
      }
    }
  }
  //create image array for kickOne
  kickOne[0] = loadImage("Character/KICK1/SMS_Ranger_Kick_2.png");
  for(int i = 0; i < kickOne.length; i++){
    kickOne[i].resize(kickOne[i].width * scaleVal, kickOne[i].height * scaleVal);
  }
  
  //create image array for punchOne
  punchOne[0] = loadImage("Character/PUNCH1/PUNCH1.png");
  for(int i = 0; i < punchOne.length; i++){
    punchOne[i].resize(punchOne[i].width * scaleVal, punchOne[i].height * scaleVal);
  }
  
  //create image array for crouch
  crouch[0] = loadImage("Character/DOWN/SMS_Ranger_Get_Up.png");
    for(int i = 0; i < crouch.length; i++){
    crouch[i].resize(crouch[i].width * scaleVal, crouch[i].height * scaleVal);
  }
  

  //set up animations array for fighter
  animations[0] = idle;
  animations[1] = walkLeft;
  animations[2] = walkRight;
  animations[3] = punchOne;
  animations[4] = punchTwo;
  animations[5] = kickOne;
  animations[6] = kickTwo;
  animations[7] = jump;
  animations[8] = crouch;
  
  // Make Fighter object
  fighter = new Fighter(animations, 100, 500);
  
  //define other visual assets
  bg = loadImage("Background/background.png");
  bg.resize(width, height);
  winner = loadImage("Foreground/winner.png");
  
  //initialize serial comm
  String portName = Serial.list()[1]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}

void draw() {

  background(bg);

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
    fighter.comboCheck();
    if(fighter.comboState == 4 && !comboSent){
      myPort.clear();
      myPort.write("c");
      comboSent = true;
      comboSigTime = millis() + comboSigTimeout;
    }
    if (millis() > comboSigTime) comboSent = false;
     myPort.clear(); 
}
