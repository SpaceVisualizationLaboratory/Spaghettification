// Daniel Shiffman
// Basic Library functionality example
// http://www.shiffman.net
// https://github.com/shiffman/libfreenect/tree/master/wrappers/java/processing

import org.openkinect.*;
import org.openkinect.processing.*;

Kinect kinect;
boolean depth = false;
boolean rgb = true;
boolean ir = false;

float deg = -40; // Start at 15 degrees
float widthPercentage = 0.05;//width Percentage

void setup() {
  size(1920,1080);
  kinect = new Kinect(this);
  kinect.start();
  delay(500);
  kinect.enableDepth(depth);
  kinect.enableRGB(true);
  kinect.enableIR(ir);
  kinect.tilt(deg);
  textSize(120);
}


void draw() {
  background(0);

  image(kinect.getVideoImage(),200,0,width*widthPercentage,1080);
  image(kinect.getVideoImage(),500,0,width*widthPercentage*2,1080);
  image(kinect.getVideoImage(),800,0,width*widthPercentage*4,1080);
  image(kinect.getVideoImage(),1000,0,width*widthPercentage*10,1080);
  //image(kinect.getDepthImage(),640,0);
  fill(255);
  text(" Spaghettify yourself! ",400,1000);
}  

void keyPressed() {
  if (key == 'r') {
    rgb = !rgb;
    if (rgb) ir = false;
    kinect.enableRGB(rgb);
  }
  else if (key == CODED) {
    if (keyCode == UP) {
      deg++;
    } 
    else if (keyCode == DOWN) {
      deg--;
    }
    deg = constrain(deg,-40,40);
    kinect.tilt(deg);
  }
}
void stop() {
  kinect.quit();
  super.stop();
}

