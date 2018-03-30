/*
  BOARD
  Method: 
  Properties: 
*/

// TESTED: WORKS AT 15032018

public class Board {
  
  private int tilesMiddleToMiddleDistance = 66;
  private PImage boardgame;
  private PImage pictureRed;
  private PImage pictureGreen;
  private PImage pictureBlue;
  private PImage pictureYellow;
  private int numberOfPlayers;
  int x =0;
  int y = 0;

  // constructor Board
  Board(int numberOfPlayersInit) {
    numberOfPlayers = numberOfPlayersInit;
    for(int i = 0; i<numberOfPlayers; i++) {
      
    }
    // board setup
    //boardgame = loadImage("gameboard.jpg");
    //boardgame.resize(0, 550);
    pictureRed = loadImage("red.png");
    pictureRed.resize(0, 40);
    pictureGreen = loadImage("green.png");
    pictureGreen.resize(0, 40);
    pictureBlue = loadImage("blue.png");
    pictureBlue.resize(0, 40);
    pictureYellow = loadImage("yellow.png");
    pictureYellow.resize(0, 40);
  }
  
  // give a picture to a player
  public PImage setPictureInit(int numberOfPlayer) {
    switch(numberOfPlayer) {
      case 0: 
        // set image 
        return pictureRed;
      case 1: 
        // set image
        return pictureGreen;
      case 2: 
        // set image
        return pictureBlue;
      case 3: 
        // set image
        return pictureYellow;
      default:
        return pictureRed;
    }
  }
  
  public void setBackground() {
    // draw board
    //image(boardgame, 0, 0);
    //image(pictureRed, 78,60);
  }
  
  public void playersProjectedOnBoard(int numberOfPlayers, Player[] player) {
    //setBackground();
    for(int i=0; i<numberOfPlayers;i++) {
      movePlayerOnBoard(i,player[i].getPlaceOnBoard());
    }
  }
  
  public void movePlayerOnBoard(int picture, int position) {    
    switch (position) {
      case 0:
        x = 125;
        y = 95;
        break;
      case 1:
        x = 125;
        y = 95+100-4;
        break;
      case 2:
        x = 125;
        y = 95+200-8;
        break;
      case 3:
        x = 125;
        y = 95+300-12;
        break;
      case 4:
        x = 125;
        y = 95+400-16;
        break;
      case 5:
        x = 125;
        y = 95+500-20;
        break;
      case 6:
        x = 125;
        y = 95+600-24;
        break;
      case 7:
        x = 125+100-4;
        y = 95+600-24;
        break;
      case 8:
        x = 125+200-8;
        y = 95+600-24;
        break;
      case 9:
        x = 125+200-8;
        y = 95+500-20;
        break;
      case 10:
        x = 125+200-8;
        y = 95+400-16;
        break;
      case 11:
        x = 125+200-8;
        y = 95+300-12;
        break;
      case 12:
        x = 125+200-8;
        y = 95+200-8;
        break;
      case 13:
        x = 125+200-8;
        y = 95+100-4;
        break;
      case 14:
        x = 125+200-8;
        y = 95;
        break;
      case 15:
        x = 125+300-12;
        y = 95;
        break;
      case 16:
        x = 125+400-16;
        y = 95;
        break;
      case 17:
        x = 125+400-16;
        y = 95+100-4;
        break;
      case 18:
        x = 125+400-16;
        y = 95+200-8;
        break;
      case 19:
        x = 125+400-16;
        y = 95+300-12;
        break;
      case 20:
        x = 125+400-16;
        y = 95+400-16;
        break;
      case 21:
        x = 125+400-16;
        y = 95+500-20;
        break;
      case 22:
        x = 125+400-16;
        y = 95+600-24;
        break;
      case 23:
        x = 125+500-20;
        y = 95+600-24;
        break;
      case 24:
        x = 125+600-24;
        y = 95+600-24;
        break;
      case 25:
        x = 125+600-24;
        y = 95+500-20;
        break;
      case 26:
        x = 125+600-24;
        y = 95+400-16;
        break;
      case 27:
        x = 125+600-24;
        y = 95+300-12;
        break;
      case 28:
        x = 125+600-24;
        y = 95+200-8;
        break;
      case 29:
        x = 125+600-24;
        y = 95+100-4;
        break;
      case 30:
        x = 125+600-24;
        y = 95;
        break;
      case 31:
        x = 125+700-28;
        y = 95;
        break;
      case 32:
        x = 125+800-32;
        y = 95;
        break;
      case 33:
        x = 125+800-32;
        y = 95+100-4;
        break;
      case 34:
        x = 125+800-32;
        y = 95+200-8;
        break;
      case 35:
        x = 125+800-32;
        y = 95+300-12;
        break;
      case 36:
        x = 125+800-32;
        y = 95+400-16;
        break;
      case 37:
        x = 125+800-32;
        y = 95+500-20;
        break;
      case 38:
        x = 125+800-32;
        y = 95+600-24;
        break;
      default:
        x = 0;
        y = 0;
        break;
    }
    switch(picture) {
      case 0:  image(pictureRed, x, y);
               break;
      case 1:  image(pictureGreen, x, y);
               break;
      case 2:  image(pictureBlue, x, y);
               break;
      case 3:  image(pictureYellow, x, y);
               break;
        
    }
    
  }
}