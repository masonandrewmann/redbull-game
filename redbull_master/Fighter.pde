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

    frameSpeed = 0.8;
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
  void display() {
    // We must convert the float index to an int first!
    int imageIndex = int(index);
    if (comboReady == 0){
      image(currAnim[imageIndex], pos.x + 400, pos.y + 200);
    } else {
      image(currAnim[imageIndex], 0, 0);
    }

  }

//move our fighter around the screen
  void move() {
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
  void next() {
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
  void applyGrav(){
    PVector gravity = new PVector(0, 0.1 * mass);
    //PVector f = PVector.div(gravity, mass);
    acc.add(gravity);
  }

//check if we've done a combo
  void comboCheck(){

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
    fill(0);
    textSize(100);
    text(comboStream, 1000, 200);

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


  void comboDone(){
    if (index >= 11){
      gameState = 5;
      comboReady = 0;
      comboState1 = 0;
    }
  }
}
