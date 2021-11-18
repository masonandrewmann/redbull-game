// this is the redbull arcade machine microcontroller code
// made in spring 2021

#define LEFTPIN 10
#define RIGHTPIN 9
#define UPPIN 12
#define DOWNPIN 11
#define TOP1 8
#define TOP2 7
#define TOP3 6
#define BOTTOM1 5
#define BOTTOM2 4
#define BOTTOM3 3
#define RESETPIN 2
#define RELAYPIN 15
#define LEDPIN 13
int left;
int right;
int up;
int down;
int top1;
int top2;
int top3;
int bottom1;
int bottom2;
int bottom3;
int resetbutton;



int incomingByte = 0;

int interval = 50;
int targetTime = 0;

byte inputPins[] = {LEFTPIN, RIGHTPIN, UPPIN, DOWNPIN, TOP1, TOP2, TOP3, BOTTOM1, BOTTOM2, BOTTOM3, RESETPIN};
//int inputsRead[] = {left, right, up, down, top1, top2, top3, bottom1, bottom2, bottom3, resetbutton};
bool inputsRead[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int inputsRaw[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
//output to processing: {left(0) right(1) up(2) down(3) kick(4) punch(5) reset(6)}
int inputs[] = {1, 1, 1, 1, 1, 1, 1};
unsigned int timethrottle = 50;
unsigned int time_del = 1;

void setup() {
  //initialize serial communications at a 9600 baud rate
  Serial.begin(115200);
  //initialize input pins
  for (int i = 0; i < 11; i++) {
    pinMode(inputPins[i], INPUT_PULLUP);
  }
  pinMode(RELAYPIN, OUTPUT);
  pinMode(LEDPIN, OUTPUT);
}


void loop() {
  digitalWrite(LEDPIN, LOW);
  if (Serial.available() > 0) {
    incomingByte = Serial.read();
    digitalWrite(LEDPIN, HIGH);
    if (incomingByte == 'c') {
      Serial.println(incomingByte);
      digitalWrite(RELAYPIN, HIGH);
      delay(1000);
      digitalWrite(RELAYPIN, LOW);
    }
  }

  if( millis() > timethrottle){
    //read inputs
    for (int i = 0; i < 11; i++) {
      inputsRead[i] = digitalRead(inputPins[i]);
      //    Serial.print("array  : ");
      //    Serial.print(inputsRead[0]);
      //    Serial.print("left variable: ");
      //    Serial.print(left);
      if (inputsRead[0] == 0) inputs[0] = 1; else inputs[0] = 0; // left
      if (inputsRead[1] == 0) inputs[1] = 1; else inputs[1] = 0; // right
      // i dont want to take the time to figure how to do this with pointers and variable names so i am doing it in a raw undreadable fashion
      //int inputsRead[] = {left(0), right(1), up(2), down(3), top1(4), top2(5), top3(6), bottom1(7), bottom2(8), bottom3(9), resetbutton(10)};
      //    goal: if (up || top1 || bottom1 == 0) inputs[2] = 1; else inputs[2] = 0;
      if ( !(!(inputsRead[2]) || !(inputsRead[4]) || !(inputsRead[7])) == 0) inputs[2] = 1; else inputs[2] = 0; // having to do my own logical XOR cause all inputs default to 1
      if (inputsRead[3] == 0) inputs[3] = 1; else inputs[3] = 0; //down
  
      //    if (top2 || top3 == 0) inputs[2] = 1; else inputs[3] = 0;
      if ( !(!(inputsRead[5]) || !(inputsRead[6]) ) == 0) inputs[4] = 1; else inputs[4] = 0; // kick
      //    if (bottom2 || bottom3 == 0) inputs[2] = 1; else inputs[3] = 0;
      if ( !(!(inputsRead[8]) || !(inputsRead[9]) ) == 0) inputs[5] = 1; else inputs[5] = 0; // punch
      if (inputsRead[10] == 0) inputs[6] = 1; else inputs[6] = 0; //reset
  
      if (inputsRaw[i] == 1) inputsRaw[i] = 0; // flipping the bit
      else if (inputsRaw[i] == 0) inputsRaw[i] = 1; // flipping the bit
    }
    
    //send inputs
    if (millis() > targetTime)
      //    for (int i = 0; i < 11; i++) {
      //      Serial.print(inputsRead[i]);
      //      Serial.print("a");
      //    }
      //  Serial.print("filtered inputs");
      for (int i = 0; i < 7; i++) {
        Serial.print(inputs[i]);
        Serial.print("a");
      }
  
    // end byte
//    Serial.print("\n");
    Serial.print('k');
    timethrottle = millis() + time_del;
  }


  //wait 50 milliseconds so we don't drive ourselves crazy
  delay(50);
}
