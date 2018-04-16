import g4p_controls.*;

public class Game {
  
  // variables
  private Player[] myPlayers;
  private Tile[] myTiles;
  private Board myBoard;
  private int numberOfPlayers;
  private int placeOnBoard;
  private int oldPlace, newPlace;
  
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
      myTiles[i] = new Tile(i,"no action", false, false);
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
    // add minigames on tile for testing
    myTiles[1].addGame("Game3", true, true);
    myTiles[2].addGame("Game3", true, true);
    myTiles[5].addGame("Game3", true, true);
    myTiles[6].addGame("Game3", true, true);
    myTiles[8].addGame("Game3", true, true);
    myTiles[9].addGame("Game3", true, true);
    myTiles[11].addGame("Game3", true, true);
    myTiles[12].addGame("Game3", true, true);
    myTiles[13].addGame("Game2", true, true);
    myTiles[14].addGame("Game2", true, true);
    myTiles[15].addGame("Game1", true, true);
    myTiles[21].addGame("Game1", true, true);
    myTiles[22].addGame("Game1", true, true);

    
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
  
  // game loop for testing
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
  
  // game loop for the game switches player when next player is pressed
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
    // add number of players on the current tile
    myTiles[myPlayers[b].getPlaceOnBoard()].addPlayerOnTile(myPlayers[b].getName());
  }
  
  // end of steps on the board
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
  
  // project players on the board
  public void projectPlayerBoard() {
    myBoard.playersProjectedOnBoard(numberOfPlayers, myPlayers);
  }
  
  // get eyes rolled from dice
  public int getEyesRolled(int b) {
    return myPlayers[b].getEyesRolled();
  }
  
  // set steps on the board
  public void setSteps(int b) {
    myPlayers[b].changePlaceOnBoard(1);
    myBoard.movePlayerOnBoard(b, myPlayers[b].getPlaceOnBoard());  
    myBoard.playersProjectedOnBoard(numberOfPlayers, myPlayers);
  }
  
  // get place on the board
  public int getPlaceOnBoard(int b) {
    return myPlayers[b].getPlaceOnBoard();
  }
  
  // get score of playerX
  public int getScore(int b) {
    return myPlayers[b].getScore();
  }
  
  // add score to playerX
  public void addScore(int b, int value) {
    println("Game.class addScore method value: " + value + "playerNumber :" + b);
    myPlayers[b].addScore(value);
  }
  
  // change place on the board
  public void changePlaceOnBoard(int value, int b) {
    myPlayers[b].changePlaceOnBoard(value);
    myBoard.movePlayerOnBoard(b, myPlayers[b].getPlaceOnBoard());  
    myBoard.playersProjectedOnBoard(numberOfPlayers, myPlayers);
  }
  
  // check if there is an action on a tile
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