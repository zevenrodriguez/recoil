class Ball {

  int xpos;
  int ypos;
  int ballSize;
  PImage on;
  PImage off;
  int imageSize = 150;
  int totalTime = 2000;
  int savedTime = 0;
  //int counter = 0;

  boolean displaying = true;


  Ball(int _xpos, int _ypos, int _ballSize, PImage _on, PImage _off) {
    xpos = _xpos;
    ypos = _ypos;
    ballSize = _ballSize;
    on = _on;
    off = _off;
  }




  void display() {

    
    image(on, xpos, ypos, ballSize, ballSize);
    
  }

  void move(int counter) {
    pushMatrix();
    translate(0,0,counter);
    display();
    popMatrix();
  
  }
  
  
  
}

