class Globe{
  
  PImage planetChoice;
  
  Globe(){
    
  }
  
  void makeGlobe(){
   globe = createShape(SPHERE,1500);
   } // end drawGlobe
 
 
 void drawGlobe(){
 
   pushMatrix();
   translate(width/2, 1700,-1020);
   //directionalLight(247, 204, 74, 300, 100, -1200);
   shape(globe);
   globe.rotateX(radians(-0.1));
  
   if(keyPressed) {
    if(keyCode==UP) {
      globe.rotateX(radians(-0.3)); //
      //x+=0.05;
    } else if(keyCode==LEFT) {
      globe.rotateY(radians(0.4));
    } else if(keyCode==RIGHT) {
      globe.rotateY(radians(-0.4));
    }
  } // keyPressed
  popMatrix();
 }
 
 
 
  
 void setGlobeTexture(){
   
   
 }
  
}