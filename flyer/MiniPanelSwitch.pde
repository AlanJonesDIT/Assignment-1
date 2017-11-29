class MiniPanelSwitch {

  int px;
  
  MiniPanelSwitch(int PosX){
     px = PosX;
  }
  
  void drawSwitch(){
    fill(224,63,45);
    // base
    rect(px,107,30,35);
    //switch
  }
  
}