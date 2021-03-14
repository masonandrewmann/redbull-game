import processing.video.*;
Movie myMovie;

void setup() {
  size(1920, 1080);
  myMovie = new Movie(this, "BACKGROUND.mp4");
  myMovie.loop();
}

void draw(){
  image(myMovie, 0, 0);
  //fill(255);
  rect(300, 300, 300, 300);
}

void movieEvent(Movie m) {
  m.read();
}
