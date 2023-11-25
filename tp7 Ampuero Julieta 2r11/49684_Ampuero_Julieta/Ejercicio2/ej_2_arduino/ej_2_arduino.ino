#include "LED.h"

#define led1 9
#define led2 10
#define boton1 13
#define boton2 12
#define boton3 11

LED led(led1,led2);

void setup() {
  pinMode(boton1,INPUT);
  pinMode(boton2,INPUT);
  pinMode(boton3,INPUT);
  pinMode(led1,OUTPUT);
  pinMode(led2,OUTPUT);
  Serial.begin(9600);
}

void loop() {

  if(digitalRead(boton1)){
    Serial.write(1);
    led.SlowUpLed();
  }

  if(digitalRead(boton2)){
    Serial.write(2);
    led.SlowDownLed();
  }
  if(digitalRead(boton3)){
    Serial.write(3);
    led.ChangeLed();
  }

  if(Serial.available()>0){
    int ValorRecivido = Serial.read();
    switch(ValorRecivido){
      case 1:
        led.SlowUpLed();
        break;
      case 2:
        led.SlowDownLed();
        break;
      case 3:
        led.ChangeLed();
    }
  }
}