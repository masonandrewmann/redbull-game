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

  float xOffset = width / 3; //offset the combos because they aren't centered
  int comboReady; //0 for no combo, 1-4 for combos 1-4 respectively
  boolean attacking;

  float frameSpeed; //animation speed
  PImage[] currAnim; //animation to draw

  int comboState;
  float comboTimer;
  int comboTimeout;

  boolean direction; //direction facing: true is right, false is left

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
    mass = 10;

    frameSpeed = 0.2;
    // Starting at the beginning
    index = 0;
    comboState = 0;
    comboTimer = 0;
    comboTimeout = 1000;
    comboReady = 0;
    attacking = false;
    currAnim = idleRight;
    punchRegistered = false;
    kickRegistered = false;
    direction = true;
  }

  void display() {
    // We must convert the float index to an int first!
    int imageIndex = int(index);
    // println("hi");
    // println(currAnim);
    // println(currAnim.length);
    // println(index);
    // println(imageIndex);
    // println("done");
    if (comboReady == 0){
      image(currAnim[imageIndex], pos.x, pos.y);
    } else {
      image(currAnim[imageIndex], pos.x + xOffset, pos.y);
    }

  }

  void move() {
    applyGrav();
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    if (pos.x > width) {
      pos.x = -currAnim[0].width;
    }
    if (pos.y > groundHeight) pos.y = groundHeight;
  }

  void next() {
    // Move the index forward in the animation sequence
    index += frameSpeed;
    // If we are at the end, go back to the beginning
    // println("next");
    // println(index);
    // println(currAnim.length);
    // println("nextDone");


    if (index >= currAnim.length) {
      if (attacking){
        attacking = false;
      }
      // We could just say index = 0
      // but this is slightly more accurate
      // index -= currAnim.length;
      index = 0;
    }
  }

  void decideAction(int[] inputs){
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
        vel.x = -8;
        currAnim = walkLeft;
        direction = false;
        // index = 0;
      } else if (right == 1){
        vel.x = 8;
        currAnim = walkRight;
        direction = true;
        //index = 0;
      } else {
        vel.x = 0;
        if(direction){
          currAnim = idleRight;
        } else {
          currAnim = idleLeft;
        }
        //index = 0;
      }

      if (up == 1){
      if (direction){
        currAnim = jumpRight;
      } else {
        currAnim = jumpLeft;
      }
      // index = 0;

      if (pos.y == groundHeight) vel.y = -16;
    }

    if (pos.y < groundHeight){
      if (direction){
        currAnim = jumpRight;
      } else {
        currAnim = jumpLeft;
      }
    }
    }


    //action
    if (punch == 1){
      attacking = true;
      if (direction){
        currAnim = punchRight;
      } else {
        currAnim = punchLeft;
      }
      // index = 0;
    } else if (kick == 1){
      attacking = true;
      if (direction){
        currAnim = kickRight;
      } else {
        currAnim = kickLeft;
      }
    }


    // //reset action variables
    if (punch == 0 && punchRegistered) punchRegistered = false;
    if (kick == 0 && kickRegistered) kickRegistered = false;
  }

  void applyGrav(){
    PVector gravity = new PVector(0, 0.1 * mass);
    //PVector f = PVector.div(gravity, mass);
    acc.add(gravity);
  }

  void comboCheck(){
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
        text("State 0", 10, 100);
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
        text("State 1: p", 10, 100);
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
        text("State 2: pk", 10, 100);
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
        text("State 3: pkk", 10, 100);
      break;

      case 4: //pkkp COMBO COMPLETED!
        textSize(100);
        text("COMBO COMPLETED: pkkp", 10, 100);
        gameState = 2;
        currAnim = combo1;
        // image(winner, 100, 100);
        comboReady = 1;
        if (millis() > comboTimer + 2000){
          comboState = 0;
        }
      break;
    }
  }

  void comboDone(){
    if (index == 0){
      gameState = 3;
      comboReady = 0;
    }
  }
}
