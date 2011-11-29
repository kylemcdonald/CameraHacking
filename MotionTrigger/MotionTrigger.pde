import processing.video.*;
Capture capture;

PImage previous;
float diff;
PFont font;
float threshold = 6;

void setup() {
  size(640, 480);
  capture = new Capture(this, width, height, 30);
  previous = createImage(width, height, RGB);
  font = createFont("", 10, false);
  textFont(font);
}

int lastMillis = 0;
void captureEvent(Capture myCapture) {
  capture.read();
  int n = width * height;
  float sum = 0;
  for(int i = 0; i < n; i++) {
    float a = brightness(capture.pixels[i]);
    float b = brightness(previous.pixels[i]);
    sum += abs(a - b);
  }
  if(sum > 0) { // avoid double frames
    diff = sum / n;
    previous = capture.get();
    if(diff > threshold) {
      trigger();
    }
  }
}

void draw() {
  image(capture, 0, 0);
  float stretch = 50;
  if(diff > threshold) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }
  stroke(255);
  rect(0, 0, diff * stretch, 16);
  fill(255);
  text((int) diff, 10, 12);
}

int triggerCount = 0;
void trigger() {
  capture.save(triggerCount + ".jpg");
  triggerCount++;
}

