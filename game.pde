/*
  GAME
  Method: 
  Properties:
*/

// NOT TESTED!

public class Game {
  Player player1;
  Tile[] myTiles;
  Dice myDice;
  int numberTiles;
  
    Game() {
      
    }
    
    public void Main() {
      
      // declaration variables
      numberTiles = 20;
      
      try {
        Player myPlayer[] = new Player[4];
      } catch (Exception e) {
         println(e);
      }
      player1 = new Player("Player One", 18);
      myDice = new Dice();
      myTiles = new Tile[numberTiles];
      myTiles[0] = new Tile(1,"no",false, "1,1");
      myTiles[1] = new Tile(2,"no",false, "1,2");
      myTiles[2] = new Tile(3,"no",false, "1,3");
      myTiles[3] = new Tile(4,"no",false, "2,3");
      myTiles[4] = new Tile(5,"no",false, "2,2");
      myTiles[5] = new Tile(6,"no",false, "2,1");
      myTiles[6] = new Tile(7,"no",false, "3,1");
      myTiles[7] = new Tile(8,"no",false, "3,2");
      myTiles[8] = new Tile(9,"no",false, "3,3");
      myTiles[9] = new Tile(10,"no",false, "4,3");
    }
    
    
    // methods
    public void addPlayer(String playerName, int playerAge) {
      Player myPlayer[] = new Player[4];
    }
    // properties
}
