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
