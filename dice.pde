import processing.sound.*;

public class Dice {
  
  private int rolledEyes;
    
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
    lblAantalOgen.setText(String.valueOf(eyesRounded));
    rolledEyes = eyesRounded;
    return eyesRounded;
  }
  
  /* 
    Method to get the value of the dice.
    It returns a value between 1 and 6, with 1 and 6 included.
  */
  public int getRolledEyes() {
    return rolledEyes;
  }
}