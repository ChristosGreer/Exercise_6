PVector cameraPos;

void setup() {
  size(640, 480, P3D);
  cameraPos = new PVector(width, 0, 100);
  setupCapture(0);
  setupOpenCV();
}

void draw() {
  scale(2);
  background(0);
  updateOpenCV();
  
  image(buffer, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);

  for (int i=0; i<faces.length; i++) {
    Rectangle face = faces[i];
    if (i == 0) {
      cameraPos.x = face.x - width/2;
    }
    rect(face.x, face.y, face.width, face.height);
  }

  stroke(0, 0, 255);
  
  for (int i=0; i<eyes.length; i++) {
    Rectangle eye = eyes[i];
    if (i == 0) {
      cameraPos.x = eye.x - width/2;
    }
    rect(eye.x, eye.y, eye.width, eye.height);
  }
  
  stroke(255, 0, 0);
  
  for (int i=0; i<noses.length; i++) {
    Rectangle nose = noses[i];
    if (i == 0) {
      cameraPos.x = nose.x - width/2;
    }
    rect(nose.x, nose.y, nose.width, nose.height);
  }
  
  stroke(255, 255, 0);
  
  for (int i=0; i<mouths.length; i++) {
    Rectangle mouth = mouths[i];
    if (i == 0) {
      cameraPos.x = mouth.x - width/2;
    }
    rect(mouth.x, mouth.y, mouth.width, mouth.height);
  }

  pushMatrix();    
  camera(cameraPos.x, cameraPos.y, cameraPos.z, 0, 0, 0, 0, -1, 0);

  popMatrix();
  
  surface.setTitle("" + frameRate);
}

float rotation=0;
