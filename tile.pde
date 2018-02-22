/*
  TILE
  Method: 
  Properties:
*/

// TESTED: WORKS AT 22022018

// tile one is always -4 because all the players start there and they are not added in the begin. Maybe just add them on that tile before the start of the game

class Tile {
  // variables
  int place;
  String strAction, strCoordinates;
  String[] strPlayerNamesOnTile = new String[4]; // array with length of number of players in the game (max 4)
  boolean blnPlayerOnTile = false;
  boolean blnHasAction;
  int intNumberPlayersOnTile = 0;
  
  Tile(int placeInit, String actionInit, boolean hasActionInit, String coordinatesInit) {
    place = placeInit;
    strAction = actionInit;
    blnHasAction = hasActionInit;
    strCoordinates = coordinatesInit;
    strPlayerNamesOnTile[0] = "";
    strPlayerNamesOnTile[1] = "";
    strPlayerNamesOnTile[2] = "";
    strPlayerNamesOnTile[3] = "";
  }
  
  int getPlaceOfTile() {
    return place;
  }
  
  int getNumberPlayersOnTile() {
    return intNumberPlayersOnTile;
  }
  
  void removePlayerOnTile(String strPlayerName) {
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
  
  void addPlayerOnTile(String strPlayerName) {
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
  
  boolean isPlayerOnTile() {
    return blnPlayerOnTile;
  }
  
  // request and give player names on tile
  String getPlayerNamesOnTile() {
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
  
  // open game if it is an action
  void openGame(String strGame) {
    switch(strGame) {
      case "Game1": 
        // open game 1
        break;
      case "Game2": 
        // open game 2
        break;
      case "Game3": 
        // open game 3
        break;
      case "Game4": 
        // open game 4
        break;
      case "Game5": 
        // open game 5
        break;
      default:  
        // open no game, game is not here
        break;
    }
  }
  
  // perform action when tile has an action
  String action() {
    return "verander deze method met een actie om een spel op te starten";
  }
  
}
