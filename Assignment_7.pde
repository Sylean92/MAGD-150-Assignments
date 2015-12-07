  //Image and font initalizations
PImage piano;
PImage musicNotes;
PFont font;

//Declaration of keys and Music Notes
KeyObjects myKey;
KeyObjects myKey2;
KeyObjects myKey3;
KeyObjects myKey4;
KeyObjects myKey5;
KeyObjects myKey6;
KeyGen playNote1;

//Global Variables
int xV = 100;
int yV = 100;
int keyChosen;


//Setup of frameRate and settings
void setup(){
 frameRate(1);  
 size(900,800);
 font = createFont("Frutiger",30, true);
 textFont(font); 

 //Image loads
 piano = loadImage("piano1.png");
 musicNotes = loadImage("music-01.jpg");
 
 //creation of class objects
 myKey = new KeyObjects(325,417,22,48);
 myKey2 = new KeyObjects(369,417,22,48);
 myKey3 =  new KeyObjects(411,417,22,48);
 myKey4 = new KeyObjects(454,417,22,48);
 myKey5 = new KeyObjects(497,417,22,48);
 myKey6 = new KeyObjects(538,417,22,48);
 playNote1 =  new KeyGen();
}

void draw(){
 frameRate(1);
 background(200,150,10);
 tint(255, 255);  
 image(piano, 300, 200);

   //loops and creates each every other keys on top of image 
   myKey.create();
   myKey2.create();
   myKey3.create();
   myKey4.create();
   myKey5.create();
   myKey6.create();
   
   //randomizes which key is played
   keyChosen = round(random(5));
   
   //when keyChosen is selected it will generate the random colors on top of keys
   if (keyChosen == 0) {
       myKey.playKey();
       fill(200,150,10);
       playNote1.create();
       playNote1.move();
   }
   else if (keyChosen == 1) {
     myKey2.playKey();
     fill(200,150,10);
     playNote1.create();
     playNote1.move();
   }
   else if (keyChosen == 2){
     myKey3.playKey();
     fill(200,150,10);
     playNote1.create();
     playNote1.move();
   }
   else if (keyChosen == 3){
     myKey4.playKey();
     fill(200,150,10);
     playNote1.create();
     playNote1.move();
   }
   else if (keyChosen == 4){
     myKey4.playKey();
     fill(200,150,10);
     playNote1.create();
     playNote1.move();
   }
   else if (keyChosen == 5){
     myKey5.playKey();
     fill(200,150,10);
     playNote1.create();
     playNote1.move();
   }   
}

//KeyObject Class
class KeyObjects {
  
    int xVal, yVal, widthVal, heightVal;
  
  //Constructor
   KeyObjects(int _xVal, int _yVal, int _width, int _height){

     xVal = _xVal;
     yVal = _yVal;
     widthVal = _width;
     heightVal = _height;
       
   }
     
   //Creates each rectangle key on the piano image  
   void create(){
     
     fill(255,255,255, 200);
     noStroke();
     tint(255,127);
     rect(xVal, yVal, widthVal, heightVal);
   }    

   //function that colors the keys
   void playKey(){
    //print(" " + keyChosen + " ");
    int RGB1 = round(random(0,255));
    int RGB2 = round(random(0,255));
    int RGB3 = round(random(0,255)); 
    
    fill(RGB1, RGB2, RGB3);
    rect(xVal, yVal, widthVal, heightVal);    
   }
 
}

//Class KeyGen that creates the random movements of key Notes
class KeyGen {
  
  int keyX, keyY;
  
  //Constructor
  KeyGen(){
    
    keyX = round(random(0,800));
    keyY = round(random(100,800));
  }    
  
  //Create the Music Note
  void create(){
   // print(" " + keyX + " " + keyY + " ");
    fill(0,0,0);
    ellipse(keyX-5, keyY, 30,20);
    //
    rect(keyX, keyY-50, 10,50);
    rect(keyX, keyY-60, 30,10);

  }
  
  //Move the music Note
  void move(){
    
   print(" " + keyX + " " + keyY + " "); 
   
   keyX = round(random(100,800));
   keyY = round(random(100,800)); 
   
   //if statements to fluctuate the position of the random Music Note location
    if (keyX >= 280 && keyX <= 380){
      
       keyX = keyX -100;
       
    }
    else if (keyX >= 381 && keyX <= 480){
      
      keyX = keyX - 200;
      
    }
    else if (keyX >= 481 && keyX <= 600){
      
      keyX = keyX + 200;
      
    }
    if (keyY >= 180 && keyX <= 280){
      
       keyX = keyX -100;
       
    }
    else if (keyX >= 281 && keyX <= 380){
      
      keyX = keyX - 200;
      
    }
    else if (keyX >= 381 && keyX <= 500){
      
      keyX = keyX + 200;
      
    }
   
  }
  
}
  
//Changes to next state that is more colorful
void mousePressed(){
  frameRate(.1);
  background(musicNotes);
  fill(255,0,0);
  text("I love the sound that the piano makes!",100,100);
 
}
