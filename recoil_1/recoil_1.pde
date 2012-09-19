
import processing.serial.*;


Serial myPort;                       // The serial port
int inByte = 0;
Ball redBall; 
Ball blueBall;
Ball greenBall; 
Ball whiteBall;

PImage redLight, blueLight, greenLight, whiteLight, offLight;



boolean firstContact = false;
void setup() {
  size(1000, 1000);  
  noStroke();     

 // println(Serial.list());

  String portName = Serial.list()[4];
  myPort = new Serial(this, portName, 9600);

  redLight = loadImage("red.png");
  offLight = loadImage("off.png");



  redBall = new Ball(100, 100, 100, redLight, offLight); 
  //blueBall = new Ball(200, 200, 100);
  //greenBall = new Ball(300, 300, 100); 
  //whiteBall = new Ball(400, 400, 100);
}

void draw() {
  background(0);
  
  switch(inByte){
    case 1:
    redBall.move();
    myPort.write(5);
    break;
    case 2:
    blueBall.display(2);
    break;
    case 3:
    greenBall.display(3); 
    break;
    case 4:
    whiteBall.display(4);
    break;
    case 5:
    redBall.display(5);
    break;
    
  }
  /*
  if (inByte >= 1 && inByte <=4) {
    //ellipse((inByte * 100), (inByte * 100), 100,100);
    redBall.display(1); 
    blueBall.display(2);
    greenBall.display(3); 
    whiteBall.display(4);
  }
  */
  
  
  //display for time
  
  //done display 
  //send to arduino
  //Serial.write();
  
  
  
}

void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  inByte = myPort.read();
  println(inByte);

  if (inByte == 9) { 
    myPort.clear();          // clear the serial port buffer
    myPort.write('A');       // ask for more
    firstContact = true;
  }
}

