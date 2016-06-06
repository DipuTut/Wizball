// class that represents the background (either static or dynamic) to be presented
class Background
{
  // variable to contain the image to be presented as background
  PImage bckgrndImage;
  // variables to contain the size of the level on which apply the background
  int bckGrndWidth, bckGrndHeight;
  
  // class constructor for a static background
  Background(PImage backGrndImage, int bckGrndWidth, int bckGrndHeight)
  {
    this.bckGrndWidth = bckGrndWidth;
    this.bckGrndHeight = bckGrndHeight;
    this.bckgrndImage = backGrndImage;
    scaleImage(this.bckGrndWidth, this.bckGrndHeight);
  }
  
  void scaleImage(int newWidth, int newHeight)
  {
    this.bckgrndImage.resize(newWidth, newHeight);
  }
  
  void drawBckGrnd()
  {
    image(bckgrndImage, 0, 0);
  }
}
