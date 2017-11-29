PImage ground;
PShape globe;
MiniPanelSwitch mPanl1 = new MiniPanelSwitch(520);
MiniPanelSwitch mPanl2 = new MiniPanelSwitch(560);
MiniPanelSwitch mPanl3 = new MiniPanelSwitch(600);
MiniPanelSwitch mPanl4 = new MiniPanelSwitch(640);

void setup()
{
  size(800,600,P3D);
  hint(DISABLE_OPTIMIZED_STROKE);
  ground = loadImage("ground.jpg");
  noStroke();
  globe = createShape(SPHERE,1500);
  globe.setTexture(ground);
   
}

void draw()
{
  background(0);
  
  drawGlobe();
  drawPanels();
  mPanl1.drawSwitch();
  mPanl2.drawSwitch();
  mPanl3.drawSwitch();
  mPanl4.drawSwitch();
  
  

}

void drawPanels()
{
  pushMatrix();
  translate(0,0,0);
  fill(80);
  rect(0,0,width,110);
  
  // small button panel gradiented 
  beginShape();
  stroke(20);
  fill(60);
  vertex(500,100);
  vertex(780,100);
  fill(50);
  vertex(780,150);
  vertex(500,150);
  endShape();
  
  //noStroke();
  fill(100);
  triangle(0,0,0,70,330,0);
  triangle(800,0,800,70,470,0);
  fill(177,208,252,150);
  rect(0,500,width,100);
  fill(80);
  
  // main panel
  beginShape();
  fill(80);
  vertex(0,400);
  vertex(width,400);
  fill(50);
  vertex(width,550);
  vertex(0,550);
  endShape();
    
  fill(100);
  triangle(0,450,0,350,200,390); //left glass holder
  fill(177,208,242,150);
  rect(0,50,160,340,0,10,10,0);
  fill(100);
  triangle(0,525,0,700,200,525); // left bottom
  triangle(800,525,800,700,600,525); // right bottom
  popMatrix();
}

void drawGlobe()
{
  pushMatrix();
  translate(width/2, 1700,-1020);
  //directionalLight(247, 204, 74, 300, 100, -1200);
  shape(globe);
  globe.rotateX(radians(-0.1));
  float x = -0.1;
  
  if(keyPressed) {
    if(keyCode==UP) {
      globe.rotateX(radians(-0.3)); //
      //x+=0.05;
    } else if(keyCode==LEFT) {
      globe.rotateY(radians(0.4));
    } else if(keyCode==RIGHT) {
      globe.rotateY(radians(-0.4));
    }
  }
  popMatrix();
}

void drawSwitchesMini(){
  
}


float speed;
ArrayList<MiniPanelSwitch> mPanelSwitches = new ArrayList<MiniPanelSwitch>(); 