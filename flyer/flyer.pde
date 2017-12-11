import ddf.minim.*;
Minim minim;

PImage[] planets = new PImage[8];
PImage[] pics = new PImage[100];
PShape globe;
color opacBlue = color(177,208,242,150);
color opacPurp = color(211,151,237,150);
AudioPlayer buttonPress;
AudioPlayer camera;
AudioPlayer globeTurn;
AudioPlayer openSlide;
AudioPlayer engine;
AudioPlayer ast1;
AudioPlayer ast2;
AudioPlayer ast3;
AudioPlayer ast4;
AudioPlayer ast5;
AudioPlayer ast6;
AudioPlayer ast7;
AudioPlayer[] soundClips;

Star[] stars = new Star[100];
MiniPanelSwitch mPanl1 = new MiniPanelSwitch(520);
MiniPanelSwitch mPanl2 = new MiniPanelSwitch(560);
MiniPanelSwitch mPanl3 = new MiniPanelSwitch(600);
MiniPanelSwitch mPanl4 = new MiniPanelSwitch(640);
GlassPane gPane1 = new GlassPane(190,490,opacPurp);
GlassPane gPane2 = new GlassPane(160,400,opacBlue);
Globe bigGlobe = new Globe(400, 1700, -1020,1500);
Globe miniGlobe = new Globe(400, 508, 0, 60);
//Globe cameraGlobe = new Globe(400, 400, 0, 280);

void setup()
{
  size(800,600,P3D);
  hint(DISABLE_OPTIMIZED_STROKE);
  planets[0] = loadImage("earth.jpg");
  planets[1] = requestImage("mars.jpg");
  planets[2] = requestImage("venus.jpg");
  planets[3] = requestImage("jupiter.jpg");
  planets[4] = requestImage("saturn.jpg");
  planets[5] = requestImage("uranus.jpg");
  planets[6] = requestImage("mercury.jpg");
  planets[7] = requestImage("neptune.jpg");
 
  minim = new Minim(this);
  buttonPress = minim.loadFile("buttonPress.wav");
  camera = minim.loadFile("camera.wav");
  globeTurn = minim.loadFile("globeTurn.wav");
  openSlide = minim.loadFile("openSlide2.wav");
  engine = minim.loadFile("engine.wav",2048);
  soundClips = new AudioPlayer[7];
  soundClips[0] = minim.loadFile("clip1.wav");
  soundClips[1] = minim.loadFile("clip2.wav");
  soundClips[2] = minim.loadFile("clip3.wav");
  //soundClips[3] = minim.loadFile("clip4.wav");
  //soundClips[4] = minim.loadFile("clip5.wav");
  //soundClips[5] = minim.loadFile("clip6.wav");
  //soundClips[6] = minim.loadFile("clip7.wav");
  
  loadPlanets();
  listPlanets();
  noStroke();
  bigGlobe.setUpSpheres();
  miniGlobe.setUpSpheres();
  for(int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }
  engine.loop();
}

void draw()
{
  background(0);
  for(int i = 0; i < stars.length; i++){
    stars[i].show();
    stars[i].rise();
  }
  noStroke();
  bigGlobe.globe.setTexture(planets[currentPlanet]);
  miniGlobe.globe.setTexture(planets[currentPlanet]);
  bigGlobe.drawGlobe();
  drawPanels(dayNight);
  drawSwitchesMini();
  drawCamera();
  miniGlobe.drawGlobe();
  
  if(planetShowing){
    selectPlanet();
  }
  if(showInfo){
    displayText();
  }
  if(takePic){
    showJustPlanetAndTakePicture();
  }
  
  if(keyPressed) {
      if(keyCode==UP) {
        globeTurn.setPan(0);
        globeTurn.play();
        //globeTurn.setPan(-0.7);
      } else if(keyCode==LEFT){
         globeTurn.setPan(-0.8);
         globeTurn.play();
      } else if(keyCode==RIGHT){
         globeTurn.setPan(0.8);
         globeTurn.play();
      }
    } else {
      globeTurn.pause();
      globeTurn.rewind();
    }
    
    
   println(frameCount); 
   if(frameCount%600==0){
     
     soundClips[curClip].setPan(random(-1,1));
     soundClips[curClip].play();
     curClip++;
     
     
    if(curClip>2){
      curClip=0;
    }
    soundClips[curClip].rewind(); 
   }
   
   
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
    //println(planetText);
  }
}
// 80, 200, 60, 180, 50, 120, 100
// days - 200, 180, 120, 
void drawPanels(boolean dayNight)
{
  int colorMultiplier;
  
  if(dayNight){
    colorMultiplier = 10; // day (true)
  } else {
    colorMultiplier = 5; // night (false)
  }
  
  pushMatrix();
  translate(0,0,0);
  fill(20*colorMultiplier); // top triangle night 80, day 200
  rect(0,0,width,110);

  // small button panel gradiented 
  beginShape();
  stroke(20);
  fill(18*colorMultiplier); // night 60, day 180
  vertex(500,100);
  vertex(780,100);
  fill(12*colorMultiplier); // night 50, day 120
  vertex(780,150);
  vertex(500,150);
  endShape();
  
  //noStroke();
  fill(18*colorMultiplier); // night 100, day 180
  triangle(0,0,0,70,330,0);
  triangle(800,0,800,70,470,0);
  fill(177,208,252,150);
  rect(0,500,width,100);
  
  // main panel
  beginShape();
  fill(18*colorMultiplier); // night 80, day
  vertex(0,400);
  vertex(width,400);
  fill(12*colorMultiplier); // night 50, day
  vertex(width,550);
  vertex(0,550);
  endShape();

  fill(18*colorMultiplier); // night 100, day 180
  triangle(0,450,0,350,200,390); //left glass holder
  fill(18*colorMultiplier); // night 100, day 180
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

void drawCamera(){
  fill(0);
  rect(300, 420, 200, 180,30,30,0,0);
}


void mouseClicked(){
   
  if((mouseX>mPanl3.px&&mouseX<(mPanl3.px+30))&&(mouseY>107&&mouseY<142)){
      takePic = true; // make camera image and check if camera button is pressed to take image
  // then load the image into array and resize it to display on dashboard
  
     camera.pause();
     camera.rewind();
     camera.play();
  
  }
  if((mouseX>mPanl4.px&&mouseX<(mPanl4.px+30))&&(mouseY>107&&mouseY<142)){
    
     buttonPress.pause();
     buttonPress.rewind();
     buttonPress.play();
    
    if(mPanl4.isPressed == true){
      mPanl4.isPressed = false;
      dayNight = false;
    } else {
      mPanl4.isPressed = true;
      dayNight = true;
      buttonPress.play();
    }
  }
   if((mouseX>mPanl1.px&&mouseX<(mPanl1.px+30))&&(mouseY>107&&mouseY<142)){    
     
     
     
     if(mPanl1.isPressed == true){
       mPanl1.isPressed = false;
       gPane1.extendPane(false);
       showInfo = false;
     } else {
       openSlide.pause();
       openSlide.rewind();
       openSlide.play(); 
       mPanl1.isPressed = true;
       gPane1.extendPane(true);
       gPane2.extendPane(false);
       mPanl2.isPressed = false;
       planetShowing = false;
       showInfo = true;
     }
   }
   
   if((mouseX>mPanl2.px&&mouseX<(mPanl2.px+30))&&(mouseY>107&&mouseY<142)){

     if(mPanl2.isPressed == true){
       mPanl2.isPressed = false;
       gPane2.extendPane(false);
       planetShowing = false;
     } else {
       openSlide.pause();
       openSlide.rewind();
       openSlide.play();
       mPanl2.isPressed = true;
       mPanl1.isPressed = false;
       gPane2.extendPane(true);
       gPane1.extendPane(false);
       planetShowing = true;
       showInfo = false;
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

void displayText(){
    
    float posX1 = 200;
    float posX2 = 350;
  
    PlanetText planetText = planetTexts.get(currentPlanet);
    textSize(15);
    fill(255);
    text("Name:",posX1,150);
    text(planetText.planetName, posX2, 150);
    text("Radius:",posX1,180);
    text(planetText.radius + " km",posX2,180); // add 30 each time
    text("Min Temp:",posX1,210);
    text(planetText.tempMin + "C",posX2,210);
    text("Max Temp:",posX1,240);
    text(planetText.tempMax + "C",posX2,240);
    text("Orbit Velocity:",posX1,270);
    text(planetText.orbitVel,posX2,270);
    text("Habitable:",posX1,300);
    if(planetText.habitable==1){
      text("Yes",posX2,300);
      text("Population:",posX1,330);
      text(planetText.population,posX2,330);
    } else {
      text("No",posX2,300);
    }
    
    
    
}

void showJustPlanetAndTakePicture(){
  background(0);
  miniGlobe.globe.setTexture(planets[currentPlanet]);
  miniGlobe.drawGlobe();
  
  cameraPic = get(300, 420,200,180);
  
  cameraPic.save("print/cameraPic-" + millis() + ".jpg");
  //takePic = false;
  
  //clip(300, 420, 200, 180);
  //saveFrame("planet-#####.png");
  takePic = false;
  noClip();
}

boolean takePic = false;
boolean planetShowing = false; // is planet
boolean planetSelected = false;
boolean showInfo = false;
boolean dayNight = false;
int currentPlanet = 0;
PImage cameraPic;
int curClip = 0;
int prevCurl;

ArrayList<PlanetText> planetTexts = new ArrayList<PlanetText>();
float speed;