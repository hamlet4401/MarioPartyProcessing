/*
  GAME
  Method: 
  Properties:
*/

// NOT TESTED!

public class Game {
  // variables
  private Player[] myPlayers;
  private Tile[] myTiles;
  private Board myBoard;
  int numberOfPlayers;
  
  // constructor Game
  Game() {
    
  }
  
  public void newGame(int numberOfPlayersInit, String[] playerNames){
    // initialize variables
    numberOfPlayers = numberOfPlayersInit;
    myPlayers = new Player[numberOfPlayers];
    myTiles = new Tile[39];
    // parmeter is number of players
    myBoard = new Board(numberOfPlayers);
    // board background
    myBoard.setBackground();
    
    // initialize each tile by making new objects of the class Tile with 39 the number of tiles on the board
    for (int i = 0; i<39;i++) {
      myTiles[i] = new Tile(i,"no action", false, false, String.valueOf(i));
    }
    
    // first ask how many players, use this int to get started with the init
    // set initial number of players on the first tile
    myTiles[0].setNumberOfPlayersGameInit(numberOfPlayers);
    
    // initialize each player by making new objects of the class Player
    for(int i = 0; i< numberOfPlayers; i++) {
      myPlayers[i] = new Player(playerNames[i]);
    }
    
    // give each player its own picture
    for(int y = 0; y < 4; y++) {
      myPlayers[y].setPicture(myBoard.setPictureInit(y));  // with 4 is parameter number of players   
    }
  }
  
  public void automatedDelayGame(int b) {
    myTiles[myPlayers[b].getPlaceOnBoard()].removePlayerOnTile(myPlayers[b].getName());
    println("Old place " + myPlayers[b].getName()+ ": " + myPlayers[b].getPlaceOnBoard());
    myPlayers[b].playerRollDice();
    println("New place " + myPlayers[b].getName()+ ": " + myPlayers[b].getPlaceOnBoard());
    myTiles[myPlayers[b].getPlaceOnBoard()].addPlayerOnTile(myPlayers[b].getName());
    println("Player on tile " + myTiles[myPlayers[b].getPlaceOnBoard()].getPlaceOfTile() + " is: " + myTiles[myPlayers[b].getPlaceOnBoard()].getPlayerNamesOnTile());
    if(myTiles[myPlayers[b].getPlaceOnBoard()].hasAction()) {
      if(myTiles[myPlayers[b].getPlaceOnBoard()].hasGame()) {
        myTiles[myPlayers[b].getPlaceOnBoard()].openGame(myTiles[myPlayers[b].getPlaceOnBoard()].getGame());
      } else {
        myTiles[myPlayers[b].getPlaceOnBoard()].doAction();
      }      
    }
    myBoard.movePlayerOnBoard(b, myPlayers[b].getPlaceOnBoard());  
    myBoard.playersProjectedOnBoard(numberOfPlayers, myPlayers);
  }  
}

/* UNUSED BUT USEFULL CODE */

// TEST om alle tegels te testen of ze juist geplaatst zijn
/*
Player[] myTestPlayers;
myTestPlayers = new Player[39];
for (int i = 0;i<39;i++) {
  myTestPlayers[i] = new Player("player 1", 18);
  myTestPlayers[i].setPicture(myBoard.setPictureInit(1));
  myTestPlayers[i].changePlaceOnBoard(i);
  myTiles[myTestPlayers[i].getPlaceOnBoard()].addPlayerOnTile(myTestPlayers[i].getName());
  myBoard.movePlayerOnBoard(myTestPlayers[i].getPicture(), myTestPlayers[i].getPlaceOnBoard());
}
*/
// END TEST

// TEST om alle tegels te testen of ze juist geplaatst zijn
/*
public void automatedTestGame() {
  // an automated game to check if the program is right
  
  for (int i = 0; i<12; i++) {
    for (int j=0; j < numberOfPlayers; j++) {
      myTiles[myPlayers[j].getPlaceOnBoard()].removePlayerOnTile(myPlayers[j].getName());
      println("Old place " + myPlayers[j].getName()+ ": " + myPlayers[j].getPlaceOnBoard());
      myPlayers[j].playerRollDice();
      println("New place " + myPlayers[j].getName()+ ": " + myPlayers[j].getPlaceOnBoard());
      myTiles[myPlayers[j].getPlaceOnBoard()].addPlayerOnTile(myPlayers[j].getName());
      println("Player on tile " + myTiles[myPlayers[j].getPlaceOnBoard()].getPlaceOfTile() + " is: " + myTiles[myPlayers[j].getPlaceOnBoard()].getPlayerNamesOnTile());
      for(int k = 0; k<18;k++) {
        println(myTiles[k].getNumberPlayersOnTile());
        println(myTiles[k].getPlayerNamesOnTile());
        println(myTiles[k].isPlayerOnTile());
      }
    }
  }
  
  for(int q = 0; q<numberOfPlayers;q++) {
    myBoard.movePlayerOnBoard(q, myPlayers[q].getPlaceOnBoard());
    println("place on board");
    println(myPlayers[q].getPlaceOnBoard());
  }
  println("Endpositions");
  for(int i = 0; i<39;i++) {
    println(myTiles[i].getNumberPlayersOnTile());
    println(myTiles[i].getPlayerNamesOnTile());
    println(myTiles[i].isPlayerOnTile());
  }
}
*/
// END TEST

// TEST om alle tegels te testen of ze juist geplaatst zijn
/*

*/
// END TEST
