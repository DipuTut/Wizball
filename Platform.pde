
class Platform extends Object

{


  Platform(float x, float y, float vx, float vy, float ax, float ay, float mass)
  {
    super(x,y,vx,vy,ax,ay,mass);
  }
       
    
   //  Floor Paint method
  void paint()
  {
    // Display the floor
    fill(150);
    stroke(255);
    strokeWeight(5);
    rectMode(CENTER);
    // paint floor with the same radius as used for the calculations
    rect(this.x, this.y, 200, 20);
      
  }
  
}





