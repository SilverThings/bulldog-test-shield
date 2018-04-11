#include <Wire.h>

// REGISTERS              MASTER	SLAVE
#define STATUS    0x00 // R		RW
#define MODE      0x01 // RW		R
#define PIN_NO    0x02 // RW		R
#define PIN_VALUE 0x03 // RW		RW
#define CONFIG    0x04 // RW		R
#define ID        0x05 // R		R
#define VERSION   0x06 // R		R


byte regMasks[]{
  0x01, // STATUS
  0x02, // MODE
  0x04, // PIN_NO
  0x08, // PIN_VALUE
  0x10, // CONFIG
  //0x20, // ID
  //0x40  // VERSION
};



#define REGSIZE 7         // number of registers
#define MAX_SENT_BYTES 5  // address byte + number of writable registers

#define DEBUG 0           // enable or disable debug output



//arduino values


// status register values
#define NEW_COMMANDS  0x11
#define NEW_DATA      0x12
#define IDLE          0x13
#define BUSY	      0x14

// mode register values
#define NO_MODE        0x20
#define DIGITAL_INPUT  0x21
#define DIGITAL_OUTPUT 0x22
#define ANALOG_INPUT   0x23
#define ANALOG_OUTPUT  0x24
#define SPI            0x25
#define SER            0x26
//etc


// constants
byte id = 0x55;         // device id
byte i2cAddress = 0x04; // device i2c address
byte version = 0x01;    // firmware version

//globals
byte received[MAX_SENT_BYTES]; // received command

byte workingReg[REGSIZE - 2] = {IDLE, NO_MODE, 0, 0, 0};
byte receiveReg[REGSIZE - 2] = {IDLE, NO_MODE, 0, 0, 0};
byte transmissionReg[REGSIZE] = {IDLE, NO_MODE, 0, 0, 0, id, version};

byte workingRegFlags = 0;
byte receiveRegFlags = 0;
//byte transmissionRegFlags = 0; // when register has new value, set the corresponding bit to 1



//function definitions
void receiveEvent(int bytes);
void requestEvent();
void updateWorkingReg();
void updateTransmissionReg();


//initialization
void setup(){

  //i2c init
  Wire.begin(i2cAddress);

  //disable internal pullups
  pinMode(18, INPUT);
  digitalWrite(18, LOW);
  pinMode(19, INPUT);
  digitalWrite(19, LOW);
    

  Wire.onRequest(requestEvent);
  Wire.onReceive(receiveEvent);

  pinMode(LED_BUILTIN, OUTPUT);

  if(DEBUG){
    pinMode(LED_BUILTIN, OUTPUT);
    Serial.begin(9600);
    Serial.println("setup");
  }
}

void loop(){
  if(DEBUG){
    digitalWrite(LED_BUILTIN, HIGH);
    Serial.print(".");
    delay(500);
    digitalWrite(LED_BUILTIN, LOW);
  }

   
  if(receiveRegFlags){
    if(DEBUG) Serial.println("flags");
    updateWorkingReg();
    if(receiveRegFlags) updateTransmissionReg();
    return;
  }
  
  if(transmissionReg[MODE] == DIGITAL_OUTPUT){
     pinMode(transmissionReg[PIN_NO], OUTPUT);
     digitalWrite(transmissionReg[PIN_NO], transmissionReg[PIN_VALUE]);
  }

  digitalWrite(LED_BUILTIN, HIGH);
  delay(50);
  digitalWrite(LED_BUILTIN, LOW);
  delay(25);
}

void updateWorkingReg(){
  if(DEBUG) Serial.println("update work reg");
  workingRegFlags = 0; // data in working regs is no longer valid

  for(int i = MODE; i < REGSIZE - 2; i++){
    if(receiveRegFlags & regMasks[i]){
      workingReg[i] = receiveReg[i];
      workingRegFlags |= regMasks[i];   // set 
      receiveRegFlags &= ~regMasks[i];  // unset
    }
    if(!receiveRegFlags) break;
  }
}



void updateTransmissionReg(){
  for(int i = MODE; i < REGSIZE - 2; i++){
    if(receiveRegFlags & regMasks[i]){
      transmissionReg[i] = receiveReg[i];
      receiveRegFlags &= ~regMasks[i];
    }
    if(!receiveRegFlags) break;
  }
}


//master writes to slave
void receiveEvent(int bytes){
  if(DEBUG) Serial.println("receive");
  for(int i = 0; i < bytes; i++){
    if(i < MAX_SENT_BYTES){
      received[i] = Wire.read();
    }
    else{
      Wire.read(); // after receiving MAX_SENT_BYTES, throw away the rest
    }
  }

  if(DEBUG) for(int i = 0; i < bytes; i++) Serial.println(received[i]);


  if(bytes == 1){ // master is requesting data from register
    if(received[0] >= REGSIZE) received[0] = 0x00; // if register is out of range
    if(DEBUG) Serial.println("only one byte");
    return;
  } 
  
  int processedBytes = 1;
  receiveRegFlags = 0;

  switch(received[0]){
    case MODE: // 0x01      
      if(DEBUG) Serial.println("command - mode");
      for(int i = MODE; i < bytes; i++){  // start writing from MODE
        if(i >= (REGSIZE - 2)) break;                // can't write there
        transmissionReg[i] = received[processedBytes];                          //TODO  
        //receiveRegFlags |= regMasks[i];                                       //TODO
        if(++processedBytes == bytes) break;   // nothing else to write
      }
    break;

    case PIN_NO: // 0x02
      if(DEBUG) Serial.println("command - pin no");
      for(int i = PIN_NO; i < bytes; i++){
        if(i >= (REGSIZE - 2)) break;
        receiveReg[i] = received[processedBytes];
        receiveRegFlags |= regMasks[i];
        if(++processedBytes == bytes) break;
      }       
    break;

    case PIN_VALUE: // 0x03
      if(DEBUG) Serial.println("command - pin value");
      for(int i = PIN_VALUE; i < bytes; i++){
        if(i >= (REGSIZE - 2)) break;
        receiveReg[i] = received[processedBytes];
        receiveRegFlags |= regMasks[i];
        if(++processedBytes == bytes) break;
      }
    break;

    case CONFIG: // 0x04
      if(DEBUG) Serial.println("command - config");
      for(int i = CONFIG; i < bytes; i++){
        if(i >= (REGSIZE - 2)) break;
        receiveReg[i] = received[processedBytes];
        receiveRegFlags |= regMasks[i];
        if(++processedBytes == bytes) break;
      }
    break;

    default:
      if(DEBUG) Serial.println("command - unknown");
      return; // unknown commmand
  }
}

//master reads
void requestEvent(){
  if(DEBUG) Serial.println("request");
  if(workingRegFlags){
    if(workingRegFlags & regMasks[STATUS]) transmissionReg[STATUS] = workingReg[STATUS];
    if(workingRegFlags & regMasks[PIN_VALUE]) transmissionReg[PIN_VALUE] = workingReg[PIN_VALUE];
    workingRegFlags = 0;
  }

  Wire.write(transmissionReg + received[0], REGSIZE);
}
