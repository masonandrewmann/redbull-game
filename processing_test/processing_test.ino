// this is the redbull arcade machine microcontroller code
int incomingByte = 0;

int interval = 50;
int targetTime = 0;

byte inputPins[] = {7, 8, 9, 10, 11, 12};
int inputs[] = {1, 1, 1, 1, 1, 1};

void setup(){
//initialize serial communications at a 9600 baud rate
Serial.begin(9600);
//initialize input pins
for (int i = 0; i < 6; i++){
  pinMode(inputPins[i], INPUT_PULLUP);
}
pinMode(LED_BUILTIN, OUTPUT);
digitalWrite(LED_BUILTIN, LOW);
}


void loop()
{
  digitalWrite(LED_BUILTIN, LOW);
  if (Serial.available() > 0){
    incomingByte = Serial.read();
    digitalWrite(LED_BUILTIN, HIGH);
//    if (incomingByte == 'c'){
//        Serial.println(incomingByte);
        
//    }
  }
//read inputs
for (int i = 0; i < 6; i++){
  inputs[i] = digitalRead(inputPins[i]);
  if(inputs[i] == 1) inputs[i] = 0;
  else if(inputs[i] == 0) inputs[i] = 1;
}
//send inputs
if(millis() > targetTime)
  for (int i = 0; i < 6; i++){
//    Serial.print(inputs[i]);
//    Serial.print("a");
  }

// end byte
Serial.print("\n");


//wait 50 milliseconds so we don't drive ourselves crazy
delay(50);
}
