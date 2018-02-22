/*
  DICE 
  Method: RollDice to get a random number between 1 and 6, 1 and 6 included
  Properties: /
*/

// TESTED: WORKS AT 22022018

class Dice {
  
    Dice() {
    }
    
    // methods
    
    int rollDice() {
      float eyes = 0;
      eyes = random(1,6);
      int eyesRounded = round(eyes);
      println("Dice is rolled: " + eyesRounded);
      return eyesRounded;
    }
    
    // properties
}
