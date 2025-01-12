import processing.serial.*; // biblioteca arduino
Serial Arduino;
int DateWrite=0;
boolean boton=true;
boolean boton3=true;
boolean led1 = true,led2 = true;

void setup(){
  printArray(Serial.list());
  background(255);
  fullScreen();
  Arduino = new Serial(this,Serial.list()[1],9600);
  Arduino.clear();
  print(Arduino);
}

void draw(){
  background(255);
  fill(255);
  strokeWeight(4);
  stroke(0);
  
  if(!boton3){ 
      fill(#73E44B);
      circle(width/2+124,height/2-310,50); //leds
      if(!boton){
      fill(#73E44B);
      circle(width/2+124,height/2-200,150); 
      led2 = false;
      }else{
      fill(255);
      circle(width/2+124,height/2-200,150);
      led2 = true;
    }
    
    if(led1){
      fill(255);
      circle(width/2+350,height/2-200,150);
    }else{
      fill(#73E44B);
      circle(width/2+350,height/2-200,150);
    }
    
  }else{
    fill(#73E44B);
    circle(width/2+350,height/2-310,50);
    if(!boton){
      fill(#73E44B);
      circle(width/2+350,height/2-200,150);
      led1 = false;
    }else{
      fill(255);
      circle(width/2+350,height/2-200,150);
      led1 = true;
    }
    
    if(led2){
      fill(255);
      circle(width/2+124,height/2-200,150);
    }else{
      fill(#73E44B);
      circle(width/2+124,height/2-200,150);
    }
    
  }
 
  fill(#FF0000);
  square(width/2-75,height/2+100,150);
  square(width/2+150,height/2+100,150);
  square(width/2+375,height/2+100,150);
  
  fill(#5BF26A);
  textSize(100);
  text("Botones:",width/2-550,height/2+180);
  text("LEDs:",width/2-550,height/2-180);
  
 
  if(Arduino.available()>0){ // busca si hay datos enviados del m serial de arduino
    DateWrite = Arduino.read(); //lee los datos y los iguala
    delay(100);
    if(DateWrite == 1){
       boton = false; 
    }
    if(DateWrite == 2){
       boton = true; 
    }
    if(DateWrite == 3){
      if(boton3){
         boton3 = false; 
     
        if(led2){
          boton = true;
        }else{
          boton = false;
        }
     
        }else{
          boton3 = true;
           
          if(led1){
            boton = true;
          }else{
            boton = false;
          } 
       }
    }
  }
}

void mousePressed(){ //al pesionar el mouse

 if((width/2-75)<mouseX && (height/2+100)<mouseY && (width/2+75)>mouseX && (height/2+250)>mouseY){
   Arduino.write(1);
   boton = false;
 }
 
 if((width/2+150)<mouseX && (height/2+100)<mouseY && (width/2+300)>mouseX && (height/2+250)>mouseY){
   Arduino.write(2);
   boton = true;
 }
 
 if((width/2+375)<mouseX && (height/2+100)<mouseY && (width/2+525)>mouseX && (height/2+250)>mouseY){
   Arduino.write(3);
   if(boton3){
     boton3 = false; 
     
     if(led2){
       boton = true;
     }else{
       boton = false;
     }
     
   }else{
     boton3 = true;
     
     if(led1){
       boton = true;
     }else{
       boton = false;
     }
     
   }
   
 }
 
delay(100);
}
