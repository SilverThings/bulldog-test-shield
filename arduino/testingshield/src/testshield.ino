// libraries
#include <Wire.h>

// REGISTERS              MASTER	SLAVE
#define STATUS    0x00 // R		  RW
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
#define BUSY	        0x14

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




unsigned long currentMillis = 0; // stores value of millis()



//function definitions
void receiveEvent(int bytes);
void requestEvent();
void updateWorkingReg();
void updateTransmissionReg();
void updateBuiltinLed();

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


  // setup pins
  pinMode(LED_BUILTIN, OUTPUT);

  pinMode(6,OUTPUT);//debug
  digitalWrite(6,LOW);

  pinMode(5,OUTPUT);//debug
  digitalWrite(5,LOW);

  if(DEBUG){
    pinMode(LED_BUILTIN, OUTPUT);
    Serial.begin(9600);
    Serial.println("setup");
  }
}

void loop(){
  currentMillis = millis(); // update current time
  updateBuiltinLed();

   
  if(receiveRegFlags){
    updateWorkingReg();
    workingReg[STATUS] = NEW_COMMANDS;
    workingRegFlags |= regMasks[STATUS];
    return;
  }
  
    
  if (workingReg[STATUS] == NEW_COMMANDS){
    switch(workingReg[MODE]){
      case DIGITAL_OUTPUT:
        pinMode(workingReg[PIN_NO], OUTPUT);
        digitalWrite(workingReg[PIN_NO], workingReg[PIN_VALUE]);
        workingReg[STATUS] = IDLE;
        workingRegFlags |= regMasks[STATUS];
      break;

      case DIGITAL_INPUT:
        pinMode(workingReg[PIN_NO], INPUT);
        workingReg[PIN_VALUE] = digitalRead(workingReg[PIN_NO]);
        workingRegFlags |= regMasks[PIN_VALUE];
        workingReg[STATUS] = NEW_DATA;
        workingRegFlags |= regMasks[STATUS];
      break;

      case ANALOG_OUTPUT:
        analogWrite(workingReg[PIN_NO], workingReg[PIN_VALUE]);
        workingReg[STATUS] = IDLE;
        workingRegFlags |= regMasks[STATUS];
      break;

      case ANALOG_INPUT:
        workingReg[PIN_VALUE] = (byte) (analogRead(workingReg[PIN_NO]) >> 2); // analogRead returns 10bit int, shift this by two
        workingRegFlags |= regMasks[PIN_VALUE];
        workingReg[STATUS] = NEW_DATA;
        workingRegFlags |= regMasks[STATUS];
      break;

      default:
      break;
    }
  }
  
  if(receiveRegFlags){
    updateWorkingReg();
    workingReg[STATUS] = NEW_COMMANDS;
    workingRegFlags |= regMasks[STATUS];
    return;
  }

  if (workingReg[STATUS] == NEW_DATA){
    updateTransmissionReg();
    workingReg[STATUS] = IDLE;
    workingRegFlags |= regMasks[STATUS];
  }
}

void updateBuiltinLed(){
  static byte state = LOW;
  static unsigned long previousMillis = 0;
  static unsigned int interval = 1000;
  static unsigned int duration = 1000;

  if(state == LOW){
    if(currentMillis - previousMillis >= interval){
      state = HIGH;
      previousMillis += interval;
      digitalWrite(LED_BUILTIN, state);
    }
  } else { // state == HIGH
    if(currentMillis - previousMillis >= duration){
      state = LOW;
      previousMillis += duration;
      digitalWrite(LED_BUILTIN, state);
    }
  }
}

void updateWorkingReg(){
  if(DEBUG) Serial.println("update work reg");
  workingRegFlags = 0; // data in working regs is no longer valid

  for(int i = MODE; i < REGSIZE - 2; i++){
    if(receiveRegFlags & regMasks[i]){
      workingReg[i] = receiveReg[i];
      transmissionReg[i] = receiveReg[i];
      workingRegFlags |= regMasks[i];   // set 
      receiveRegFlags &= ~regMasks[i];  // unset
    }
    if(!receiveRegFlags) return; // no more flags are set
  }
}



void updateTransmissionReg(){
  for(int i = MODE; i < REGSIZE - 2; i++){
    if(workingRegFlags & regMasks[i]){
      transmissionReg[i] = workingReg[i];
      workingRegFlags &= ~regMasks[i];
    }
    if(!workingRegFlags) return; // no more flags are set
  }
}


//master writes to slave
void receiveEvent(int bytes){
  digitalWrite(6,HIGH);
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
        receiveReg[i] = received[processedBytes];                          //TODO  
        receiveRegFlags |= regMasks[i];                                       //TODO
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
     break;// return; // unknown commmand
  }
    digitalWrite(6,LOW);

}

//master reads
void requestEvent(){
  digitalWrite(5,HIGH);
  if(DEBUG) Serial.println("request");

  if (workingReg[STATUS] == NEW_DATA){
    updateTransmissionReg();
    workingReg[STATUS] = IDLE;
    workingRegFlags |= regMasks[STATUS];
  }
  
  Wire.write(transmissionReg + received[0], REGSIZE);

  transmissionReg[STATUS] = IDLE;
  digitalWrite(5,LOW);
}
