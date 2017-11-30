PImage earthGround;
PImage marsGround;
PImage currentWorld = earthGround;
PShape globe;
color opacBlue = color(177,208,242,150);
color opacPurp = color(211,151,237,150);
MiniPanelSwitch mPanl1 = new MiniPanelSwitch(520);
MiniPanelSwitch mPanl2 = new MiniPanelSwitch(560);
MiniPanelSwitch mPanl3 = new MiniPanelSwitch(600);
MiniPanelSwitch mPanl4 = new MiniPanelSwitch(640);
GlassPane gPane1 = new GlassPane(190,490,opacBlue);
GlassPane gPane2 = new GlassPane(160,400,opacBlue);
Globe thePlanet = new Globe(earthGround);

void setup()
{
  size(800,600,P3D);
  hint(DISABLE_OPTIMIZED_STROKE);
  earthGround = loadImage("ground.jpg");
  marsGround = loadImage("marsGround.jpg");
  noStroke();
  thePlanet.makeGlobe();
  
   
}

void draw()
{
  background(0);
  
  
  thePlanet.drawGlobe();
  drawPanels();
  drawSwitchesMini();
  
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
  fill(100);
  triangle(0,525,0,700,200,525); // left bottom
  triangle(800,525,800,700,600,525); // right bottom
  
  gPane1.drawPane();
  gPane2.drawPane();
  
  popMatrix();
}

void drawSwitchesMini(){
  
  mPanl1.drawSwitch();
  mPanl2.drawSwitch();
  mPanl3.drawSwitch();
  mPanl4.drawSwitch();

}

void mouseClicked(){
      
   if((mouseX>mPanl1.px&&mouseX<(mPanl1.px+30))&&(mouseY>107&&mouseY<142)){
     if(mPanl1.isPressed == true){
       mPanl1.isPressed = false;
       gPane1.extendPane(false);
     } else {
       mPanl1.isPressed = true;
       gPane1.extendPane(true);
     }
   }
   
   if((mouseX>mPanl2.px&&mouseX<(mPanl2.px+30))&&(mouseY>107&&mouseY<142)){
     if(mPanl2.isPressed == true){
       mPanl2.isPressed = false;
       gPane2.extendPane(false);
     } else {
       mPanl2.isPressed = true;
       gPane2.extendPane(true);
     }
   }
}

// case switch to see which button sections are pressed




float speed;
ArrayList<MiniPanelSwitch> mPanelSwitches = new ArrayList<MiniPanelSwitch>(); 