/*
  PLAYER
  Method: 
  Properties:
*/

// TESTED: WORKS AT 22022018

public class Player {
  
  // variables
  private String name;
  private PImage playerImage;
  private int placeOnBoard;
  private int scoreGames[] = new int[5]; // number of games is parameter
  Dice myDice;

  // constructor Player
  Player(String nameInit) {
    name = nameInit;
    placeOnBoard = 0;
    myDice = new Dice();
  }
  
  /*
    ADD METHOD to have a visual (picture) on the board
  */
  public void setPicture(PImage imageInit) {
    playerImage = imageInit;
  }
  
  public PImage getPicture() {
    return playerImage;
  }
  
  /*
    Method to roll dice and get player and automatic changes the position of the player on the board
  */
  public void playerRollDice() {
    int rolledEyes = myDice.rollDice();
    changePlaceOnBoard(rolledEyes);
  }
  
  /*
    Method to get name from player. It returns a value (String).
  */
  public String getName() {
    return name;
  }
  
  /*
    Method to get current place of the player on the board. It returns a value of a number (int).
  */
  public int getPlaceOnBoard() {
    return placeOnBoard;
  }
  
  /*
    Method to change current place on board. It works together with the method playerRollDice().
  */
  public void changePlaceOnBoard(int places) {
    if (placeOnBoard + places == 38) {
      // method to end game and play last game for the player who wins
      placeOnBoard = placeOnBoard + places;
    } else if (placeOnBoard + places > 38) {
      int teller = 0;
      for(int i = placeOnBoard;i<38; i++) {
        placeOnBoard++;
        teller++;
      }
      int backSteps = places - teller;
      placeOnBoard = placeOnBoard - backSteps;
    } else {
      placeOnBoard = placeOnBoard + places;
    }
    
  }
  
  /*
    Method to add scores in scoreGames array.
  */
  public void addScorePerGame(String strGameName, int score) {
    switch(strGameName) {
      case "Game1": scoreGames[0] = score;
                     break;
      case "Game2": scoreGames[1] = score;
                     break;
      case "Game3": scoreGames[2] = score;
                     break;
      case "Game4": scoreGames[3] = score;
                     break;
      case "Game5": scoreGames[4] = score;
                     break;
      default:       // no score
                     break;
    }
  }
   
  /*
    Method to get scores from scoreGames array.
  */
  public int getScorePerGame(String strGameName) {
    switch(strGameName) {
      case "Game 1": return scoreGames[0];
      case "Game 2": return scoreGames[1];
      case "Game 3": return scoreGames[2];
      case "Game 4": return scoreGames[3];
      case "Game 5": return scoreGames[4];
      default:       return 0; // no score
    }
  }
}
