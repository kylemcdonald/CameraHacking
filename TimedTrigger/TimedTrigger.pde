import processing.video.*;
Capture capture;

float timeInterval = 1000; // in milliseconds

void setup() {
  size(640, 480);
  capture = new Capture(this, width, height, 30);
}

int lastMillis = 0;
void captureEvent(Capture myCapture) {
  capture.read();
  int curMillis = millis();
  if(curMillis - lastMillis > timeInterval) {
    trigger();
    lastMillis = curMillis;
  }
}

void draw() {
  image(capture, 0, 0);
}

int triggerCount = 0;
void trigger() {
  capture.save(triggerCount + ".jpg");
  triggerCount++;
}

