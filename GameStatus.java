


// enumeration declarations, to allow tracking current state of the application to modify behaviour of
// keyPressed, keyDown, keyUp, mouse.... depending of which situation we are every moment
enum GameStatus
{
  ASK_NAME, ENTERING_NAME, WELCOME_MESSAGE, PLAYING, SCORE_HISTORY
};
