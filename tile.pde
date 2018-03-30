/*
  TILE
  Method: 
  Properties:
*/

// TESTED: WORKS AT 22022018

// tile one is always -4 because all the players start there and they are not added in the begin. Maybe just add them on that tile before the start of the game

public class Tile {
  
  // variables
  private int place;
  private String strAction, strCoordinates;
  private String[] strPlayerNamesOnTile = new String[4]; // array with length of number of players in the game (max 4)
  private boolean blnPlayerOnTile = false;
  private boolean blnHasAction, blnHasGame;
  private int intNumberPlayersOnTile = 0;
  
  // constructor Tile
  Tile(int placeInit, String actionInit, boolean hasActionInit, boolean hasGameInit, String coordinatesInit) {
    place = placeInit;
    strAction = actionInit;
    blnHasAction = hasActionInit;
    blnHasGame = hasGameInit;
    strCoordinates = coordinatesInit;
    strPlayerNamesOnTile[0] = "";
    strPlayerNamesOnTile[1] = "";
    strPlayerNamesOnTile[2] = "";
    strPlayerNamesOnTile[3] = "";
  }
  
  public boolean hasAction() {
    return blnHasAction;
  }
  
  public boolean hasGame() {
    return blnHasGame;
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
  
  public String getGame() {
    return strAction;
  }
  
  public String getAction() {
    return strAction;
  }
  
  public void doAction() {
    // steps forward or backward
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
        screen = 2; // code for minigame 1
        // open game 1
        break;
      case "Game2": 
        screen = 3; // code for minigame 2
        // open game 2
        break;
      case "Game3": 
        screen = 4; // code for minigame 3
        // open game 3
        break;
      case "Game4": 
        screen = 5; // code for minigame 4
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