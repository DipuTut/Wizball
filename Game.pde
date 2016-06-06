

// class that represents a game
class Game
{
  // Any game needs to have information about the player name in order to be able to return his/her score
  String playerName;
  // We need to keep track of the player's score (future requirement)
  //int playerScore;
  Level lev;
    
  Game(String playerName)
  {
    this.playerName = playerName;
    //this.playerScore = 0;
  }
  
  void startGame()
  {
    this.lev = new Level(width, height);
  }
  
  void updateAndDraw(float deltaTime)
  {
    this.lev.updateAndDraw(deltaTime);
  }
  
  //user input from the game class to the level class and to the ball class
  void processUserInput(boolean upPressed, boolean downPressed, boolean leftPressed, boolean rightPressed)
  {
    this.lev.processUserInput(upPressed, downPressed, leftPressed, rightPressed);
  }
}


