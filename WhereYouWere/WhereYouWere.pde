// Where you were, where you are going
// by Mark, Leigha and Adam
// developed during the studio-x camera hacking workshop
// requires OpenCv http://ubaa.net/shared/processing/opencv/

import hypermedia.video.*;

OpenCV opencv;
PImage img;
PImage buffer;

void setup() {

  size( 320, 240 );

  // open video stream
  opencv = new OpenCV( this );
  opencv.capture( 320, 240 );

  img = createImage(320, 240, RGB);
  buffer = createImage(320, 240, RGB);

}

void draw() {

  opencv.read();                               // grab frame from camera
  
  // BUFFER THE REAL IMAGE
  buffer =  opencv.image().get();
  
  img.updatePixels();
  opencv.convert(OpenCV.GRAY);

  if (frameCount == 1)
    opencv.remember();  // store the actual image in memory

  if (frameCount % 5 == 0)
    opencv.remember();  // store the actual image in memory

  opencv.absDiff();                            // make the difference between the current image and the image in memory
  //image( opencv.image(OpenCV.MEMORY), 0, 0 );  // display the image in memory on the right
  image( opencv.image(), 0, 0 );             // display the result on the bottom right


  //opencv.convert(OpenCV.GRAY);
  opencv.brightness( 80 );
  opencv.contrast( 90 );
  opencv.blur( OpenCV.BLUR, 6 );
  opencv.threshold(80);    // set black & white threshold 

  // find blobs
  Blob[] blobs = opencv.blobs( 10, width*height/2, 100, true, OpenCV.MAX_VERTICES*4 );
  background(0);
  // DRAW PIXEL MASK 
  for ( int i=0; i<blobs.length; i++ ) {
    if (blobs[i].area > 1000) {
      beginShape();
      for ( int j=0; j<blobs[i].points.length; j++ ) {
        vertex( blobs[i].points[j].x, blobs[i].points[j].y );
      }
      endShape(CLOSE);
    }
  }

  buffer.loadPixels();
  img.loadPixels();
  loadPixels();

  for (int i = 0; i < 320*240; i++) {
    if (red(pixels[i]) > 125)
      img.pixels[i] = buffer.pixels[i];
  }
  
  img.updatePixels();
  image(img, 0, 0);

  saveFrame("video_D_#####.jpg");
}

void keyPressed() {

  opencv.remember();  // store the actual image in memory
}

