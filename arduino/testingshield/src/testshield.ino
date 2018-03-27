#include <Wire.h>

#define SLAVE_ADDRESS 0x04
#define  MAX_SENT_BYTES 3

#define COMMAND_MODE_IN  0b00010000
#define COMMAND_MODE_OUT 0b01010000
#define COMMAND_WRITE    0b00100000
#define COMMAND_READ     0b00010001

#define COMMAND_RESET    0b00000111
#define COMMAND_NOOP     0b00010101 


byte dataToSend[1];
byte received[MAX_SENT_BYTES];
int receivedLength = 0;
int number = 0;
int state = 0;

void receiveData(int byteCount);
void sendData();


void setup() 
{
  Serial.begin(9600);
  Serial.println("");
  Serial.println("STARTUP");

  Wire.begin(SLAVE_ADDRESS);

//  Wire.onReceive(Serial.println("!!!!!!!!!!!"));
  Wire.onReceive(receiveData);
  Wire.onRequest(sendData);

  pinMode(13, OUTPUT);

Serial.println();
  for(int i= 0; i<5; i++){
  // turn the LED on (HIGH is the voltage level)
  digitalWrite(LED_BUILTIN, HIGH);
  // wait for a second
Serial.println("Blink");  
delay(200);
  // turn the LED off by making the voltage LOW
  digitalWrite(LED_BUILTIN, LOW);
   // wait for a second
  delay(200);
  }

}



void loop()
{
  Serial.print(".");

  static int a = 0;
  if (a >= 80){a = 0; Serial.println();}
  else a ++;
 
  delay(100);
}

// callback for received data
void receiveData(int byteCount)
{
  Serial.println("");
  Serial.println("onReceive");
  receivedLength = 0;
  memset(received, 0, sizeof(received)); 
  while(Wire.available())
  {
    byte b = Wire.read();
    if (receivedLength < MAX_SENT_BYTES)
    {
        received[receivedLength] = b;
        receivedLength++;
        Serial.print("Received: ");
        Serial.println(b);
    }
    else
      Serial.println("receivedLength >= MAX_SENT_BYTES");
   
    // else discard
  }

  if (receivedLength > 0) // we got a command, yay
  {
    Serial.println("receivedLength > 0");
    switch(received[0]){
      case COMMAND_MODE_IN:
          Serial.println("\tcommand: mode in");
	  pinMode(received[1], INPUT);
          Serial.print("\tPIN ");
          Serial.print((int)received[1]);
          Serial.println(" INPUT");
      break;

      case COMMAND_MODE_OUT:
         Serial.println("\tcommand: mode out");
	 pinMode(received[1], OUTPUT);
         Serial.print("\tPIN ");
         Serial.print((int)received[1]);
         Serial.println(" OUTPUT");
      break;
     

      case COMMAND_NOOP:
          Serial.println("\tcommand: noop");
          dataToSend[0] = COMMAND_NOOP;
      break;


      case COMMAND_WRITE:
          Serial.println("\tcommand: write");
	  if(received[2]) {
              digitalWrite(received[1], HIGH);
              Serial.print("\tPIN ");
              Serial.print((int)received[1]);
              Serial.println(" WRITE HIGH"); 
          }
          else {
              digitalWrite(received[1], LOW);
              Serial.print("\tPIN ");
              Serial.print((int)received[1], DEC);
              Serial.println(" WRITE LOW"); 
          }
      break;

      case COMMAND_READ:
          Serial.println("\tcommand: read");
	  dataToSend[0] = digitalRead(received[1]);
          Serial.print("\tPIN ");
          Serial.print((int)received[1]);
          Serial.println(" READ");
          
          if (dataToSend[0] == 0){
              Serial.print("\tPIN ");
              Serial.print((int)received[1], DEC);
              Serial.println(" is LOW");
          }
          else {
              Serial.print("\tPIN ");
              Serial.print((int)received[1], DEC);
              Serial.println(" is HIGH");
          }
      break;

      default:
          Serial.println("\tcommand: unknown");

          for(int i = 0; i < receivedLength; i++){
              Serial.print("\t");
              Serial.println(received[i]); 
          }
      break;
    }
  }
}

// callback for sending data
void sendData()
{
  Serial.println("");
  Serial.println("onRequest");
  Wire.write(dataToSend, sizeof(dataToSend));
}



/* blink
void setup()
{
  // initialize LED digital pin as an output.
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop()
{
  // turn the LED on (HIGH is the voltage level)
  digitalWrite(LED_BUILTIN, HIGH);
  // wait for a second
  delay(1000);
  // turn the LED off by making the voltage LOW
  digitalWrite(LED_BUILTIN, LOW);
   // wait for a second
  delay(1000);
}
*/
