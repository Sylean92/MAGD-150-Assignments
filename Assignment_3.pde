  int forward = 0;

//bullet
int bulletP1X = mouseX+248;
int bulletP1Y =mouseY+100; 
int bulletP2X = mouseX+207;
int bulletP2Y = mouseY+100;
int bulletRextX = mouseX+215;
int bulletRextY = mouseY+95;
int bulletT1X = mouseX+240;
int bulletT1Y = mouseY+100;
int bulletT2X = mouseX+215;
int bulletT2Y = mouseY+100;

void setup(){
  
size(1300,810);  
  
}

void draw(){
  
  background(0,0,0);
  
  strokeWeight(5);
  stroke(255,255,255);  
  //stars
  point(60,70);  
  point(400,300);
  point(100,90);
  point(150,120);
  point(200,200);
  point(230,100);
  point(400,400);
  point(100,400);
  point(60,700);  
  point(1000,300);
  point(900,90);
  point(910,500);
  point(600,500);
  point(620,300);
  point(1100,200);
  point(100,600);
  point(700,800);  
  point(400,750);
  point(350,550);
  point(1200,600);
  point(1250,200);
  point(900,700);
  point(950,750);
  point(1250,750);
  
  fill(121,17,17);
  strokeWeight(1);
  stroke(0,0,0);

  triangle(mouseX+20,mouseY+50,mouseX+20,mouseY+150,mouseX+200,mouseY+100);
  fill(255,255,210);
  triangle(mouseX+150,mouseY+87,mouseX+150,mouseY+113,mouseX+200,mouseY+100);
  
  //Left wing of Space Ship
  beginShape();
  stroke(255,255,255);
    fill(121,17,17);
    vertex(mouseX+20,mouseY+50);
    vertex(mouseX+40,mouseY+40);
    vertex(mouseX+200,mouseY+95);
    vertex(mouseX+200,mouseY+105);
  endShape();

  //Right wing of Space Ship
  beginShape();
  stroke(255,255,255);
    fill(121,17,17);
    vertex(mouseX+20,mouseY+150);
    vertex(mouseX+40,mouseY+160);
    vertex(mouseX+200,mouseY+105);
    vertex(mouseX+200,mouseY+100);
  endShape();

  //Inside white banner of Space Ship (top)
  beginShape();
  stroke(255,255,255);
    fill(255,255,255);
    vertex(mouseX+20,mouseY+65);
    vertex(mouseX+55,mouseY+85);
    vertex(mouseX+150,mouseY+90);
    vertex(mouseX+150,mouseY+100);
    vertex(mouseX+20,mouseY+100);
  endShape();

  //Inside white banner of Space Ship (bottom)
  beginShape();
    vertex(mouseX+20,mouseY+135);
    vertex(mouseX+55,mouseY+115);
    vertex(mouseX+150,mouseY+112);
    vertex(mouseX+150,mouseY+100);
    vertex(mouseX+20,mouseY+100);
  endShape();

  //White back of ship behind the cockpit
  beginShape();
    fill(255,255,255);
    vertex(mouseX+5,mouseY+80);
    vertex(mouseX+20,mouseY+65);
    vertex(mouseX+20,mouseY+135);
    vertex(mouseX+5,mouseY+115);  
  endShape();
  
  fill(0,0,0);
  ellipse(mouseX+30,mouseY+100,30,20);
  ellipse(mouseX+60,mouseY+70,10,10);
  ellipse(mouseX+60,mouseY+130,10,10);
  stroke(0,0,0);
  
  //square shapes inside ship
  fill(255,255,255);
  stroke(0,0,0);
  rect(mouseX+100,mouseY+95,50,10);
  rect(mouseX+105,mouseY+98,40,4);
  
  //line design inside white part of Space Ship
  line(mouseX+20,mouseY+100,mouseX+60,mouseY+70);
  line(mouseX+30,mouseY+110,mouseX+60,mouseY+130);

  //This changes the background and wing color of Space Ship
  if(mousePressed){
   
  fill(217,200,11);
  background(9,35,80);
  
  strokeWeight(1);
  stroke(0,0,0);

  triangle(mouseX+20,mouseY+50,mouseX+20,mouseY+150,mouseX+200,mouseY+100);
  fill(255,255,210);
  triangle(mouseX+150,mouseY+87,mouseX+150,mouseY+113,mouseX+200,mouseY+100);
  
  //Left wing of Space Ship
  beginShape();
  stroke(255,255,255);
    fill(121,17,17);
    vertex(mouseX+20,mouseY+50);
    vertex(mouseX+40,mouseY+40);
    vertex(mouseX+200,mouseY+95);
    vertex(mouseX+200,mouseY+105);
  endShape();

  //Right wing of Space Ship
  beginShape();
  stroke(255,255,255);
    fill(121,17,17);
    vertex(mouseX+20,mouseY+150);
    vertex(mouseX+40,mouseY+160);
    vertex(mouseX+200,mouseY+105);
    vertex(mouseX+200,mouseY+100);
  endShape();

  //Inside white banner of Space Ship (top)
  beginShape();
  stroke(255,255,255);
    fill(255,255,255);
    vertex(mouseX+20,mouseY+65);
    vertex(mouseX+55,mouseY+85);
    vertex(mouseX+150,mouseY+90);
    vertex(mouseX+150,mouseY+100);
    vertex(mouseX+20,mouseY+100);
  endShape();

  //Inside white banner of Space Ship (bottom)
  beginShape();
    vertex(mouseX+20,mouseY+135);
    vertex(mouseX+55,mouseY+115);
    vertex(mouseX+150,mouseY+112);
    vertex(mouseX+150,mouseY+100);
    vertex(mouseX+20,mouseY+100);
  endShape();

  //White back of ship behind the cockpit
  beginShape();
    fill(255,255,255);
    vertex(mouseX+5,mouseY+80);
    vertex(mouseX+20,mouseY+65);
    vertex(mouseX+20,mouseY+135);
    vertex(mouseX+5,mouseY+115);  
  endShape();
  
  fill(0,0,0);
  ellipse(mouseX+30,mouseY+100,30,20);
  ellipse(mouseX+60,mouseY+70,10,10);
  ellipse(mouseX+60,mouseY+130,10,10);
  
  stroke(0,0,0);
  
  //square shapes inside ship
  fill(255,255,255);
  stroke(0,0,0);
  rect(mouseX+100,mouseY+95,50,10);
  rect(mouseX+105,mouseY+98,40,4);
  
  //line design inside white part of Space Ship
  line(mouseX+20,mouseY+100,mouseX+60,mouseY+70);
  line(mouseX+30,mouseY+110,mouseX+60,mouseY+130);
  
  }
  
  //If the key is pressed, shoot the bullet from the Space Ship
  if (keyPressed == true){
    
     fill(150,0,0);
    // rect(mouseX+200, mouseY+ 130, 300,10);
    
  //bullet
  bulletP1X = mouseX+248;
  bulletP1Y =mouseY+100; 
  bulletP2X = mouseX+207;
  bulletP2Y = mouseY+100;  
  bulletRextX = mouseX+215;
  bulletRextY = mouseY+95;
  bulletT1X = mouseX+515;
  bulletT1Y = mouseY+100;
  bulletT2X = mouseX+217;
  bulletT2Y = mouseY+100;
  
  //bullet body
  strokeWeight(1);
  //fill(255,255,255);
  rect(bulletRextX,bulletRextY,300,10);

  //TWO_PI IS FULL CIRCLE
  //PI + HALF_PI == 1.5 PI == -0.5 PI
  //TAU + HALF_PI == TWO_PI + HALF_PI == 2.5 PI == 0.5 PI
  
  //round ends of bullet
  arc(bulletT1X,bulletT1Y,12,12,-HALF_PI, HALF_PI);
  arc(bulletT2X,bulletT2Y,13,12,radians(90),radians(270));  
  

}
    
  }
  
   
  
