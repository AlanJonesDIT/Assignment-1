PImage[] planets = new PImage[8];
PImage earthGround;
PImage marsGround;
PShape globe;
color opacBlue = color(177,208,242,150);
color opacPurp = color(211,151,237,150);
MiniPanelSwitch mPanl1 = new MiniPanelSwitch(520);
MiniPanelSwitch mPanl2 = new MiniPanelSwitch(560);
MiniPanelSwitch mPanl3 = new MiniPanelSwitch(600);
MiniPanelSwitch mPanl4 = new MiniPanelSwitch(640);
GlassPane gPane1 = new GlassPane(190,490,opacBlue);
GlassPane gPane2 = new GlassPane(160,400,opacBlue);

void setup()
{
  size(800,600,P3D);
  hint(DISABLE_OPTIMIZED_STROKE);
  planets[0] = loadImage("earth.jpg");
  planets[1] = loadImage("mars.jpg");
  planets[2] = loadImage("venus.jpg");
  planets[3] = loadImage("jupiter.jpg");
  planets[4] = loadImage("saturn.jpg");
  planets[5] = loadImage("uranus.jpg");
  planets[6] = loadImage("mercury.jpg");
  planets[7] = loadImage("neptune.jpg");
  loadPlanets();
  listPlanets();
  noStroke();
  globe = createShape(SPHERE,1500);
  
   
}

void draw()
{
  background(0);
  globe.setTexture(planets[currentPlanet]);
  drawGlobe();
  drawPanels();
  drawSwitchesMini();
  selectPlanet();
  println(currentPlanet);
}

void loadPlanets()
{
  Table table = loadTable("planets.csv", "header");
  for(TableRow row:table.rows())
  {
    PlanetText planetText = new PlanetText(row);
    planetTexts.add(planetText);
  }
}

void listPlanets()
{
  for(PlanetText planetText:planetTexts)
  {
    println(planetText);
  }
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



void drawGlobe()
{
  pushMatrix();
  translate(width/2, 1700,-1020);
  //directionalLight(247, 204, 74, 300, 100, -1200);
  shape(globe);
  globe.rotateX(radians(-0.1)); // call speed from globe class function depending on planet
  
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
       //planetTexts[1].outputPlanetText();
     } else {
       mPanl1.isPressed = true;
       gPane1.extendPane(true);
       //planetText.showText(false);
     }
   }
   
   if((mouseX>mPanl2.px&&mouseX<(mPanl2.px+30))&&(mouseY>107&&mouseY<142)){
     if(mPanl2.isPressed == true){
       mPanl2.isPressed = false;
       gPane2.extendPane(false);
       planetShowing = false;
     } else {
       mPanl2.isPressed = true;
       gPane2.extendPane(true);
       planetShowing = true;
     }
   }
}

void selectPlanet(){
  int textY = 130;
  if(planetShowing){ // if the planet panel is showing
    textSize(15);
    fill(0);
    for(int i=0;i<planetTexts.size();i++){
      PlanetText planetText = planetTexts.get(i);
      text(planetText.planetName,200,textY);
      if(mousePressed && (mouseButton == LEFT)){ // if mouse is pressed
        if((mouseX>200 && mouseX<260)&&(mouseY>(textY-15)&&mouseY<(textY+15))){ // and mouse is over the text [i]
          // set selected planet to
          currentPlanet = planetText.planetIndex;
          planetShowing = false; // hide planet list
          gPane2.extendPane(false); // set pane to non-extended
          mPanl2.isPressed = false; // hide panel and change switch to default color
        } // end - if mouse position
      } else {
        planetShowing = true;
      } 
      textY+=30;
    } // end for loop
  }
}
boolean planetShowing = false; // is planet
boolean planetSelected = false;
int currentPlanet = 0;
// case switch to see which button sections are pressed




ArrayList<PlanetText> planetTexts = new ArrayList<PlanetText>(); 
float speed;