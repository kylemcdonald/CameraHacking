// make sure to go into the terminal and type `chmod +x upload.sh`

import java.io.*;
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

void printStream(InputStream stream) throws Exception {
  String cur;
  BufferedReader reader = new BufferedReader(new InputStreamReader(new BufferedInputStream(stream)));
  while ((cur = reader.readLine()) != null) {
    System.out.println(cur);
  }
}

int triggerCount = 0;
void trigger() {
  String filename = triggerCount + ".jpg";
  capture.save(filename);
  try {
    String cur, cmd = sketchPath("") + "./upload.sh " + sketchPath(filename);
    println(cmd);
    Process process = Runtime.getRuntime().exec(cmd);
    printStream(process.getErrorStream());
    printStream(process.getInputStream());
  } catch (Throwable t) {
    t.printStackTrace();
  }

  triggerCount++;
}

void keyPressed() {
  trigger();
}

void mousePressed() {
  trigger();
}

