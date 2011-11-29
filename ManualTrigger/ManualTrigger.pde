import processing.video.*;
Capture capture;

void setup() {
  size(640, 480);
  capture = new Capture(this, width, height, 30);
}

void captureEvent(Capture myCapture) {
  capture.read();
}

void draw() {
  image(capture, 0, 0);
}

int triggerCount = 0;
void trigger() {
  capture.save(triggerCount + ".jpg");
  triggerCount++;
}

void keyPressed() {
  trigger();
}

void mousePressed() {
  trigger();
}
