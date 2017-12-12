class Camera{

  PImage planetPic;
  PImage[] pics = new PImage[3];
  
  void takePicture(){
    planetPic = get(300, 420,200,180);
    planetPic.save("data/cameraPic-" + millis() + ".jpg");
    pics[0] = planetPic;
    image(pics[0],0,0,width,height);
    println(pics[0]);
  }
  
  void imgToScreen(){
    pushMatrix();
    translate(0,0,2);
    image(pics[0],0,0,50,50);
    popMatrix();
  }

}