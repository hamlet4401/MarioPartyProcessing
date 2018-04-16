public class Player {
  
  // variables
  private String name;
  private PImage playerImage;
  private int score;
  private int placeOnBoard;
  private int scoreGames[] = new int[5]; // number of games is parameter
  Dice myDice;

  // constructor Player
  Player(String nameInit) {
    name = nameInit;
    score = 0;
    placeOnBoard = 0;
    myDice = new Dice();
  }
  
  /*
    ADD METHOD to have a visual (picture) on the board
  */
  public void setPicture(PImage imageInit) {
    playerImage = imageInit;
  }
  
  // get the picture of a player
  public PImage getPicture() {
    return playerImage;
  }
  
  /*
    Method to roll dice and get player and automatic changes the position of the player on the board
  */
  public void playerRollDice() {
     myDice.rollDice();
  }
  
  /*
    Method to get the eyes of the dice
  */
  public int getEyesRolled() {
    return myDice.getRolledEyes();
  }
  
  // method to send player to new place
  public void playerActionOnSnakeLadder(int placeOnBoardInit) {
    placeOnBoard = placeOnBoardInit;
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
  
  // method to change place on the board
  public void changePlaceOnBoard(int placeOnBoardInit) { 
    placeOnBoard = placeOnBoardInit;
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
  
  public void addScore(int initScore) {
    println("Player.class addScore method value: " + initScore);
    score = score + initScore;
    println("Player.class addScore new score value: " + score);
  }
  
  public int getScore() {
    return score;
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