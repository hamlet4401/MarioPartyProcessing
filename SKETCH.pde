// variables
  Player[] myPlayers;
  Tile[] myTiles;
  
void setup() {
  // initialize variables
  myPlayers = new Player[4];
  myTiles = new Tile[18];
  for (int i = 0; i<18;i++) {
    myTiles[i] = new Tile(i,"no action", false, String.valueOf(i));
  }
  myPlayers[0] = new Player("player 1", 18);
  myPlayers[1] = new Player("player 2", 18);
  myPlayers[2] = new Player("player 3", 18);
  myPlayers[3] = new Player("player 4", 18);
  for (int i = 0; i <3; i++) {
    for (int j=0; j < 4; j++) {
      myTiles[myPlayers[j].getPlaceOnBoard()].removePlayerOnTile(myPlayers[j].getName());
      println("Old place " + myPlayers[j].getName()+ ": " + myPlayers[j].getPlaceOnBoard());
      myPlayers[j].playerRollDice();
      println("New place " + myPlayers[j].getName()+ ": " + myPlayers[j].getPlaceOnBoard());
      myTiles[myPlayers[j].getPlaceOnBoard()].addPlayerOnTile(myPlayers[j].getName());
      println("Player on tile " + myTiles[myPlayers[j].getPlaceOnBoard()].getPlaceOfTile() + " is: " + myTiles[myPlayers[j].getPlaceOnBoard()].getPlayerNameOnTile());
      for(int k = 0; k<18;k++) {
        println(myTiles[k].getNumberPlayersOnTile());
        println(myTiles[k].getPlayerNameOnTile());
        println(myTiles[k].isPlayerOnTile());
      }
  
    }
  }
  for(int i = 0; i<18;i++) {
    println(myTiles[i].getNumberPlayersOnTile());
    println(myTiles[i].getPlayerNameOnTile());
    println(myTiles[i].isPlayerOnTile());
  }
}

void draw() {
}
