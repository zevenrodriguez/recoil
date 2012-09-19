
import processing.serial.*;


Serial myPort;                       // The serial port
boolean firstContact = false;        // Whether we've heard from the microcontroller
int inByte = 0;
void setup() {
  size(256, 256);  // Stage size
  noStroke();      // No border on the next thing drawn

  // Print a list of the serial ports, for debugging purposes:
  println(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[4];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  
  if (myPort.available() > 0){
    
    
    
    
    
  }
  
  
}

void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  int inByte = myPort.read();
  println(inByte);

  if (inByte == 9) { 
    myPort.clear();          // clear the serial port buffer
    myPort.write('A');       // ask for more
  }

}


