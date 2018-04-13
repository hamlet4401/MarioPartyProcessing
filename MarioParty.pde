// Need G4P library
import g4p_controls.*;
// import libraries
import processing.sound.*;
import java.net.*;
import java.io.*;
import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

Game myGame;
String[] playerNames;
int numberOfPlayers;
// screen: 0 board, 1 breakout
int screen = 0;
private PImage startBackground;
int screenBackground = 0;
int screenStartBackground = 0;
int screenGameboard = 1;
int screenMiniGame1 = 2;
int screenMiniGame2 = 3;
int screenMiniGame3 = 4;
int screenMiniGame4 = 5;
int screenGuide = 6;
int onlyOnce = 1;
private PImage gameboardBackground;
private PImage miniGame1Background;
private PImage miniGame2Background;
private PImage miniGame3Background;
private PImage miniGame4Background;
private PImage guideBackground;
URL urlWebsite;
SoundFile diceSound;
int teller = 0;
int tellerPlaces = 0;
int playerNumber = 0;
int tellerVoorPlaatsen = 0;
boolean diceIsRolled = false;
boolean nextStep = false;
boolean mainGame, stepGame, endStepGame, isSettingStepsTo38, onceFor38;
  
void setup() { 
  size(1600, 800, JAVA2D);
  // all windows at the same time
  //createGUI();
  // create custom GUI without other windows
  customStartGUI();
  // initialize startup variables
  numberOfPlayers = 2;
  // the third and fourth player is not initialized
  textfield3.setEnabled(false);
  textfield4.setEnabled(false);
  // initialize backgrounds
  startBackground = loadImage("startBackground.png");
  gameboardBackground = loadImage("backgroundG4P.png");
  miniGame1Background = loadImage("startBackground.png");
  miniGame2Background = loadImage("startBackground.png");
  miniGame3Background = loadImage("startBackground.png");
  miniGame4Background = loadImage("startBackground.png");
  guideBackground = loadImage("startBackground.png");
  // set default background to start the game
  image(startBackground, 0, 0);
  // initialize game states
  mainGame = true;
  stepGame = true;
  endStepGame = false;
  isSettingStepsTo38 = false;
  onceFor38 = true; 
  // initialize website
  try {
    urlWebsite = new URL("http://users.ugent.be/~lefranss/Project/index.html");
  } 
  catch (MalformedURLException e) {
      // exception handler code here
      println(e);
  }
  // initialize dice sound
  diceSound = new SoundFile(this, "diceSound.mp3");
}

public void draw() {
  // switch case and choose which background that needs to be drawn
  if(screenBackground == screenStartBackground) {
    image(startBackground, 0, 0);
  } else if(screenBackground == screenGameboard) {   
    while(onlyOnce == 1) {
      image(gameboardBackground, 0, 0);
      onlyOnce = 0;
    }
    if(diceIsRolled) {
      image(gameboardBackground, 0, 0);
      if(mainGame) {
        myGame.gameLoop(playerNumber);
        tellerVoorPlaatsen = 0;
        mainGame = false;
        stepGame = true;
      }
      diceIsRolled = false;
      if(endStepGame) {
        image(gameboardBackground, 0, 0);
        myGame.endOfStep(playerNumber);
        tellerVoorPlaatsen = 0;
        tellerPlaces = 0;
        mainGame = true;
        stepGame = false;
        diceIsRolled = false;
        endStepGame = false;
        onceFor38 = true;
        // add button for next step after the last position is visualized
        btnVolgendeZet = new GButton(this, 1210, 630, 80, 30);
        btnVolgendeZet.setText("Volgende zet");
        btnVolgendeZet.addEventHandler(this, "button1_click3");
        btnVolgendeZet.setEnabled(true);
      }
      if(stepGame) {
        // project every step on the board
        image(gameboardBackground, 0, 0);
        if(tellerVoorPlaatsen < myGame.getEyesRolled(playerNumber)) {
          tellerVoorPlaatsen++;
          if (myGame.getPlaceOnBoard(playerNumber) + myGame.getEyesRolled(playerNumber) == 38) {
            // TODO: add method to end game and play last game for the player who wins
            myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) + 1, playerNumber);
          } else if (myGame.getPlaceOnBoard(playerNumber) + myGame.getEyesRolled(playerNumber) > 38) {
            if(onceFor38) {
              isSettingStepsTo38 = true;
              onceFor38 = false;
            }
            if(myGame.getPlaceOnBoard(playerNumber) < 38 && isSettingStepsTo38) {
              myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) + 1, playerNumber);
              tellerPlaces++;
            } else {
              myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) - 1, playerNumber);
              isSettingStepsTo38 = false;
            }
          } else {
            myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) + 1, playerNumber);
          }
          delay(1000);
          diceIsRolled = true;
        }  
        if(tellerVoorPlaatsen ==  myGame.getEyesRolled(playerNumber)) {
          endStepGame = true;
        } 
      }
    }
    if(nextStep) {
      image(gameboardBackground, 0, 0);
      if(playerNumber == numberOfPlayers-1) {
        playerNumber = 0;
      } else {
        playerNumber++;
      }
      myGame.projectPlayerBoard();
      nextStep = false;
    } 
  } else if(screenBackground == screenMiniGame1) {
    image(miniGame1Background, 0, 0);
    // TODO: ADD CODE FOR MINI GAME. IF THE GAME ENDS, SET THE VAR screenBackground BACK TO THE GAMEBOARD VALUE!!!
  } else if(screenBackground == screenMiniGame2) {
    image(miniGame2Background, 0, 0);
    // TODO: ADD CODE FOR MINI GAME. IF THE GAME ENDS, SET THE VAR screenBackground BACK TO THE GAMEBOARD VALUE!!!
  } else if(screenBackground == screenMiniGame3) {
    image(miniGame3Background, 0, 0);
    // TODO: ADD CODE FOR MINI GAME. IF THE GAME ENDS, SET THE VAR screenBackground BACK TO THE GAMEBOARD VALUE!!!
  } else if(screenBackground == screenMiniGame4) {
    image(miniGame4Background, 0, 0);
    // TODO: ADD CODE FOR MINI GAME. IF THE GAME ENDS, SET THE VAR screenBackground BACK TO THE GAMEBOARD VALUE!!!
  } else if(screenBackground == screenGuide) {
    image(guideBackground, 0, 0);
    // TODO: ADD CODE FOR MINI GAME. IF THE GAME ENDS, SET THE VAR screenBackground BACK TO THE GAMEBOARD VALUE!!!
  } else {
    // No known background? Well... then you are a stupid developer because it is not possible if you have done it right!
  }
}

// Use this method to add additional statements
// to customise the GUI controls
public void customStartGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.CYAN_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  lblAantalSpelers = new GLabel(this, 630, 160, 108, 20); // new GLabel(this, 190, 160, 108, 20);
  lblAantalSpelers.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblAantalSpelers.setText("Aantal spelers:");
  lblAantalSpelers.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lblAantalSpelers.setOpaque(false);
  dropList1 = new GDropList(this, 740, 160, 90, 80, 3); // new GDropList(this, 300, 160, 90, 80, 3);
  dropList1.setItems(loadStrings("list_450554"), 0);
  dropList1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  dropList1.addEventHandler(this, "dropList1_click1");
  lblNaamSpeler1 = new GLabel(this, 630, 200, 110, 20); // new GLabel(this, 190, 200, 110, 20);
  lblNaamSpeler1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblNaamSpeler1.setText("Naam speler 1:");
  lblNaamSpeler1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lblNaamSpeler1.setOpaque(false);
  textfield1 = new GTextField(this, 740, 200, 160, 30, G4P.SCROLLBARS_NONE); // new GTextField(this, 300, 200, 160, 30, G4P.SCROLLBARS_NONE);
  textfield1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  lblNaamSpeler2 = new GLabel(this, 630, 240, 110, 20); //  new GLabel(this, 190, 240, 110, 20);
  lblNaamSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblNaamSpeler2.setText("Naam speler 2:");
  lblNaamSpeler2.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lblNaamSpeler2.setOpaque(false);
  textfield2 = new GTextField(this, 740, 240, 160, 30, G4P.SCROLLBARS_NONE);
  textfield2.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  textfield2.setOpaque(true);
  textfield2.addEventHandler(this, "textfield2_change1");
  lblNaamSpeler3 = new GLabel(this, 630, 280, 110, 20);
  lblNaamSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblNaamSpeler3.setText("Naam speler 3:");
  lblNaamSpeler3.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lblNaamSpeler3.setOpaque(false);
  textfield3 = new GTextField(this, 740, 280, 160, 30, G4P.SCROLLBARS_NONE);
  textfield3.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  textfield3.setOpaque(true);
  textfield3.addEventHandler(this, "textfield3_change1");
  lblNaamSpeler4 = new GLabel(this, 630, 320, 110, 20);
  lblNaamSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblNaamSpeler4.setText("Naam speler 4:");
  lblNaamSpeler4.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lblNaamSpeler4.setOpaque(false);
  textfield4 = new GTextField(this, 740, 320, 160, 30, G4P.SCROLLBARS_NONE);
  textfield4.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  textfield4.setOpaque(true);
  textfield4.addEventHandler(this, "textfield4_change1");
  btnStartSpel = new GButton(this, 630, 370, 270, 30);
  btnStartSpel.setText("Start spel");
  btnStartSpel.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  btnStartSpel.addEventHandler(this, "btnStartspel_event");
  btnOpenHandleiding = new GButton(this, 630, 410, 130, 30);
  btnOpenHandleiding.setText("Handleiding");
  btnOpenHandleiding.setLocalColorScheme(GCScheme.RED_SCHEME);
  btnOpenHandleiding.addEventHandler(this, "button1_click1");
  btnOpenWebsite = new GButton(this, 770, 410, 130, 30);
  btnOpenWebsite.setText("Website");
  btnOpenWebsite.setLocalColorScheme(GCScheme.RED_SCHEME);
  btnOpenWebsite.addEventHandler(this, "button2_click1");
}

public void customGameBoardUI() {
  // add new elements to UI according to how many players there are
  if(numberOfPlayers >= 2) {
    lblSpeler1 = new GLabel(this, 1110, 240, 160, 20);
    lblSpeler1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblSpeler1.setText(playerNames[0]);
    lblSpeler1.setOpaque(false);
    lblSpeler2 = new GLabel(this, 1110, 280, 160, 20);
    lblSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblSpeler2.setText(playerNames[1]);
    lblSpeler2.setOpaque(false);
    
    
    lblNamen = new GLabel(this, 1110, 180, 80, 20);
    lblNamen.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblNamen.setText("Namen");
    lblNamen.setOpaque(false);
    lblScore = new GLabel(this, 1300, 180, 80, 20);
    lblScore.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblScore.setText("Score");
    lblScore.setOpaque(false);
    lblScoreSpeler1 = new GLabel(this, 1300, 240, 80, 20);
    lblScoreSpeler1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblScoreSpeler1.setText("0");
    lblScoreSpeler1.setOpaque(false);
    lblScoreSpeler2 = new GLabel(this, 1300, 280, 80, 20);
    lblScoreSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblScoreSpeler2.setText("0");
    lblScoreSpeler2.setOpaque(false);
   
    
    lblPlaats = new GLabel(this, 1410, 180, 80, 20);
    lblPlaats.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblPlaats.setText("Plaats");
    lblPlaats.setOpaque(false);
    lblPlaatsSpeler1 = new GLabel(this, 1410, 240, 80, 20);
    lblPlaatsSpeler1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblPlaatsSpeler1.setText("Start");
    lblPlaatsSpeler1.setOpaque(false);
    lblPlaatsSpeler2 = new GLabel(this, 1410, 280, 80, 20);
    lblPlaatsSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblPlaatsSpeler2.setText("Start");
    lblPlaatsSpeler2.setOpaque(false);
    
    
  }
  if(numberOfPlayers >= 3) {
    lblSpeler3 = new GLabel(this, 1110, 320, 160, 20);
    lblSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblSpeler3.setText(playerNames[2]);
    lblSpeler3.setOpaque(false);
    lblScoreSpeler3 = new GLabel(this, 1300, 320, 80, 20);
    lblScoreSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblScoreSpeler3.setText("0");
    lblScoreSpeler3.setOpaque(false);
    lblPlaatsSpeler3 = new GLabel(this, 1410, 320, 80, 20);
    lblPlaatsSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblPlaatsSpeler3.setText("Start");
    lblPlaatsSpeler3.setOpaque(false);
  }
  if(numberOfPlayers == 4) {
    lblSpeler4 = new GLabel(this, 1110, 360, 160, 20);
    lblSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblSpeler4.setText(playerNames[3]);
    lblSpeler4.setOpaque(false);
    lblScoreSpeler4 = new GLabel(this, 1300, 360, 80, 20);
    lblScoreSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblScoreSpeler4.setText("0");
    lblScoreSpeler4.setOpaque(false);
    lblPlaatsSpeler4 = new GLabel(this, 1410, 360, 80, 20);
    lblPlaatsSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblPlaatsSpeler4.setText("Startl");
    lblPlaatsSpeler4.setOpaque(false);
  }
  btnDobbelen = new GButton(this, 1110, 630, 80, 30);
  btnDobbelen.setText("Dobbelen");
  btnDobbelen.addEventHandler(this, "button1_click2");
  btnHandleiding = new GButton(this, 1340, 630, 80, 30);
  btnHandleiding.setText("Handleiding");
  btnHandleiding.addEventHandler(this, "button2_click2");
  btnSluitSpel = new GButton(this, 1440, 630, 80, 30);
  btnSluitSpel.setText("Sluit Spel");
  btnSluitSpel.addEventHandler(this, "button3_click1");
  lblBeurtAan = new GLabel(this, 1110, 440, 160, 20);
  lblBeurtAan.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblBeurtAan.setText("De beurt is aan:");
  lblBeurtAan.setOpaque(false);
  lblSpelerBeurt = new GLabel(this, 1300, 440, 160, 20);
  lblSpelerBeurt.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblSpelerBeurt.setText(playerNames[0]);
  lblSpelerBeurt.setOpaque(false);
  lblGedobbeldeOgen = new GLabel(this, 1110, 470, 160, 20);
  lblGedobbeldeOgen.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblGedobbeldeOgen.setText("Gedobbelde ogen:");
  lblGedobbeldeOgen.setOpaque(false);
  lblAantalOgen = new GLabel(this, 1300, 470, 160, 20);
  lblAantalOgen.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblAantalOgen.setText("0");
  lblAantalOgen.setOpaque(false);
  btnVolgendeZet = new GButton(this, 1210, 630, 80, 30);
  btnVolgendeZet.setText("Volgende zet");
  btnVolgendeZet.addEventHandler(this, "button1_click3");
}

// methods to open a link
public static boolean openWebpage(URI uri) {
    Desktop desktop = Desktop.isDesktopSupported() ? Desktop.getDesktop() : null;
    if (desktop != null && desktop.isSupported(Desktop.Action.BROWSE)) {
        try {
            desktop.browse(uri);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return false;
}

public static boolean openWebpage(URL url) {
    try {
        return openWebpage(url.toURI());
    } catch (URISyntaxException e) {
        e.printStackTrace();
    }
    return false;
}