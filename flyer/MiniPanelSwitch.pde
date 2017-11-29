class MiniPanelSwitch {

  int px;
  Boolean isPressed = false;
  
  MiniPanelSwitch(int PosX){
     px = PosX;
     
  }
  
  void drawSwitch(){
    if(isPressed){
      fill(249,192,47);
    } else {
      fill(224,63,45);
    }
    rect(px,107,30,35);
    
    //switch
  }
  
}