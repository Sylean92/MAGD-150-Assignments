  int ghostBPosx = 300;
 int ghostBPosy = 400;
 int ghostELPosx = 330;
 int ghostELPosy = 370;
 int ghostERPosx = 270;
 int ghostERPosy = 370;

 int pressCount = 0;
 boolean ghostAppear = false;
 boolean kill = false;
 boolean keyStarted = false;
 PFont font;
 int warnX = 55;
 int warnY = 200;
 int move = 1;
 final int WAIT_TIME = (int) (5 * 1000); // 5 seconds
 int startTime;

 
 
void setup(){
  
 size(600,600);
 background(0,0,0);
 font = createFont("Frutiger",10, true);
 textFont(font);
  
}

//Moves the Beware text object left and right on screen
void moveText(){
  
   if ((warnX + 100) >= width){
       //background(0,0,0);
       
     move = move * -1;

   }else if (warnX <= 0){
       //background(0,0,0);
     move = move * -1;
   }  
      
  warnX = warnX + move;
  fill(255);
  text("Beware of GHOST!", warnX, warnY);
  
}

void draw(){
  
 background(0,0,0);
  text("Click Spacebar to light candle", 50,50);

 
  stroke(255);
  strokeWeight(2);
  
  //Create Candle Stick
  fill(238,224,74);
  rect(150, 400, 50,150);


  //Create Desk that holds candle
  stroke(255);
    beginShape();
    fill(124,69,21);
      vertex(0,600);
      vertex(100,500);
      vertex(250,500);
      vertex(350,600);
    
    endShape();



      if (ghostAppear == true){
        
          //Initial White Ghost that shows up after the for loop hits i=80
          strokeWeight(1);
          noFill();
          stroke(255);
          ellipse(ghostBPosx,ghostBPosy,150,150);
          ellipse(ghostELPosx,ghostELPosy,15,20);
          ellipse(ghostERPosx,ghostERPosy,15,20);
            beginShape();
              strokeWeight(10);
              vertex(260,400);
              vertex(275,425);
              vertex(288,400);
              vertex(295, 420);
              vertex(300,400);
              vertex(315, 425);
              vertex(330, 400);
              //vertex(337,310);
            endShape();
            
            
          //If the user clicks the mouse, the Ghost will turn red as if killed/scared away 
          if (kill == true){
          noFill();
          strokeWeight(2);
          stroke(255,0,0);
          ellipse(ghostBPosx,ghostBPosy,150,150);

          stroke(255,0,0);
          ellipse(ghostELPosx,ghostELPosy,15,20);
          ellipse(ghostERPosx,ghostERPosy,15,20); 
            }   
            
  } 
    candleAndGhost();
    moveText(); 
}
     

  void keyPressed(){
    
      //If the key is pressed light the candle fire
      keyStarted = true;
      
   }    
   
//Starts the countdown timer to create the ghost
void candleAndGhost(){
      if (keyStarted == true){
      
      //Tell user to click mouse to scare ghost text object
      fill(255,0,0);
      text("Click Mouse Button to Scare Ghost Away", 50,100);
      //print("pressed");
      strokeWeight(2);
      stroke(240,230,40);
      fill(255,0,0);
      ellipse(175,375,10,40);
      
      for (int i=0; i < 100; i++){

      //Make user wait 5 seconds before the Ghost appears
      if (millis() - startTime > WAIT_TIME) {
        startTime = millis();
        ghostAppear = true;

        break; 
      }
}

  }
  }
  
  //Begin CandleAndGhost countdown function
  void mousePressed(){
   
   if (keyStarted == true){
     
   kill = true; 
   }
  }
