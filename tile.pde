/*
  TILE
  Method: 
  Properties:
*/

// TESTED: WORKS AT 22022018

class Tile {
  // variables
  int place;
  String action, coordinates;
  String strPlayerNameOnTile;
  boolean blnPlayerOnTile = false;
  boolean hasAction;
  
  Tile(int placeInit, String actionInit, boolean hasActionInit, String coordinatesInit) {
    place = placeInit;
    action = actionInit;
    hasAction = hasActionInit;
    coordinates = coordinatesInit;
  }
  
  // methods
  
  int getPlaceOfTile() {
    return place;
  }
  
  void removePlayerOnTile() {
    blnPlayerOnTile=false;
    strPlayerNameOnTile="empty";
  }
  
  void addPlayerOnTile(String strPlayerName) {
    blnPlayerOnTile= true;
    strPlayerNameOnTile = strPlayerName;
  }
  
  boolean isPlayerOnTile() {
    return blnPlayerOnTile;
  }
  
  String getPlayerNameOnTile() {
    return strPlayerNameOnTile;
  }
  
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
  
  String action() {
    return "verander deze method met een actie om een spel op te starten";
  }
  
  // properties
}
