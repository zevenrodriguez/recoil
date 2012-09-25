
import processing.serial.*;


Serial myPort;                       // The serial port
int inByte = 0;
int lastByte = 0;

Ball redBall; 
Ball blueBall;
Ball greenBall; 
Ball whiteBall;

boolean redLight = false;
boolean blueLight = false;
boolean greenLight = false;
boolean whiteLight = false;


PImage redImage, blueImage, greenImage, whiteImage, offImage;

int resetSavedTime = 0;
int resetTotalTime = 1000;

int redSavedTime = 0;
int redTotalTime = 5000;

int counter = 0;


boolean firstContact = false;
void setup() {
  size(600, 600, OPENGL);  
  noStroke();     

  // println(Serial.list());

  String portName = Serial.list()[4];
  myPort = new Serial(this, portName, 9600);

  redImage = loadImage("red.png");
  offImage = loadImage("off.png");



  redBall = new Ball(50, 50, 300, redImage, offImage); 
  //blueBall = new Ball(200, 200, 100);
  //greenBall = new Ball(300, 300, 100); 
  //whiteBall = new Ball(400, 400, 100);
}

void draw() {
  background(0);

  int resetPassedTime = millis() - resetSavedTime;

  if (resetPassedTime > resetTotalTime) {
    lastByte = 0;
    resetSavedTime = millis();
  }


  switch(lastByte) {
  case 1:

    redLight = true;
    counter = 0;

    break;
  case 2:
    //blueBall.display(2);
    break;
  case 3:
    //greenBall.display(3); 
    break;
  case 4:
    //whiteBall.display(4);
    break;
  }

  if (redLight == true) {
    int redPassedTime = millis() - redSavedTime;

    if (redPassedTime > redTotalTime) {

      //set something to true
      redLight = false;
      myPort.write(5);
      redSavedTime = millis();
    }

    //if (counter = 100){
    counter= counter -20;
    // }
    //if (counter >= -100){
    // counter = counter + 10;
    //}
    redBall.move(counter);
  }

  //display for time

  //done display 
  //send to arduino
  //Serial.write();
}

void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  inByte = myPort.read();

  if (inByte != lastByte) { 
    lastByte = inByte;
    println(lastByte);
  }

  if (inByte == 9) { 
    myPort.clear();          // clear the serial port buffer
    myPort.write('A');       // ask for more
    firstContact = true;
  }
}

