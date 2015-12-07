  //Image and font initalizations
PImage platform1;
PImage platform2;
PImage platform3;
PImage door;
PImage knight;
PImage knight2;
PImage chest;
PFont font;

//Declaration of Class variables
LevelDesign1 initialLevel1;
LevelDesign1 initialLevel2;
LevelDesign1 initialLevel3;
LevelDesign1 initialLevel4;
LevelDesign1 initialLevel5;
LevelDesign1 initialLevel6;

LevelDesign1 initialLevel9;
LevelDesign1 initialLevel10;
LevelDesign1 initialLevel11;

Knight myKnight;
Timer myTimer;


//Setup of frameRate and settings
void setup(){  
 size(420,500);
 font = createFont("Frutiger",20, true);
 textFont(font); 
 //initialLevel1 = new LevelDesign1();

 //Image loads
 platform1 = loadImage("Ground.PNG");  
 platform2 = loadImage("Ground2.PNG");
 platform3 = loadImage("Ground3.png");
 door = loadImage("Castle_Door.png");
 knight = loadImage("knight1.png");
 knight2 = loadImage("knight2.png");
 chest = loadImage("chest.png");
 
 //creation of class objects
 initialLevel1 = new LevelDesign1(0,450);
 initialLevel2 = new LevelDesign1(120,450);
 initialLevel3 = new LevelDesign1(220,450);
 initialLevel4 = new LevelDesign1(320,450);
 initialLevel5 = new LevelDesign1(420,450);
 initialLevel6 = new LevelDesign1(330,300);

 initialLevel9 = new LevelDesign1(250,400);
 initialLevel10 = new LevelDesign1(300,400);
 initialLevel11 = new LevelDesign1(360,400);

 myKnight = new Knight();
 myTimer = new Timer(5000);
 
}

void draw(){
 frameRate(1);
 background(200,200,100);
 //creation of class objects
 initialLevel1.levelBackground1();
 initialLevel2.levelBackground1();
 initialLevel3.levelBackground1();
 initialLevel4.levelBackground1();
 initialLevel5.levelBackground1();
 initialLevel6.levelBackground3();
 
 initialLevel9.levelBackground2();
 initialLevel10.levelBackground2();
 initialLevel11.levelBackground2();
 
 //after the 5 second timer goes out, begin moving knight
 if (myTimer.isFinished() == true){
    myKnight.move();  
    myKnight.display();
    
    
 }

}

boolean trigger = false;

class Knight{

int centerX, centerY;

 //constructor
 Knight(){
   
  centerX = 10;
  centerY = 380;
 }
 
 
 //display Knight and background scene changes
 void display() {
   
   //if the knight hasn't made it to the door keep first scene
   if ((centerX >= 330 && centerX <=420) && centerY == 335){
     trigger = true; 
    background(0,0,0);
    
   }
   
   //if trigger is true show second scene
   if (trigger == true){
     background(0,0,0);    
     image(platform3, 0,390);
     image(knight2, centerX, centerY);  
     fill(255,0,0);
     text("CONGRATS! You found the treasure!", 50,100);
     
     image(chest, 15,360);     
   }
   
   //if trigger is false keep first scene
   if (trigger == false){
    image(knight, centerX, centerY);  
   //ellipse(centerX, centerY, 40, 80);
   }
   
 
 }

//function to move knight
 void move() {
    if(keyPressed){
      if(key == 'w'){
        print("y: " + centerY + " ");
        print("x: " + centerX + " ");
        //print(" " + centerY + " ");
        
        //knight on second landing don't go higher than it
        if(centerY- 15 <= 335 && (centerX >=220 && centerX <=420)) {
          centerY = 335;
        }
        //else if the knight is before the second landing don't let him go above it
        else if(centerY- 15 <= 380 && (centerX >=0 && centerX <220)) {
          centerY = 380;
        }           
        //else move him up
        else{
            centerY = centerY - 15;
        }
      }
      
      if(key == 'a'){
        
        print(" left: " + centerX + " ");
        //don't let knight go off of left side of scene
        if (centerX - 15 <= 0 ){
           centerX = 10;
        } 
        else{
        //move left
        centerX = centerX - 15;
        }  
      }
      
      if(key == 'd'){
        //don't let knight go off of right side of scene
        print(" right: " + centerX + " ");
        if (centerX + 15 >= 340) {
              centerX = 340; 
        }
        else {
        //else move forward
        centerX = centerX + 15;
        }  
      } 
      if(key == 's'){
         print(" down: " + centerY + " ");

       //if the knight is on the first landing, don't let him go lower than it
        if(centerY+15 > 380) {
          centerY = 380;
        }
        //else move the knight down
        else{
          centerY = centerY + 15;
        }
      }
      }
    }

}

class LevelDesign1 {
  
  int x, y, bWid, bHei;
  
   LevelDesign1(int boxX, int boxY){
    x = boxX;
    y = boxY;    
  }
  
  //platform levels for background [original class]
  void levelBackground1(){
    image(platform1, x, y);  
  }
  void levelBackground2(){
    image(platform2, x, y);  
  }
  void levelBackground3(){
    image(door, x, y);  
  }
  
  
  
}

class Timer{
  
  int savedTime;  // When Timer started
  int totalTime;  // How long Timer should last
  
  // The constructor, set how long the Timer last with integer value
  Timer(int _totalTime){
    totalTime = _totalTime;
  }
  
  // Start the Timer
  void start() {
    savedTime = millis();
  }
  
  boolean isFinished() {
   // check how much time has passed
   

   int passedTime = millis() - savedTime;
   
   if (passedTime > totalTime) {
     text("Travel to the Door", 15,50);
     text("Controls:",15,100);
     text("D:Go Right",15,120);
     text("A:Go Left",15,140);
     text("W:Go Up",15,160);
     text("S:Go Down",15,180);
     return true;
   } else {
     text("Game will begin in 5 seconds: " + (passedTime/1000 + 1) + " secs", 15,50);
     return false;
   }
  }
}
