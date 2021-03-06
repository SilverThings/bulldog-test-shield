// libraries
#include <Wire.h>
#include <SPI.h>

// REGISTERS              MASTER	SLAVE
#define STATUS    0x00 // R		  RW
#define COMMAND   0x01 // RW		R
#define PIN_NO    0x02 // RW		R
#define PIN_VALUE 0x03 // RW		RW
#define CONFIG    0x04 // RW		R
#define ID        0x05 // R		R
#define VERSION   0x06 // R		R


byte regMasks[]{
  0x01, // STATUS
  0x02, // COMMAND
  0x04, // PIN_NO
  0x08, // PIN_VALUE
  0x10, // CONFIG
  //0x20, // ID
  //0x40  // VERSION
};

#define REGSIZE 7         // number of registers
#define MAX_SENT_BYTES 5  // address byte + number of writable registers

// status register values
#define NEW_COMMANDS  0x11
#define NEW_DATA      0x12
#define IDLE          0x13
#define BUSY	        0x14

// command register values
#define NO_COMMAND    0x20
#define DIGITAL_READ  0x21
#define DIGITAL_WRITE 0x22
#define ANALOG_READ   0x23
#define ANALOG_WRITE  0x24
#define SPI           0x25
#define UART          0x26
#define DEMO          0x27


//#define INPUT         0x25 // 0x0 in arduino.h
//#define OUTPUT        0x26 // 0x1 
//etc



const byte ledPin = 8;  // notification
const byte pwmPin = 3; 


// constants
byte id = 0x55;         // device id
byte i2cAddress = 0x33; // device i2c address
byte version = 0x01;    // firmware version


//globals
byte received[MAX_SENT_BYTES]; // received command

byte workingReg[REGSIZE - 2] = {IDLE, NO_COMMAND, 0, 0, 0};
byte receiveReg[REGSIZE - 2] = {IDLE, NO_COMMAND, 0, 0, 0};
byte transmissionReg[REGSIZE] = {IDLE, NO_COMMAND, 0, 0, 0, id, version};

byte workingRegFlags = 0;
byte receiveRegFlags = 0;
//byte transmissionRegFlags = 0; // when register has new value, set the corresponding bit to 1



// demo outputs
byte pwmEnabled;
byte spiEnabled; 
byte uartEnabled;



unsigned long currentMillis = 0; // stores value of millis()



//function definitions
void receiveEvent(int bytes);
void requestEvent();
void updateWorkingReg();
void updateTransmissionReg();
void updateBuiltinLed();
void updatePwm();
void updateSerial();



//initialization
void setup(){

  //i2c init
  Wire.begin(i2cAddress);

  //disable internal pullups
  pinMode(18, INPUT);
  digitalWrite(18, LOW);
  pinMode(19, INPUT);
  digitalWrite(19, LOW);
    
  //i2c events
  Wire.onRequest(requestEvent);
  Wire.onReceive(receiveEvent);


  //setup pins
  pinMode(ledPin, OUTPUT);


  //demo
  //pwm
  pwmEnabled = 1;
  analogWrite(pwmPin, 50);
  //uart
  uartEnabled = 1;
  Serial.begin(9600);
  //spi
  spiEnabled = 1;
  pinMode(MISO, OUTPUT);
  SPCR |= _BV(SPE); // slave mode
  SPCR |= _BV(SPIE); //interrupts  
}

void loop(){
  currentMillis = millis(); // update current time
  updateBuiltinLed();
  
  //if(pwmEnabled) updatePwm();
   
  if(uartEnabled) updateSerial();

  if(receiveRegFlags){
    updateWorkingReg();
    workingReg[STATUS] = NEW_COMMANDS;
    workingRegFlags |= regMasks[STATUS];
    return;
  }
  
    
  if (workingReg[STATUS] == NEW_COMMANDS){
    switch(workingReg[COMMAND]){
      case OUTPUT:
        pinMode(workingReg[PIN_NO], OUTPUT);
        workingReg[STATUS] = IDLE;
        workingRegFlags |= regMasks[STATUS];
      break;

      case INPUT:
        pinMode(workingReg[PIN_NO], INPUT);
        workingReg[STATUS] = IDLE;
        workingRegFlags |= regMasks[STATUS];
      break;

      case DIGITAL_WRITE:
        digitalWrite(workingReg[PIN_NO], workingReg[PIN_VALUE]);
        workingReg[STATUS] = IDLE;
        workingRegFlags |= regMasks[STATUS];
      break;

      case DIGITAL_READ:
        workingReg[PIN_VALUE] = digitalRead(workingReg[PIN_NO]);
        workingRegFlags |= regMasks[PIN_VALUE];
        workingReg[STATUS] = NEW_DATA;
        workingRegFlags |= regMasks[STATUS];
      break;

      case ANALOG_WRITE:
        analogWrite(workingReg[PIN_NO], workingReg[PIN_VALUE]);
        workingReg[STATUS] = IDLE;
        workingRegFlags |= regMasks[STATUS];
      break;

      case ANALOG_READ:
        workingReg[PIN_VALUE] = (byte) (analogRead(workingReg[PIN_NO]) >> 2); // divide by four to get byte
        workingRegFlags |= regMasks[PIN_VALUE];
        workingReg[STATUS] = NEW_DATA;
        workingRegFlags |= regMasks[STATUS];
      break;

      case SPI:  // spi is currently always active 
        if (workingReg[PIN_VALUE] == 0){
           if (spiEnabled == 1){
             spiEnabled = 0;
             SPCR &= 0b10111111;         
           } 
        }
        else {
           if (!spiEnabled){
             spiEnabled = 1;
             pinMode(MISO, OUTPUT);
             SPCR |= _BV(SPE); // slave mode
             SPCR |= _BV(SPIE); //interrupts
           } 
        }
      break;

      case UART:
        if (workingReg[PIN_VALUE] == 0){
           if(uartEnabled == 1)
           {
             uartEnabled = 0;
             Serial.end();
           }
        }
        else {
           if (!uartEnabled){
             uartEnabled = 1;
             Serial.begin(9600);
           } 
        }
      break;

      case DEMO:
        if (workingReg[PIN_VALUE] == 0)
        {
           if(uartEnabled == 1)
           {
             uartEnabled = 0;
             Serial.end();
           }
           
           if(pwmEnabled == 1)
           {
             pwmEnabled = 0;
             pinMode(pwmPin, INPUT);
           }

           if (spiEnabled == 1){
             spiEnabled = 0;         
           } 
        } 
        else
        {
           if (!uartEnabled){
             uartEnabled = 1;
             Serial.begin(9600);
           } 

           if (!pwmEnabled){
             pwmEnabled = 1;
             analogWrite(pwmPin, 50);
           }

           if (!spiEnabled){
             spiEnabled = 1;
           } 
        }

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
      digitalWrite(ledPin, state);
    }
  } else { // state == HIGH
    if(currentMillis - previousMillis >= duration){
      state = LOW;
      previousMillis += duration;
      digitalWrite(ledPin, state);
    }
  }
}


void updatePwm(){
  static unsigned long previousMillis = 0;
  static unsigned int interval = 200;
  static byte value = 100;
  static byte increment = 20;
  if (currentMillis - previousMillis >= interval)  //test whether the period has elapsed
  {
    analogWrite(pwmPin, value);
    value += increment;    //will wrap round
    previousMillis += interval;
  }
}


void updateSerial(){
  static unsigned long previousMillis = 0;
  static unsigned int interval = 1000;
  if (currentMillis - previousMillis >= interval)  //test whether the period has elapsed
  {
    Serial.println("test");
    previousMillis += interval;
  }
}


void updateWorkingReg(){
  workingRegFlags = 0; // data in working regs is no longer valid

  for(int i = COMMAND; i < REGSIZE - 2; i++){
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
  for(int i = COMMAND; i < REGSIZE - 2; i++){
    if(workingRegFlags & regMasks[i]){
      transmissionReg[i] = workingReg[i];
      workingRegFlags &= ~regMasks[i];
    }
    if(!workingRegFlags) return; // no more flags are set
  }
}


//master writes to slave
void receiveEvent(int bytes){

  for(int i = 0; i < bytes; i++){
    if(i < MAX_SENT_BYTES){
      received[i] = Wire.read();
    }
    else{
      Wire.read(); // after receiving MAX_SENT_BYTES, throw away the rest
    }
  }


  if(bytes == 1){ // master is requesting data from register
    if(received[0] >= REGSIZE) received[0] = 0x00; // if register is out of range
    digitalWrite(6,LOW);
    return;
  } 
  
  int processedBytes = 1;
  receiveRegFlags = 0;

  switch(received[0]){
    case COMMAND: // 0x01      
      for(int i = COMMAND; i < bytes; i++){  // start writing from COMMAND
        if(i >= (REGSIZE - 2)) break;                // can't write there
        receiveReg[i] = received[processedBytes];      
        receiveRegFlags |= regMasks[i];           
        if(++processedBytes == bytes) break;   // nothing else to write
      }
    break;

    case PIN_NO: // 0x02
      for(int i = PIN_NO; i < bytes; i++){
        if(i >= (REGSIZE - 2)) break;
        receiveReg[i] = received[processedBytes];
        receiveRegFlags |= regMasks[i];
        if(++processedBytes == bytes) break;
      }       
    break;

    case PIN_VALUE: // 0x03
      for(int i = PIN_VALUE; i < bytes; i++){
        if(i >= (REGSIZE - 2)) break;
        receiveReg[i] = received[processedBytes];
        receiveRegFlags |= regMasks[i];
        if(++processedBytes == bytes) break;
      }
    break;

    case CONFIG: // 0x04
      for(int i = CONFIG; i < bytes; i++){
        if(i >= (REGSIZE - 2)) break;
        receiveReg[i] = received[processedBytes];
        receiveRegFlags |= regMasks[i];
        if(++processedBytes == bytes) break;
      }
    break;

    default:
     break;// return; // unknown commmand
  }
}

//master reads
void requestEvent(){
  if (workingReg[STATUS] == NEW_DATA){
    updateTransmissionReg();
    workingReg[STATUS] = IDLE;
    workingRegFlags |= regMasks[STATUS];
  }
  
  Wire.write(transmissionReg + received[0], REGSIZE);

  transmissionReg[STATUS] = IDLE;
}

// SPI interrupt
ISR (SPI_STC_vect)
{ 
  workingReg[PIN_VALUE] = SPDR;
  workingRegFlags |= regMasks[PIN_VALUE];
  workingReg[STATUS] = NEW_DATA;
  workingRegFlags |= regMasks[STATUS];
} 

