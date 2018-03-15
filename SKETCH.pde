Game myGame;
String[] playerNames;
int numberOfPlayers;
int screen = 0;

// screen: 0 board, 1 breakout

int teller = 0;
int playerNumber = 0;
  
void setup() {
  /* 
    MAKE THESE VARIABLES AS AN INPUT FOR THE PLAYERS
  */
  numberOfPlayers = 4;
  playerNames = new String[numberOfPlayers];
  for(int i = 0; i<numberOfPlayers;i++) {
    playerNames[i] = "player" + Integer.toString(i);
  }
  // board background
  size(736,552);
  background(255);
  myGame = new Game();
  myGame.newGame(4, playerNames);  // start game with 4 players
}

void draw() {
  if(screen == 0) {
    myGame.automatedDelayGame(playerNumber);
    teller++;
    delay(2000);
    if(playerNumber == numberOfPlayers-1) {
      playerNumber = 0;
    } else {
      playerNumber++;
    }
  }
  // fill with minigames
  else if (screen == 1) {
    background(255);
  }
  else if (screen == 1) {
    background(255);
  }
  else if (screen == 1) {
    background(255);
  }
  else if (screen == 1) {
    background(255);
  }
  else if (screen == 1) {
    background(255);
  }
}
