class GlassPane{
  
  int maxWidth;
  int startWidth;
  int glassColor;
  int currentWidth;
  // PImage currentWorld; use when Globe is a class to show current world on glass pane
  
  GlassPane(int startW, int maxW, int gcolor){
    maxWidth = maxW;
    startWidth = startW;
    glassColor = gcolor;
    currentWidth = startWidth;
  }
  
  void drawPane(){
    fill(glassColor);
    rect(0,50,currentWidth,340,0,10,10,0);
  }
  
  void extendPane(boolean openClose){
    if(openClose){
      currentWidth=maxWidth;
    } else {
      currentWidth=startWidth;
    }
  }
}