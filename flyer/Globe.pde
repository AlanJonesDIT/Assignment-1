class Globe{
  
  PShape globe;
  float px, py, pz;
  int pSize;
  boolean cameraPlanetHide = true; // if true it's off screen
  
  
  Globe(float posX, float posY, float posZ, int planetSize){
    px = posX;
    py = posY;
    pz = posZ;
    pSize = planetSize;
    //globe = createShape(SPHERE,pSize);
  }
  
  PShape setUpSpheres(){
    globe = createShape(SPHERE,pSize);
    return globe;
  }
  
  void drawGlobe(){
    pushMatrix();
    translate(px, py, pz); // (width/2, 0,-5020)    } else {
    if(pz==0){
      directionalLight(255, 255, 255, 0, 400,-50);
    }
    shape(globe);
    globe.rotateX(radians(-0.1)); // call speed from globe class function depending on planet
  
    if(keyPressed) {
      if(keyCode==UP) {
        globe.rotateX(radians(-0.3)); //
      } else if(keyCode==LEFT) {
        globe.rotateY(radians(0.4));
      } else if(keyCode==RIGHT) {
        globe.rotateY(radians(-0.4));
      }
    }
  popMatrix();
  }
  
}