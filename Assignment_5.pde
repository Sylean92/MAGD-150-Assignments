  int grapeCount = 10; 
 int grapePosX = 100;
 int grapePosY = 300;
 boolean newState = false;
 PFont font;
 boolean stopCreate = true;
 boolean breakMouse = false;
 boolean save = false;
 
void setup(){
  size(800,500);
  font = createFont("Frutiger",20, true);
 textFont(font); 
  frameRate(1);
 }
 
void draw(){
 //print(breakMouse);
 print("Save: " + save);
 
  if (breakMouse == false){

    //if (save == true){
      // frameRate(10);
     //  background(0,255,0);
     //  fill(255,0,0);
     //  text("GOOD JOB!!!! You Saved a Grape!", width/2, height/2);
     //  save = false;
   // }
    
  font = createFont("Frutiger",20, true);
  textFont(font);

  background(255);
  text("YUM!! Can't wait to EAT these grapes!", 150,50);
    
  drawTable();
  drawPlate();
  drawGrapes();
  text("YUM!! Can't wait to EAT these grapes!", 150,50);  
  
  fill(255,0,0);  
  text("Oh NOOOO! He is gonna eat us!!!", 430,300);
  text("WE SHOULD RUN!", 450,450);
  text("I don't want to get eaten!", 100,350);  
  fill(0,0,0);
  }
  
  //Start moving the one grape to save him
  if (mousePressed){    
    //if breakMouse is true then mousePressed is breaked and screen is reset
    if( breakMouse == true){
      restart();
      loop();
     // save = true;
      breakMouse = false;      
      
      //if breakMouse is false then mousePressed is active and you can move grape
    }else{
    breakMouse = false;    
    background(255);
    fill(0,0,0);
    text("Keep clicking mouse to save the grape!", 50,15);    
    fill(66,2,70);
    runGrape();                
    text("WHERE ARE YOU GOING??", 150,80);
    newTable();
    newPlate();
    Grapes();       
    fill(255,0,0);
    text("YOU CANT GET ME!!", 450,250);
    }
   }
}
//Rest of Functions bellow

//move the running grape
void runGrape(){
  print(" " +  grapePosX + " " );
  
  if (grapePosX >= 800){        
    breakMouse = true;    
  }
    grapePosX = grapePosX + 100;    
}
//make scene 2's plate
void newPlate(){
    fill(255);
  strokeWeight(2);
   stroke(0,0,0);
  ellipse(0,300,500,300);
  ellipse(0,300,450,250);  
}
//make scene 2's table
void newTable(){
 strokeWeight(0);
 stroke(0,0,0);
 fill(87,67,6);
 rect(0,100,width,400); 
}
void drawGrapes(){  
   //determine how many grapes will be created on plate (5 to 10) and create the grape
  for(int i=0; i < numberOfGrapes(); i++){    
     updateGrapePosition();   
  }
    noLoop();
}
//draw plate background
void drawPlate(){
  fill(255);
  stroke(0,0,0);  
  strokeWeight(2);
  ellipse(300,300,500,300);
  ellipse(300,300,450,250); 
}
//draw table background
void drawTable(){
 strokeWeight(0);
 fill(87,67,6);
 rect(0,100,width,400);
}
//determine the random number of grapes created
int numberOfGrapes(){ 
 int grapeC = round(random(3,10)); 
  //print(grapeC);
  return grapeC;
}
//update position of each grape
void updateGrapePosition(){
 if (grapePosX >= 300){
     grapePosX = grapePosX -30;
    }
    grapePosX = grapePosX + 30;
    Grapes(); 
}

//create each Grape
void Grapes(){
  stroke(0,0,0);  
  strokeWeight(1);

  fill(66,2,70);
  //grape Body
  ellipse(grapePosX, grapePosY, 30,30); 
  strokeWeight(5);
  //grape eyes
    stroke(255);
  point(grapePosX-5,grapePosY-5);
  point(grapePosX+4, grapePosY-5); 
  rect(grapePosX-5, grapePosY+5, 8,.5);
}
void mousePressed(){
  loop();  
}
//reset main values of grapes
void restart(){
 grapeCount = 10;
 grapePosX = 100;
 grapePosY = 300;
}
