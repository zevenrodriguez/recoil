// The Nature of Code
// Daniel Shiffman
// Draft book

// Example 1-2: Bouncing Ball, with PVector!
PVector location;
PVector velocity;

void setup() {
  size(200,200,OPENGL);
  smooth();
  background(255);
  location = new PVector(width/2,height/2);
  velocity = new PVector(1,1);
}

void draw() {
  background(255);
  noStroke();
  // Add the current speed to the location.
  location.add(velocity);

  if ((location.x > width) || (location.x < 5)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 5)) {
    velocity.y = velocity.y * -1;
  }

  // Display circle at x location
  pushMatrix();
  translate(0,0,location.x);
  stroke(0);
  fill(175);
  ellipse(width/2,height/2,50,50);
  popMatrix();
}


