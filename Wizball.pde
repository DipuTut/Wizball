// main entry point for the game
// in charge of requesting the user name, launching the game and presenting the history of highest scores

// Constants declarations
String playerNameEnquiry = "Please, enter your name: ";
/// Variable declarations
Game game;
Background bckgrnd;
PFont font;
GameStatus gameStatus;
String playerName;

/// Canvas size definition
int width = 1000;
int height = 700;

// booleans to control the movement of the ball based on cursor key presses
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

// saved time variable
int savedTime;

void setup()
{
  // set overall user interface size
  size(width, height,P2D);
  smooth();
  // setup initial background object
  bckgrnd = new Background(loadImage("background.jpg"), width, height);
   // initialize font for user messages
  font = createFont("Arial", 16, true );
  // initialize player's name string
  playerName = "";
  // initialize status tracking variable to INITIAL
  gameStatus = GameStatus.ASK_NAME;
    
  // The next instructions will prensent information to the screen...
  // however, we don't use them in the draw method because we don't
  // need these to be done for each frame
  
  // present a static background to the user
  bckgrnd.drawBckGrnd();
  // request player's name
  text(playerNameEnquiry, width/2, height/2);
 

   
}

void draw() {
  
  // timer related management functions
  int deltaTime = millis() - savedTime;
  savedTime = millis();
  if (gameStatus == GameStatus.ASK_NAME)
  {
  } else if (gameStatus == GameStatus.ENTERING_NAME)
  {
  } else if (gameStatus == GameStatus.WELCOME_MESSAGE)
  {
  } else if (gameStatus == GameStatus.PLAYING)
  {
    game.updateAndDraw(deltaTime);
    game.processUserInput(upPressed, downPressed, leftPressed, rightPressed);
  } else if (gameStatus == GameStatus.SCORE_HISTORY)
  {
  } else {
  }
  
  
 
}


void keyTyped()
{
  if (gameStatus == GameStatus.ASK_NAME)
  {
    if (key != '\n')
    {
      playerName = playerName + key;
    }
    gameStatus = GameStatus.ENTERING_NAME;
    text(playerName, width/2, (height/2) + 20);
  } else if (gameStatus == GameStatus.ENTERING_NAME)
  {
    if (key != '\n')
    {
      playerName = playerName + key;
      text(playerName, width/2, (height/2) + 20);    
    } else {
      gameStatus = GameStatus.WELCOME_MESSAGE;
      welcomeMessage();
    }
  } else if (gameStatus == GameStatus.WELCOME_MESSAGE)
  {
  } else if (gameStatus == GameStatus.PLAYING)
  {
  } else if (gameStatus == GameStatus.SCORE_HISTORY)
  {
  } else {
  }
}

void mousePressed() {
  if (gameStatus == GameStatus.ASK_NAME)
  {
  } else if (gameStatus == GameStatus.ENTERING_NAME)
  {
  } else if (gameStatus == GameStatus.WELCOME_MESSAGE)
  {
    // user has clicked on the button to start the game after entering user name
    if ((mouseX > (width/2)-25) && (mouseX < (width/2)+75) && (mouseY > (3*height)/4+20) && (mouseY < (3*height)/4+55)) {
      gameStatus = GameStatus.PLAYING;
      game = new Game(playerName);
      game.startGame();
      savedTime = millis();
    }
  } else if (gameStatus == GameStatus.PLAYING)
  {
  } else if (gameStatus == GameStatus.SCORE_HISTORY)
  {
  } else {
  }
}





void keyPressed(KeyEvent e) 
{
  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = true;
    }
    else if (keyCode == DOWN) {
      downPressed = true;
    }
    else if (keyCode == LEFT) {
      leftPressed = true;
    }
    else if (keyCode == RIGHT) {
      rightPressed = true;
    }
  }
}

void keyReleased(KeyEvent e)
{
  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = false;
    }
    else if (keyCode == DOWN) {
      downPressed = false;
    }
    else if (keyCode == LEFT) {
      leftPressed = false;
    }
    else if (keyCode == RIGHT) {
      rightPressed = false;
    }
  }
}

// show user a welcome message explaining why we are here...
void welcomeMessage() {
  // repaint the background to erase all previous writings in the screen
  bckgrnd.drawBckGrnd();

  // Draw the letter to the center of the screen
  textSize(16);
  text("A long time ago, in a Wizworld far, far away...It is a period of bouncing.",10,120);
  text("Different kind of obstacles are set on the way through the amazing WizWorld.",10,140);
  text("During the trip there are nasties who try to end the BALLS trip.", 10,160);
  text("Colliding with a nasty will end the BALLS trip.", 10,180);
  text("However facing a power-up The BALL can teporarily collide with a nasty and destroy it.",10,200);
  text("The BALL is required to travel through the amazing WizWorld and beat the timer to exit" ,10,220);
  text("to the next level and continue the game.Points are collected by destroying the nasties", 10, 240);
  text("and collecting bestows, and in the end lead to eternal glory adding the BALLS name to", 10, 260);
  text("score board!", 10, 280);
  
  textSize(36);
  text("Welcome", 50, 50, 540, 300);
  text(playerName, 220, 50, 540, 300);
  
  // Then perhaps we need some mousepressed condition here to indicate exiting this function 
  // and starting the game.
  ShowStartButton();
}

void ShowStartButton() {
  textSize(24);
  fill(100);
  rect( (width/2)-25, (3*height)/4+20, 100,35);
  fill(0);
  text("START", (width/2)-20, ((3*height)/4) + 50 );  
}



