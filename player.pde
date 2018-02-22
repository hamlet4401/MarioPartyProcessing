/*
  PLAYER
  Method: 
  Properties:
*/

// TESTED: WORKS AT 22022018

class Player {
  
// variables
String name;
int age;
int placeOnBoard;
int scoreGames[] = new int[5]; // number of games is parameter
Dice myDice;

  Player(String nameInit, int ageInit) {
    name = nameInit;
    age = ageInit;
    placeOnBoard = 0;
    myDice = new Dice();
  }
  
  /*
  ADD METHOD to have a visual (picture) on the board
  */
  
  // roll the dice
  void playerRollDice() {
    int rolledEyes = myDice.rollDice();
    changePlaceOnBoard(rolledEyes);
  }
  
  // get age from player
  int getAge() {
    return age;
  }
  
  // get name from player
  String getName() {
    return name;
  }
  
  // get current place on board
  int getPlaceOnBoard() {
    return placeOnBoard;
  }
  
  // change current place on board
  void changePlaceOnBoard(int places) {
    placeOnBoard = placeOnBoard + places;
  }
  
  // add scores in scoreGames array
  void addScorePerGame(String strGameName, int score) {
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
   
  // get scores from scoreGames array
  int getScorePerGame(String strGameName) {
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
