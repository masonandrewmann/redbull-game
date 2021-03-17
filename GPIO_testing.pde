import processing.io.*;

boolean ledOn = false; 
int buttonPin = 4;
int relayPin = 18;

void setup() {
  GPIO.pinMode(relayPin, GPIO.OUTPUT);
  GPIO.pinMode(buttonPin, GPIO.INPUT_PULLUP);
}

void draw() {
  if (GPIO.digitalRead(buttonPin) == GPIO.HIGH) {
    GPIO.digitalWrite(relayPin, GPIO.HIGH);
    fill(204);
  } else {
    GPIO.digitalWrite(relayPin, GPIO.LOW);
    fill(255);
  }

  stroke(255);
  ellipse(width /2, height/2, width *.75, height*.75);
}
