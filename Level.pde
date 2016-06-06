
// base class for any level in the game
class Level
{
  int levelWidth;
  int levelHeight;
  float flrX;
  float flrY;
  
  // specific background for this level, which could be different from others if needed
  Background levelBackground;
  
  // Object for debuging/testing purposes, will need to rearange into some structure later
  Ball ping;
  Platform ping2, ping3 ;
  
  Level(int levelWidth, int levelHeight)
  {
    flrX = 500 ;
    flrY = 500 ;
    this.levelWidth = levelWidth;
    this.levelHeight = levelHeight;
    
    // initialize the background
    this.levelBackground = new Background(loadImage("Background2.jpg"), this.levelWidth, this.levelHeight);
    // here or in a method I would need to initialize ALL objects in this level
    //this is the place to create the ball for the game, and other objects
    this.ping = new Ball((float)levelWidth/2, (float)levelHeight/2, 0.0f, 0.0f, 0.0f, 0f, 1.0f, 20.0f, 0.9f, 1.0f);
    this.ping2 = new Platform(flrX,flrY, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f);
    this.ping3 = new Platform(200.0f,200.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f);
    
  }
  
  void updateAndDraw(float deltaTime)
  {
    // first update background
    this.levelBackground.drawBckGrnd();
    
    // here I would update and draw ALL object in this level
    this.ping.updateAndDraw(deltaTime);
    this.ping2.updateAndDraw(deltaTime);
    this.ping3.updateAndDraw(deltaTime);
    // then update objects mechanics to account for collissions between objects and the level walls
    // (note that this will be slightly different in the case of collisions between objects)
    calculateCollisionEffects(this.ping);
    calculateCollisionEffects(this.ping2);
    calculateCollisionEffects(this.ping3);
    
    
  }
  
  boolean hasCollided(Object obj)
  {
    return (obj.getX() <= 0 || obj.getX() >= this.levelWidth || obj.getY() <= 0 || obj.getY() >= this.levelHeight);
  }

  
  void calculateCollisionEffects(Object obj)
  {
    // this method performs the calculation of the collision between the ball and the level walls
    // and in the future shall simulate loss of energy due to ball's elasticity and friction with
    // walls
    if (obj.getX() <= 0 || obj.getX() >= this.levelWidth)
    {
      obj.setVX(obj.getVX() * -1.0f);
    }
    
    if (obj.getY() <= 0 || obj.getY() >= this.levelHeight)
    {
      obj.setVY(obj.getVY() * -1.0f);
    }
  }
  
  /* void calculateCollisionEffects(Ball ball) OLD CODE
  {
    // this method performs the calculation of the collision between the ball and the level walls
    // and in the future shall simulate loss of energy due to ball's elasticity and friction with
    // walls
    if (ball.getX() <= ball.getRadius() || ball.getX() >= (this.levelWidth - ball.getRadius()))
    {
      ball.setVX(ball.getVX() * -1.0f);
    }
    
    if (ball.getY() <= ball.getRadius() || ball.getY() >= (this.levelHeight - ball.getRadius()))
    {
      ball.setVY(ball.getVY() * -1.0f);
    }
  }*/
  
  
  //User story 3 . elasticity ito place the previous implememtation
  void calculateCollisionEffects(Ball ball)
  {

    if (checkCollisionWithFloor(ball))
    {
     ball.setVX(ball.getVX() * (1 + ball.getFrictionCoefficient()*(ball.getElasticity() - 1)));
     ball.setVY(ball.getVY() * -ball.getElasticity());
    }
    if (checkCollisionWithCeiling(ball))
    {
     ball.setVX(ball.getVX() * (1 + ball.getFrictionCoefficient()*(ball.getElasticity() - 1)));
     ball.setVY(ball.getVY() * -ball.getElasticity());      
    }
    if (checkCollisionWithLeftWall(ball))
    {
      ball.setVX(ball.getVX() * -1.0);
    }
    if (checkCollisionWithRightWall(ball))
    {
      ball.setVX(ball.getVX() * -1.0);
    }
  }
  
  
  
  boolean checkCollisionWithLeftWall(Ball ball)
  {
    if ((int)ball.getX() < (int)ball.getRadius())
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  boolean checkCollisionWithRightWall(Ball ball)
  {
    if ((int)ball.getX() > (levelWidth - (int)ball.getRadius()))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean checkCollisionWithFloor(Ball ball)
  {
    if ((int)ball.getY() > (levelHeight - (int)ball.getRadius()))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean checkCollisionWithCeiling(Ball ball)
  {
    if ((int)ball.getY() < (int)ball.getRadius())
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  

  
  
  //input from the player to change the parameters of the ball with keypresses fro user, info from game class and from here (level ) to ball class
  void processUserInput(boolean upPressed, boolean downPressed, boolean leftPressed, boolean rightPressed)
  {
    this.ping.processUserInput(upPressed, downPressed, leftPressed, rightPressed);
  }
}















