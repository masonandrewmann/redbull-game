import processing.video.*;

PGraphics img; //output graphics
PImage out;

Movie background;   //background image

void setup(){
  background = new Movie(this, "0_BACKGROUND/BACKGROUND.mp4");
  background.loop();
  
  img = createGraphics(1920, 1080);
  
}

void draw(){
    img.beginDraw();
  img.image(background, 0, 0);
  img.endDraw();
  img.save("hi.png");
  delay(5000);
}

void movieEvent(Movie m) {
  m.read();
}
