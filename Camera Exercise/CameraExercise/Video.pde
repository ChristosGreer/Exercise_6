import processing.video.*;

Capture capture;
int vWidth = 320;
int vHeight = 240;
int vFPS = 30;
PGraphics buffer;

void setupCapture(int whichCamera) {
  String[] cameraNames = capture.list();
  for (String cameraName : cameraNames) {
    println(cameraName);
  }
  capture = new Capture(this, vWidth, vHeight, cameraNames[whichCamera], vFPS);    
  buffer = createGraphics(vWidth, vHeight, P3D);
  
  capture.start();
}

void captureEvent(Capture c) {
  c.read();
  
  faceUpdate = true;
  eyesUpdate = true;
  noseUpdate = true;
  mouthUpdate = true;
}
