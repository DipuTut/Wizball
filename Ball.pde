
//class for ball inherited from Object class

class Ball extends Object

{
  float Radius;
  float Elasticity;
  float FrictionCoefficient;
  Ball(float x, float y, float vx, float vy, float ax, float ay, float mass, float radius, float elasticity, float frictionCoefficient)
  {
    super(x,y,vx,vy,ax,ay,mass);
    this.Radius = radius;
    this.Elasticity = elasticity;
    this.FrictionCoefficient = frictionCoefficient;
    
    }
    
    void setRadius(float radius)
    { 
      this.Radius=radius;
    }
    
    float getRadius()
    {
      return this.Radius;
    }
    
    // UserStory3 = US3 set function for elasticity
    void setElasticity(float elasticity)
    {
      this.Elasticity = elasticity;
    }
    
    
    //US3 set friction funtion
    void setFrictionCoefficient(float frictionCoefficient)
    {
      this.FrictionCoefficient = frictionCoefficient;
    }
    
     // UserStory3 = US3 get function for elasticity
    float getElasticity()
    {
      return this.Elasticity;
    }
    
    
    //US3 get friction funtion
    float getFrictionCoefficient()
    {
      return this.FrictionCoefficient;
    }
    
      //  Ball Paint method
  void paint()
  {
    // Display the BALL
    fill(255, 125, 0);
    stroke(0);
    rectMode(RADIUS);
    // paint ball with the same radius as used for the calculations
    ellipse(this.x, this.y, 2*this.Radius, 2*this.Radius);
  }

  void processUserInput(boolean upPressed, boolean downPressed, boolean leftPressed, boolean rightPressed)
  {
    // udpate of ball's speed
    // pressing Up arrow will always increase the vertical speed to the ball, irrespective
    // on whether it is travelling up or down. Likewise, pressing Down arrow will always
    // reduce the vertical speed of the ball
    if (upPressed) {
      if (this.vy < 0)
        this.vy -= 1.0f;
      else
        this.vy += 1.0f;
    }
    else if (downPressed) {
      if (this.vy < 0)
        this.vy += 1.0f;
      else
        this.vy -= 1.0f;
    }
    else if (leftPressed) {
      if (this.vx < 0)
        this.vx += 1.f;
      else
        this.vx -= 1.0f;
    }
    else if (rightPressed) {
      if (this.vx < 0)
        this.vx -= 1.0f;
      else
        this.vx += 1.0f;
    }
  }  
}
