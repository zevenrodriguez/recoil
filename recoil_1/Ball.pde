class Ball {

  int xpos;
  int ypos;
  int ballSize;
  PImage on;
  PImage off;
  int imageSize = 150;
  int totalTime = 1000;
  int savedTime = 0;
  int counter = 0;
  
  
  
  
  
  Ball(int _xpos, int _ypos, int _ballSize, PImage _on, PImage _off) {
    xpos = _xpos;
    ypos = _ypos;
    ballSize = _ballSize;
    on = _on;
    off = _off;
  }




  void display(int cTrigger) {
    if (cTrigger >=1 && cTrigger <=4) {
      image(on, xpos, ypos, 150, 150);
    }
    else if (cTrigger >=5 && cTrigger <=8) {
      image(off, xpos, ypos, 150, 150);
    }
  }

  void move() {
    while (counter < 10) {

      int PassedTime = millis() - SavedTime;

      if (PassedTime > TotalTime) {

        println("doing something");
        SavedTime = millis();
        counter++;
      }
      display(1);
    }
    if (counter >=10){
      
      counter = 0;
      display(5);
      
      
    }
  }

