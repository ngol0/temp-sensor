#include <dht.h>
#include <LiquidCrystal.h>

LiquidCrystal lcd(7, 8, 9, 10, 11, 12);

dht DHT;

#define DHT11_PIN 4

int redPin = 3;
int bluePin = 5;
int greenPin = 6;

void setup(){
  lcd.begin(16, 2);
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);  
}

void loop()
{
  int chk = DHT.read11(DHT11_PIN);
  lcd.setCursor(0,0); 
  lcd.print("Temp: ");
  lcd.print(DHT.temperature);
  lcd.print((char)223);
  lcd.print("C");
  lcd.setCursor(0,1);
  lcd.print("Humidity: ");
  lcd.print(DHT.humidity);
  lcd.print("%");

  if (DHT.temperature >= 20 && DHT.temperature <= 26)
  {
    setColor(50, 255, 0);
    delay(5000);
    setColor(0, 255, 0);
    //setColor(0, 100, 50); 
  }
  else if (DHT.temperature < 20 && DHT.temperature >= 15)
  {
    setColor(0x4B, 0x0, 0x82);
  }
  else if (DHT.temperature < 15)
  {
    setColor(0, 0, 255);
  }
  else if (DHT.temperature > 26)
  {
    setColor(255,0,0);
  }
  
  delay(5000);
}

void setColor(int red, int green, int blue)
{
  analogWrite(redPin, red);
  analogWrite(greenPin, green);
  analogWrite(bluePin, blue);  
}
