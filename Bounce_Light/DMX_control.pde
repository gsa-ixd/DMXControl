import processing.serial.*; // Import Serial library to talk to Arduino 
Serial myPort; // Send new DMX channel value to Arduino // 
int value; //dmx variables
int channel;
int data; // create a variable to hold the data we are sending to the Arduino

void setDmxChannel(int channel, int value) { // Convert the parameters into a message of the form: 123c45w where 123 is the channel and 45 is the value // then send to the Arduino 
  myPort.write( str(channel) + "c" + str(value) + "w" );
}

void setupDMX() {
  printArray(Serial.list()); // shows available serial ports on the system 

  // Change 0 to select the appropriate port as required. 
  String portName = Serial.list()[0]; 
  myPort = new Serial(this, portName, 9600);
  //initialise communiction over serial
  setDmxChannel(123, 45);

  // You may have to set other channels. Some lamps have a shutter channel that should be set to 255. 
  // Set it here: setDmxChannel(4,255);
  //find out what channel and values these require.
}

void outputDMX() {
  setDmxChannel(channel, data); // Send new channel values to Arduino 
  delay(20); // Short pause before repeating
}
