#define led_1 9
#define led_2 10
#define boton_1 13
#define boton_2 12
#define boton_3 11
int led = led_1;
bool a=true;
void setup() {
  pinMode(boton_1,INPUT);
  pinMode(boton_2,INPUT);
  pinMode(boton_3,INPUT);
  pinMode(led_1,OUTPUT);
  pinMode(led_2,OUTPUT);
}

void loop() {

  if(digitalRead(boton_1)==HIGH){
    delay(20);
    digitalWrite(led,LOW);
    int i=0;
    for(i=0;i<256;i++){
      analogWrite(led,i);
      delay(5);
    }
  }

  if(digitalRead(boton_2)==HIGH){
    delay(20);
    digitalWrite(led,HIGH);
    int i = 256;
    for(i=256;i>=0;i--){
      analogWrite(led,i);
      delay(5);
    }
  }
  if(digitalRead(boton_3)){
    if(a){
      led = led_2;
      a = false;
      delay(200);
    }else{
      led = led_1;
      a = true;
      delay(200);
    }
  }
}
