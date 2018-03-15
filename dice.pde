/*
  DICE 
  Method: RollDice to get a random number between 1 and 6, 1 and 6 included
  Properties: /
*/

// TESTED: WORKS AT 22022018

public class Dice {
    
  // constructor Dice
  Dice() {
    
  }
  
  /* 
    Method to roll the dice.
    It returns a value between 1 and 6, with 1 and 6 included.
  */
  public int rollDice() {
    float eyes = 0;
    eyes = random(1,6);
    int eyesRounded = round(eyes);
    println("Dice is rolled: " + eyesRounded);
    return eyesRounded;
  }
}
