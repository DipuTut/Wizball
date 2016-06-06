
// base class of all things that can collide in the game
class Object
{
  // variables to hold object's mass, position in 2D space, velocity in 2D space and acceleration in 2D

  // position 2D vector
  float x, y;
  // velocity 2D vector
  float vx, vy;
  // acceleration 2D vector
  float ax, ay;
  // object mass
  float mass;

  Object(float x, float y, float vx, float vy, float ax, float ay, float mass)
  {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.ax = ax;
    this.ay = ay;
    this.mass = mass;
  }

  void calculateMechanics(float deltaTime)
  {
    updateAcceleration(deltaTime);
    updateVelocity(deltaTime);
    updatePosition(deltaTime);
  }

  void updateAcceleration(float deltaTime)
  {
    // here we would need to add the user´s modifications over the accelerations on the ball
    // when gravity is the only effect on the ball, we don´t do anything
  }
  void updateVelocity(float deltaTime)
  {
    vx += deltaTime * ax;
    vy += deltaTime * ay;
  }
  void updatePosition(float deltaTime)
  {
    x += deltaTime * vx;
    y += deltaTime * vy;
  }

  float getX()
  {
    return x;
  }

  float getY()
  {
    return y;
  }

  float getVX()
  {
    return vx;
  }

  float getVY()
  {
    return vy;
  }

  float getAX()
  {
    return ax;
  }

  float getAY()
  {
    return ay;
  }

  void setX(float x)
  {
    this.x = x;
  }

  void setY(float y)
  {
    this.y = y;
  }

  void setVX(float vx)
  {
    this.vx = vx;
  }

  void setVY(float vy)
  {
    this.vy = vy;
  }

  void setAX(float ax)
  {
    this.ax = ax;
  }

  void setAY(float ay)
  {
    this.ay = ay;
  }

  // object Paint method, mainly for debug/testing purposes
  void paint()
  {
    // Display the BALL
    fill(175);
    stroke(0);
    rectMode(RADIUS);
    // paint ball with the same radius as used for the calculations
    ellipse(this.x, this.y, 10, 10);
  }
  
  void updateAndDraw(float deltaTime)
  {
    calculateMechanics(deltaTime);
    paint();
  }
}

