// variables
  Player[] myPlayers;
  Tile[] myTiles;
  PImage bg; // background image
  
void setup() {
  size(901,694);
  // ui
  //bg = loadImage("gameboard.PNG");
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
      myTiles[myPlayers[j].getPlaceOnBoard()].removePlayerOnTile();
      println("Old place " + myPlayers[j].getName()+ ": " + myPlayers[j].getPlaceOnBoard());
      myPlayers[j].playerRollDice();
      println("New place " + myPlayers[j].getName()+ ": " + myPlayers[j].getPlaceOnBoard());
      myTiles[myPlayers[j].getPlaceOnBoard()].addPlayerOnTile(myPlayers[j].getName());
      println("Player on tile " + myTiles[myPlayers[j].getPlaceOnBoard()].getPlaceOfTile() + " is: " + myTiles[myPlayers[j].getPlaceOnBoard()].getPlayerNameOnTile());
    }
  }
}

void draw() {
  // give UI white background
  background(256);
  //image(bg,0,0,width,height); // add image to background
  textSize(30); // increase text height
  fill(0,0,256); // give the text some color
}
