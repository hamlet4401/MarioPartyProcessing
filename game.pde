/*
  GAME
  Method: 
  Properties:
*/

// Need G4P library
import g4p_controls.*;

public class Game {
  
  // variables
  private Player[] myPlayers;
  private Tile[] myTiles;
  private Board myBoard;
  int numberOfPlayers;
  private int placeOnBoard;
  private int oldPlace, newPlace, diffrencePlace;
  
  // constructor Game
  Game() {
    // NO INSTANCE VARIABLES NEEDED!!!
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
    // constructor of tile: Tile(int placeInit, String actionInit, boolean hasActionInit, boolean hasGameInit, String coordinatesInit)
    /*
      ACTIONS (string): SNAKE, LADDER, - nameOfGame -, END OF GAME
      SNAKE on tile: 17, 35
      LADDER on tile: 4, 19, 25
      END OF GAME on tile: 38
      GAME DAMIEN on tile: 1, 2, 3, 4
    */
    // add games to some thiles when a new game is started
    for (int i = 0; i<39;i++) {
      myTiles[i] = new Tile(i,"no action", false, false, String.valueOf(i));
    }
    // add ladder on tiles
    myTiles[4].addLadder("ladder", true);
    myTiles[19].addLadder("ladder", true);
    myTiles[25].addLadder("ladder", true);
    // add snake on tiles
    myTiles[17].addLadder("snake", true);
    myTiles[35].addLadder("snake", true);
    // add end of game to last tile
    myTiles[38].addEndOfGame("end", true);
    // add minigames on tiles
    myTiles[16].addGame("Game2", true, true);
    myTiles[3].addGame("Game1", true, true);
    myTiles[7].addGame("Game3", true, true);
    myTiles[10].addGame("Game2", true, true);
    myTiles[15].addGame("Game4", true, true);
    myTiles[16].addGame("Game1", true, true);
    myTiles[20].addGame("Game3", true, true);
    myTiles[23].addGame("Game2", true, true);
    myTiles[29].addGame("Game4", true, true);
    myTiles[32].addGame("Game4", true, true);
    myTiles[33].addGame("Game1", true, true);
    myTiles[36].addGame("Game3", true, true);
    // first ask how many players, use this int to get started with the init
    // set initial number of players on the first tile
    myTiles[0].setNumberOfPlayersGameInit(numberOfPlayers);
    // initialize each player by making new objects of the class Player
    for(int i = 0; i< numberOfPlayers; i++) {
      myPlayers[i] = new Player(playerNames[i]);
    }
    // give each player its own picture
    for(int y = 0; y < numberOfPlayers; y++) {
      myPlayers[y].setPicture(myBoard.getPicture(y));  // with 4 is parameter number of players   
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
        //myTiles[myPlayers[b].getPlaceOnBoard()].doAction();
      }      
    }
    if(b == 0) {
      lblPlaatsSpeler1.setText(String.valueOf(myPlayers[b].getPlaceOnBoard()));
    } else if(b == 1) {
      lblPlaatsSpeler2.setText(String.valueOf(myPlayers[b].getPlaceOnBoard()));
    } else if(b == 2) {
      lblPlaatsSpeler3.setText(String.valueOf(myPlayers[b].getPlaceOnBoard()));
    } else if(b == 3) {
      lblPlaatsSpeler4.setText(String.valueOf(myPlayers[b].getPlaceOnBoard()));
    }
    myBoard.movePlayerOnBoard(b, myPlayers[b].getPlaceOnBoard());  
    myBoard.playersProjectedOnBoard(numberOfPlayers, myPlayers);
  }  
  
  public void gameLoop(int b) {
    // change number of players on current tile
    oldPlace = myPlayers[b].getPlaceOnBoard();
    myTiles[myPlayers[b].getPlaceOnBoard()].removePlayerOnTile(myPlayers[b].getName());
    println("Old place " + myPlayers[b].getName()+ ": " + myPlayers[b].getPlaceOnBoard());
    // roll dice for current player
    myPlayers[b].playerRollDice();
    // next line or uncomment line 43 in Player.class
    // myPlayers[b].changePlaceOnBoard(myPlayers[b].getEyesRolled());
    println("New place " + myPlayers[b].getName()+ ": " + myPlayers[b].getPlaceOnBoard());
    // add player to number of players on current tile
    newPlace = myPlayers[b].getPlaceOnBoard();
    //myTiles[myPlayers[b].getPlaceOnBoard()].addPlayerOnTile(myPlayers[b].getName());
    println("Player on tile " + myTiles[myPlayers[b].getPlaceOnBoard()].getPlaceOfTile() + " is: " + myTiles[myPlayers[b].getPlaceOnBoard()].getPlayerNamesOnTile());
    // calculate places between
    diffrencePlace = newPlace - oldPlace;
    // add number of players on the current tile
    myTiles[myPlayers[b].getPlaceOnBoard()].addPlayerOnTile(myPlayers[b].getName());
  }
  
  public void endOfStep(int b) {
    checkActions(b);
    if(b == 0) {
      lblPlaatsSpeler1.setText(String.valueOf(myPlayers[b].getPlaceOnBoard()));
    } else if(b == 1) {
      lblPlaatsSpeler2.setText(String.valueOf(myPlayers[b].getPlaceOnBoard()));
    } else if(b == 2) {
      lblPlaatsSpeler3.setText(String.valueOf(myPlayers[b].getPlaceOnBoard()));
    } else if(b == 3) {
      lblPlaatsSpeler4.setText(String.valueOf(myPlayers[b].getPlaceOnBoard()));
    }
    myBoard.movePlayerOnBoard(b, myPlayers[b].getPlaceOnBoard());  
    myBoard.playersProjectedOnBoard(numberOfPlayers, myPlayers);
  }
  
  public void projectPlayerBoard() {
    myBoard.playersProjectedOnBoard(numberOfPlayers, myPlayers);
  }
  
  public int getEyesRolled(int b) {
    return myPlayers[b].getEyesRolled();
  }
  
  public void setSteps(int b) {
    myPlayers[b].changePlaceOnBoard(1);
    myBoard.movePlayerOnBoard(b, myPlayers[b].getPlaceOnBoard());  
    myBoard.playersProjectedOnBoard(numberOfPlayers, myPlayers);
  }
  
  public int getPlaceOnBoard(int b) {
    return myPlayers[b].getPlaceOnBoard();
  }
  
  public int getScore(int b) {
    return myPlayers[b].getScore();
  }
  
  public void addScore(int b, int value) {
    println("Game.class addScore method value: " + value + "playerNumber :" + b);
    myPlayers[b].addScore(value);
  }
  
  public void changePlaceOnBoard(int value, int b) {
    myPlayers[b].changePlaceOnBoard(value);
    myBoard.movePlayerOnBoard(b, myPlayers[b].getPlaceOnBoard());  
    myBoard.playersProjectedOnBoard(numberOfPlayers, myPlayers);
  }
  
  public void checkActions(int b) {
    // check the actions on a tile (game, snake, action or end game)
    if(myTiles[myPlayers[b].getPlaceOnBoard()].hasAction()) {
      if(myTiles[myPlayers[b].getPlaceOnBoard()].hasGame()) {
        myTiles[myPlayers[b].getPlaceOnBoard()].openGame(myTiles[myPlayers[b].getPlaceOnBoard()].getGame());
      } else {
        if(myTiles[myPlayers[b].getPlaceOnBoard()].getAction() == "ladder") {
          delay(1000);
          if(myTiles[myPlayers[b].getPlaceOnBoard()].getPlaceOfTile() == 4) {
            placeOnBoard = 9;
          } else if(myTiles[myPlayers[b].getPlaceOnBoard()].getPlaceOfTile() == 19) {
            placeOnBoard = 28;
          } else if(myTiles[myPlayers[b].getPlaceOnBoard()].getPlaceOfTile() == 25) {
            placeOnBoard = 37;
          }
          myTiles[myPlayers[b].getPlaceOnBoard()].removePlayerOnTile(myPlayers[b].getName());
          myPlayers[b].playerActionOnSnakeLadder(placeOnBoard);
          myTiles[myPlayers[b].getPlaceOnBoard()].addPlayerOnTile(myPlayers[b].getName());
        } else if(myTiles[myPlayers[b].getPlaceOnBoard()].getAction() == "snake") {
          delay(1000);
          if(myTiles[myPlayers[b].getPlaceOnBoard()].getPlaceOfTile() == 17) {
            placeOnBoard = 12;
          } else if(myTiles[myPlayers[b].getPlaceOnBoard()].getPlaceOfTile() == 35) {
            placeOnBoard = 27;
          }
          myTiles[myPlayers[b].getPlaceOnBoard()].removePlayerOnTile(myPlayers[b].getName());
          myPlayers[b].playerActionOnSnakeLadder(placeOnBoard);
          myTiles[myPlayers[b].getPlaceOnBoard()].addPlayerOnTile(myPlayers[b].getName());
        } else if(myTiles[myPlayers[b].getPlaceOnBoard()].getAction() == "end") {
          delay(1000);
          // TODO: make a method to end the game
          // ... .endGame();
        } else {
          // do nothing
        }
      }      
    }
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