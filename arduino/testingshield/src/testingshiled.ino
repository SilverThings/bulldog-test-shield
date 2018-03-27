#include <Wire.h>

#define SLAVE_ADDRESS 0x04
#define  MAX_SENT_BYTES 3

#define COMMAND_MODE_IN  0b00010000
#define COMMAND_MODE_OUT 0b01010000
#define COMMAND_WRITE    0b00100000
#define COMMAND_READ     0b00010001
#define COMMAND_NOOP     0b00010101

#define COMMAND_RESET    0b00000111


byte dataToSend[1];
byte received[MAX_SENT_BYTES];
int receivedLength = 0;


int number = 0;
int state = 0;

void setup()
{
  //pinMode(13, OUTPUT);
  Serial.begin(9600); // deubg

  Wire.begin(SLAVE_ADDRESS);

  Wire.onReceive(receiveData);
  Wire.onRequest(sendData);

}

void loop()
{
  delay(100);
}

// callback for received data
void receiveData(int byteCount)
{
  Serial.println("receiveData");
  receivedLength = 0;
  memset(received, 0, sizeof(received));
  while(Wire.available())
  {
    byte b = Wire.read();
    if (receivedLength < MAX_SENT_BYTES)
    {
        received[receivedLength] = b;
        receivedLength++;
    }
    // else discard
  }

  if (receivedLength > 0) // we got a command, yay
  {
    switch(received[0]){
      case COMMAND_MODE_IN:
      Serial.println("COMMAND_MODE_IN");
	  pinMode(received[1], INPUT);
	break;

      case COMMAND_MODE_OUT:
      Serial.println("COMMAND_MODE_OUT");
	  pinMode(received[1], OUTPUT);
	break;

      case COMMAND_WRITE:
      Serial.println("COMMAND_WRITE");
	  if(received[2]) digitalWrite(received[1], HIGH);
	  else digitalWrite(received[1], LOW);
	break;

      case COMMAND_READ:
      Serial.println("COMMAND_READ");
	dataToSend[0] = digitalRead(received[1]);
	break;

      case COMMAND_NOOP:
      Serial.println("COMMAND_NOOP");
        dataToSend[0] = 0b1;

      default:
	break;
    }
  }
}

// callback for sending data
void sendData()
{
  Serial.println("sendData");

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
