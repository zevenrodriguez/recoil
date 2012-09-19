float x, y, z = 0;
float sizeCircle = 0;

int savedTime;
int totalTime = 10;
boolean countdown = false;

void setup() {
  size(600, 600, OPENGL);
  x = width/2;
  y = height/2;
  sizeCircle = 10;
  noStroke();
}


void draw() {


  background(255);


  int passedTime = millis() - savedTime;

  if (passedTime > totalTime) {

 

    savedTime = millis();
  }

  // pushMatrix();
  fill(255, 0, 0);
  //  translate(0, 0, z);
  ellipse(x, y, sizeCircle + z, sizeCircle +z);
  // popMatrix();
}

