 //6 diff shapes
//2 Text()
// 2 Variables
//use mousePressed

int crossT1bottomY = 300;
int crossT2bottomY = 550;
PFont font;

void setup(){
  
  size(1281,801);
  font = createFont("Frutiger",25, true);
  textFont(font);
}

//False Dilemma... also known as black-and-white
//Your are either with God or against him.

void draw(){
  
  background(255,255,255);
  stroke(200,150,30);
  fill(200,150,30);
  
  rect(400,400,250,50);
  rect(495,300,60,250);
  fill(200,160,30);
  triangle(495,crossT1bottomY,555,crossT1bottomY,525,380);
  triangle(495,crossT2bottomY,555,crossT2bottomY,525,480);

  //heart
  fill(255,0,0);
  stroke(255,0,0);
  arc(300,300,30,30,-PI, 0+PI);
  arc(325,300,30,30,-PI, 0+PI);

  beginShape();
    strokeWeight(2);
    vertex(288,310);
    vertex(315,345);
    vertex(337,310);
  endShape();
   
  
  text("You are either with God...", 750,430);
  
  if(mousePressed){
    
   background(0,0,0);
   stroke(255,0,0);
   fill(255,0,0);
   
   text("False Dilemma.", 525,100);
   font = createFont("Frutiger",15, true);
   textFont(font);
   text("The fallacy is also known as 'black and white', where only 2 options or outcomes are provided and make it seem like there is only two possibilities.", 150,150);
   
   strokeWeight(10);
   stroke(255,0,0);
   fill(0,0,0);
   ellipse(525,430,350,350);
   
   fill(255,0,0);
   line(450,275,650,550);
   
   strokeWeight(1);
   rect(400,400,250,50);
   rect(495,300,60,250);
   fill(220,0,0);
   triangle(495,crossT1bottomY,555,crossT1bottomY,525,380);
   triangle(495,crossT2bottomY,555,crossT2bottomY,525,480);  
   font = createFont("Frutiger",25, true);
   textFont(font);
   text("or against him!", 750,430);
    
  }
  
}
  
  </script>
  <canvas id="mycanvas3"></canvas>
  
  <h1>Assignment 6 - Save the Grape!</h1>
  
  <script type="text/processing" data-processing-target="mycanvas6">
  
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
