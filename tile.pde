public class Tile {
  
  // variables
  private int place;
  private String strAction;
  private String[] strPlayerNamesOnTile = new String[4]; // array with length of number of players in the game (max 4)
  private boolean blnPlayerOnTile = false;
  private boolean blnHasAction, blnHasGame;
  private int intNumberPlayersOnTile = 0;
  
  // constructor Tile
  Tile(int placeInit, String actionInit, boolean hasActionInit, boolean hasGameInit) {
    place = placeInit;
    strAction = actionInit;
    blnHasAction = hasActionInit;
    blnHasGame = hasGameInit;
    strPlayerNamesOnTile[0] = "";
    strPlayerNamesOnTile[1] = "";
    strPlayerNamesOnTile[2] = "";
    strPlayerNamesOnTile[3] = "";
  }
  
  // check if the tile has an action
  public boolean hasAction() {
    return blnHasAction;
  }
  
  // check if the tile has a game
  public boolean hasGame() {
    return blnHasGame;
  }
  
  // add a ladder on a tile
  public void addLadder(String actionInit, boolean hasActionInit) {
    strAction = actionInit;
    blnHasAction = hasActionInit;
  }
  
  // add a snake on a tile
  public void addSnake(String actionInit, boolean hasActionInit) {
    strAction = actionInit;
    blnHasAction = hasActionInit;
  }
  
  // add a game on a tile
  public void addGame(String actionInit, boolean hasActionInit, boolean hasGameInit) {
    strAction = actionInit;
    blnHasAction = hasActionInit;
    blnHasGame = hasGameInit;
  }
  
  // add end of game on a tile
  public void addEndOfGame(String actionInit, boolean hasActionInit) {
    strAction = actionInit;
    blnHasAction = hasActionInit;
  }
  
  /*
    Method to get place of tile on board. It returns a value of a number (int).
  */
  public int getPlaceOfTile() {
    return place;
  }
  
  /*
    Method to get number of players on tile. It returns a value of a number (int).
  */
  public int getNumberPlayersOnTile() {
    return intNumberPlayersOnTile;
  }
  
  // get the game on a tile
  public String getGame() {
    return strAction;
  }
  
  // get the action on a tile
  public String getAction() {
    return strAction;
  }
  
  /* 
    Method to remove a player on a tile.
  */
  public void removePlayerOnTile(String strPlayerName) {
    if(intNumberPlayersOnTile == 1) {
          blnPlayerOnTile=false;
    }
    for(int i=0;i<4;i++) {
      if(strPlayerNamesOnTile[i]==strPlayerName) {
        strPlayerNamesOnTile[i] = "";
        i = 4;
      } else {
      }
    }
    intNumberPlayersOnTile = intNumberPlayersOnTile - 1;
  }
  
  /*
    Method to set a number of players at the beginning of the game. It uses a parameter with the value how many players that are choosen in the game.
  */
  public void setNumberOfPlayersGameInit(int numberOfPlayersInit) {
    intNumberPlayersOnTile = numberOfPlayersInit;
  }
  
  /*
    Method to add a player on a tile.
  */
  public void addPlayerOnTile(String strPlayerName) {
    blnPlayerOnTile= true;
    intNumberPlayersOnTile = intNumberPlayersOnTile + 1;
    for(int i=0;i<4;i++) {
      if(strPlayerNamesOnTile[i]=="") {
        strPlayerNamesOnTile[i] = strPlayerName;
        i = 4;
      } else {
      }
    }
  }
  
  /*
    Method to check if a player is on a specific tile.
  */
  public boolean isPlayerOnTile() {
    return blnPlayerOnTile;
  }
  
  /*
    Method to get names of players that are on the tile.
  */
  public String getPlayerNamesOnTile() {
    String strOutput = "";
    for(int i =0;i<4;i++) {
      if(i==0) {
        strOutput = strPlayerNamesOnTile[i];
      } else {
        strOutput = strOutput + ", " + strPlayerNamesOnTile[i];
      }
    }
    return strOutput;
  }
  
  /*
    Method to open game if it is an action.
  */
  public void openGame(String strGame) {
    switch(strGame) {
      case "Game1": 
        screenBackground = 2; // code for minigame 1
        gameScreen = 0;
        // open game 1
        break;
      case "Game2": 
        //screenBackground = 3; // code for minigame 2
        screenBackground = 3;
        stage = 1;
        // open game 2
        break;
      case "Game3": 
        //screenBackground = 4; // code for minigame 3
        screenBackground = screenMiniGame3;
        time=millis();
        // open game 3
        break;
      case "Game4": 
        //screenBackground = 5; // code for minigame 4
        // open game 4
        break;
      default:  
        // open no game, game is not here
        break;
    }
  }
  
  /*
    Method to perform action when tile has an action.
  */
  public String action() {
    return "change this method to start an action";

  }
}