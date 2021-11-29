import gab.opencv.*;
import java.awt.Rectangle;

OpenCV openCVface, openCVeye, openCVnose, openCVmouth;
Rectangle[] faces, eyes, noses, mouths;
boolean faceUpdate = false, eyesUpdate = false, noseUpdate = false, mouthUpdate = false;

void setupOpenCV() {
  openCVface = new OpenCV(this, vWidth, vHeight);
  openCVface.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  faces = new Rectangle[0];
  
  openCVeye = new OpenCV(this, vWidth, vHeight);
  openCVeye.loadCascade(OpenCV.CASCADE_EYE);
  eyes = new Rectangle[0];
  
  openCVnose = new OpenCV(this, vWidth, vHeight);
  openCVnose.loadCascade(OpenCV.CASCADE_NOSE);
  noses = new Rectangle[0];
  
  openCVmouth = new OpenCV(this, vWidth, vHeight);
  openCVmouth.loadCascade(OpenCV.CASCADE_MOUTH);
  mouths = new Rectangle[0];
}

void updateOpenCV() {
  if (faceUpdate) {
    openCVface.loadImage(capture);
    buffer.beginDraw();
    buffer.image(capture, 0, 0);
    buffer.endDraw();
    faces = openCVface.detect();
    faceUpdate = false;
  }
  if (eyesUpdate) {
    openCVeye.loadImage(capture);
    buffer.beginDraw();
    buffer.image(capture, 0, 0);
    buffer.endDraw();
    eyes = openCVeye.detect();
    eyesUpdate = false;
  }
  if (noseUpdate) {
    openCVnose.loadImage(capture);
    buffer.beginDraw();
    buffer.image(capture, 0, 0);
    buffer.endDraw();
    noses = openCVnose.detect();
    noseUpdate = false;
  }
  if (mouthUpdate) {
    openCVmouth.loadImage(capture);
    buffer.beginDraw();
    buffer.image(capture, 0, 0);
    buffer.endDraw();
    mouths = openCVmouth.detect();
    mouthUpdate = false;
  }
}
