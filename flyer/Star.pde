class Star {
  float x = random(width-width*2,width*2); // starting position of star on x axis
  float y = random(height, height+300); // starting position of stars
  float y1 = random(-300,height-200); // starting position of first stars
  float yspeed = random(1,2.5); // speed of star
  float s = random(0.2,7); // size of star
  
  void rise(){
    
    if(keyPressed && keyCode==UP) {
      
        y1 = y1 - (yspeed*7);
        y = y - (yspeed*7);
    } else {
      y1 = y1 - yspeed;
      y = y - yspeed;
    }

    if(y<-300){
      y = random(height, height+300);
    }

  }
  
  void show(){
    pushMatrix();
    translate(0,0,-1030);
    fill(255);
    stroke(200);
    ellipse(x,y1,s,s);
    ellipse(x,y,s,s);
    popMatrix();
  }
  
}