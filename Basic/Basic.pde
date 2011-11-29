import processing.video.*;
Capture capture;

void setup() {
  // most webcams support 640x480
  // newer webcams also support 1280x720
  size(640, 480); //size(1280, 720);
  capture = new Capture(this, width, height, 30);
}

void captureEvent(Capture myCapture) {
  capture.read();
}

void draw() {
  image(capture, 0, 0);
}
