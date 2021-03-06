//Overview of Final:
/*
  The current project is a short arcade style video game mockup.
  The concept of this game is that you are a Mage Character trying to fight off the evil monsters trying to take over the world.
  As the Mage, you will control him with keys W, A, S & D to navigagte. To attack the monsters you will use the mouse to click and shoot the Mage's beam.
  
  When the Mage's beam collides with the Monsters, then the Hero kills it and gains a point.
  
  The theme of this game reminds me of various PC MMO's given that a Mage is involved.
  So I wanted to do a twist on an arcade game that looks like an arcade/pixel game but give a little feel of MMO's based on the character choice.
*/

int j;
PImage hero;
PImage monster;
PImage moon;
PImage sad;
PImage happy;
boolean monLoses = false;

Hero myhero;
Monsters myMonsters1;
Monsters myMonsters2;
Stars myStars;

int starX = 200;
int starY = 100;
int max = 15;
int[] numMonsters = new int[max];
int MonCounter = 0;
int MonY = 0;
int MonX = 650;
int MonWins = 0;
int HeroWins = 0;
boolean gameOver = false;


Timer myTimer;

void setup(){
  
    size(800,650);
//    println("Starx:"+starX+" Stary:"+starY);
    j=0;

    //Declare Image files
    hero = loadImage("mage1.png");
    monster = loadImage("monster.png");
    moon = loadImage("moon.png");
    sad = loadImage("sad.png");
    happy = loadImage("happy.png");
    //Declare Classes
    myhero = new Hero();
    myStars = new Stars();
    myMonsters2 = new Monsters(900,300);
      
    //Set the random Y axis position of Monsters
    for(int i=0; i < max; i++){   
      int ran1 = round(random(0, height/4));
      numMonsters[i] = ran1;
  //    println("ran1:"+ran1);
    }
    
    myTimer = new Timer(5000);
      
}

//delay for 3 seconds timer
void delay(int delay)
    {
      int time = millis();
      while(millis() - time <= delay);
    }

void draw(){
  
    //frameRate(1);
    frameRate(60);     
    //Star background with ScoreBoard
    background(0,0,0);
    fill(255,0,0);
    line(415,0,415,height);

    
   
     
     if (myTimer.isFinished() == true){
       
     text("Monster Wins: " + MonWins, 200,50); 
     text("Player Wins: " + HeroWins, 200,100);

     //Addition of normal processing shape [stary background]
     myStars.drawStars();
     //Moon background
     image(moon,40,40);     
     //Display Hero which changes by keyPressed      
       
     myhero.move();
     myhero.display();
      
     
     //If the Monster count loop ends, end program and tell user who won
     if (gameOver == true){
     
       
       //Display Third State - ending screen
       delay(3000);
       background(0,0,0);
        if (HeroWins > MonWins){
          
         text("CONGRATS YOU WON!", height/2, width/2);
         
        }
        else{
          
          text("YOU LOST. GOOD LUCK NEXT TIME!", height/2, width/2);
        }
        noLoop();         
      }
     
     //Loop through array of Y positions of Monter characters
     if (MonCounter < max){
       
       //if Monster Count is less than 5 display monsters and increment their position on X axis
       MonY = numMonsters[MonCounter];
       //move monster
       MonX = MonX - 5;
       //Call class
       myMonsters1 = new Monsters(MonX, MonY);
       //Display Monster's new position
       myMonsters1.display();
       
       //if the Monster crosses the white line, Create Second State Screen and create the new Monster
       if (MonX <= 300 && monLoses == false){
         //frameRate(.5);
         
         //Second State********
         frameRate(1);
         background(255,0,0);
         textSize(15);
         text("Monster Passed the Line!", 400, 200);
         image(sad, 400,400);

         //increment Monster Wins
         MonWins = MonWins + 1;
         fill(0,0,0);
         text("Monster Wins: " + MonWins, 200, 50); 
         //Increment if statement
         MonCounter++;
          
          //reset Monster X position
          MonX = 650; 
       }
       else if (monLoses == true && MonX > 300){
          frameRate(1);
          HeroWins = HeroWins + 1;
          background(255);
          image(happy,400,400);
          fill(0,0,0);
          
          textSize(15);
          text("Hero Won this round!", 400, 200);
          
          text("Player Wins: " + HeroWins, 200,100);
          MonCounter++;
          MonX = 650;
          monLoses = false;      
     }
     }
     //end game
      else{        
        gameOver = true;       
      }    
     }
     
    //<>//

}

//Determines collision of Hero beam to monster
void mousePressed(){
       
       int beamRightX = 0, beamRightY = 0;
       int monLeftX = 0, monPositionY = 0;
       
       myhero.shoot();   
       
       //pull hero beam location and monster location functions
       beamRightX = myhero.returnX();
       beamRightX = beamRightX + 100;
       beamRightY = myhero.returnY();
       monLeftX = myMonsters1.returnX();
       monPositionY = myMonsters1.returnY();

       println("HeroBeamX:" + beamRightX + " HeroBeamY:" + beamRightY);
       println("MonsterX:" + monLeftX + " MonsterY:" + monPositionY);
 
       //if beam and monster collide start trigger to give hero a point 
       if ( (beamRightX >= monLeftX) && (beamRightX - 100 <= monLeftX + 150) && ( (beamRightY +5 >= monPositionY) && (beamRightY +5 <= monPositionY+150) ) )
       {
       monLoses = true;
       //frameRate(1);
       //background(255);
       }
       
        
}

//Class 1

//Hero Class

int energyBeamX, energyBeamY;

class Hero{
  int x, y;
  
   Hero(){
  
  }
  
void display(){
    image(hero,x,y);
  }
  
  //separate detection from code execution
  //see which key is being pressed and point it to a variable that locks (boolean)
     //is W pressed? = yes... is boolean true?... yes... execute code
  void move() {
    if(keyPressed){
      if(key == 'w'){
        y = y - 5;
      } 
      if(key == 'a'){
        x = x - 5;
      }
      if(key == 'd'){
        x = x + 5;
      } 
      if(key == 's'){
       y = y + 5;
      }
    }
  }
  
  //shoot hero beam to attack monsters
  void shoot(){

        //set rectangle left x point from character
        energyBeamX = x;
        energyBeamY = y;
        energyBeamX = energyBeamX + 200;
        energyBeamY = energyBeamY+85;
        rect(energyBeamX,energyBeamY,100,10);       
        
            
  }
 
  //grab beam's X
  int returnX(){
    int myReturn  = energyBeamX;
    return myReturn;
  }
  //grab beam's Y
    int returnY(){
    int myReturn  = energyBeamY;
    return myReturn;
  }
}

//Class2

//Hero Class
  int losses = 0;
 
class Monsters{
  int Mx, My;
  
   Monsters(int boxX, int boxY){
    Mx = boxX;
    My = boxY;    
  }
 
//display the Monsters
void display(){
  
    if (Mx <= 200){
      losses = losses + 1;
       text("Monster Wins: " + losses, 100,200);   
    }else{
      Mx = Mx+1;
      
    image(monster,Mx,My);
    }
  }
  
  //separate detection from code execution
  //see which key is being pressed and point it to a variable that locks (boolean)
     //is A pressed? = yes... is boolean true?... yes... execute code
  void move() {
    if(keyPressed){
      if(key == 'a'){
        Mx = Mx - 5;
      }
      if(key == 'd'){
        Mx = Mx + 5;
      } 
    }
  }
 
 //return Monter's X
  int returnX(){
    int myReturn  = Mx;
    return myReturn;
  }
  //return Monster's Y
    int returnY(){
    int myReturn  = My;
    return myReturn;
  }
  
  
}

//Class3

//Creates a random generated star background for the game
class Stars{
  
Stars(){
    
  }  
   //determine how many starts will be created    
int numberOfStars(){ 
 int stars = round(random(8,20)); 
  return stars;
}

//display starts based on numberOfStarts function
void drawStars(){  

  for(int i=0; i < numberOfStars(); i++){    
     updateStarPosition();   
    // println("Star: " + i);
  }
}

//update position of each grape
void updateStarPosition(){
  
  starX = round(random(0, width));
  starY = round(random(0, width));
  
 if (starX >= 700){
     starX = starX -30;
    }
    else{
     // println("Starx:"+starX+" Stary:"+starY);
    starX = starX + 30;
    //println("Starx:"+starX+" Stary:"+starY);
    }
 if (starY >= 400){
     starY = starY -30;
 }
   else{ 
    // println("Starx:"+starX+" Stary:"+starY);
    starY = starY + 30;
   // println("Starx:"+starX+" Stary:"+starY);
   }
   
   //println("X: " + starX + " Y: " + starY);
    StarsDraw();
}

//create start shape
void StarsDraw(){
  stroke(255);  
  strokeWeight(5);
  fill(255);
  point(starX, starY);
}
 
  
}

//Class4

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
   
   //if the time is passed show controls for users
   if (passedTime > totalTime) {
     textSize(10);
     text("Kill Monsters Before they Pass the White Line!", 15,400);
     text("Controls:",15,420);
     text("D:Go Right",15,440);
     text("A:Go Left",15,460);
     text("W:Go Up",15,480);
     text("S:Go Down",15,500);
     return true;
   } else {
     text("Game will begin in 5 seconds: " + (passedTime/1000 + 1) + " secs", 15,50);
     return false;
   }
  }
}

