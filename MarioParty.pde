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
//int screen = 0;
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

/*
  game Flappy Mario
*/
boolean flappyMarioStay5Seconds, makeGameOverScreenFlappyMario, removeGameboardInterface, onlyOnceAfterFlappyMario;
int gameScreen = 0;
//geluid bij doodgaan
import processing.sound.*;
SoundFile file;
//achtergrond afbeleeding
PImage backgroundFlappyMario;
// gameplay instellingen
float gravity = .3;
float airfriction = 0.00001;
float friction = 0.1;
//score en levens
int scoreFlappyMario = 0;
int maxHealth = 100;
float health = 100;
float healthDecrease = 5;
int healthBarWidth = 60;
//de bal
float ballX, ballY;
float ballSpeedVert = 0;
float ballSpeedHorizon = 0;
float ballSize = 20;
color ballColor = color(0);
PImage Mario;
//plaatform waar de bal op kaatst
color racketColor = color(0);
float racketWidth = 150;
float racketHeight = 15;
//muren (obstakels)
int TubeSpeed = 6;
int TubeInterval = 1500;
float lastAddTime = 0;
int minGapHeight = 350;
int maxGapHeight = 450;
int TubeWidth = 80;
color TubeColors = color(44, 62, 80);
//lijst die muren aanmaakt
ArrayList<int[]> Tubes = new ArrayList<int[]>();

  
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
  
  /*
    Setup game damien
  */
  ballX=width/4;
  ballY=height/5;
  smooth();
  Mario = loadImage("Mario.png");
  backgroundFlappyMario = loadImage("backgroundFlappyMario.png");
  flappyMarioStay5Seconds = false;
  makeGameOverScreenFlappyMario = true;
  removeGameboardInterface = true;
  onlyOnceAfterFlappyMario = false;
}

public void draw() {
  // switch case and choose which background that needs to be drawn
  if(screenBackground == screenStartBackground) {
    image(startBackground, 0, 0);
  } else if(screenBackground == screenGameboard) {  
    myGame.projectPlayerBoard();
    while(onlyOnce == 1) {
      image(gameboardBackground, 0, 0);
      onlyOnce = 0;
    }
    while(onlyOnceAfterFlappyMario) {
      showGameboardUI();
      myGame.projectPlayerBoard();
      onlyOnceAfterFlappyMario = false;
      image(gameboardBackground, 0, 0);
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
    if (gameScreen == 0) { 
      if(removeGameboardInterface) {
        removeGameboardUI();
        removeGameboardInterface = false;
      }
      initScreen(); //startscherm
    } else if (gameScreen == 1) {
      gameScreen(); //spel zelf
    } else if (gameScreen == 2) { 
      // stay for 5 seconds
      if(flappyMarioStay5Seconds) {
        // add button for next step
        /*
        btnVolgendeZet = new GButton(this, 1210, 630, 80, 30);
        btnVolgendeZet.setText("Volgende zet");
        btnVolgendeZet.addEventHandler(this, "button1_click3");
        btnDobbelen = new GButton(this, 1110, 630, 80, 30);
        btnDobbelen.setText("Dobbelen");
        btnDobbelen.addEventHandler(this, "button1_click2");
        */
        // change background
        delay(5000);
        image(gameboardBackground, 0, 0);
        // change state
        screenBackground = screenGameboard;
        flappyMarioStay5Seconds = false;
        removeGameboardInterface = true;
        onlyOnceAfterFlappyMario = true;
        println("flappyMarioStay5Seconds");
        makeGameOverScreenFlappyMario = false;
      }
      if(makeGameOverScreenFlappyMario) {
        gameOverScreen(); //scherm als je dood bent
        // add score to player
        myGame.addScore(playerNumber, scoreFlappyMario); // maybe add more points
        // replaced to method just before the score resets to 0
        println("gameOverScreen();" + scoreFlappyMario + " " + playerNumber);
      }
      makeGameOverScreenFlappyMario = true;
    }
      else if (gameScreen == 3){
      regels(); //scherm met regels
    }
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

// with myPlayers names and scores!!!!!!!
public void showGameboardUI() {
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
    lblScoreSpeler1.setText(Integer.toString(myGame.getScore(0)));
    lblScoreSpeler1.setOpaque(false);
    lblScoreSpeler2 = new GLabel(this, 1300, 280, 80, 20);
    lblScoreSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblScoreSpeler2.setText(Integer.toString(myGame.getScore(1)));
    lblScoreSpeler2.setOpaque(false);

    lblPlaats = new GLabel(this, 1410, 180, 80, 20);
    lblPlaats.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblPlaats.setText("Plaats");
    lblPlaats.setOpaque(false);
    lblPlaatsSpeler1 = new GLabel(this, 1410, 240, 80, 20);
    lblPlaatsSpeler1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblPlaatsSpeler1.setText(Integer.toString(myGame.getPlaceOnBoard(0)));
    lblPlaatsSpeler1.setOpaque(false);
    lblPlaatsSpeler2 = new GLabel(this, 1410, 280, 80, 20);
    lblPlaatsSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblPlaatsSpeler2.setText(Integer.toString(myGame.getPlaceOnBoard(1)));
    lblPlaatsSpeler2.setOpaque(false);
  }
  if(numberOfPlayers >= 3) {
    lblSpeler3 = new GLabel(this, 1110, 320, 160, 20);
    lblSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblSpeler3.setText(playerNames[2]);
    lblSpeler3.setOpaque(false);
    lblScoreSpeler3 = new GLabel(this, 1300, 320, 80, 20);
    lblScoreSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblScoreSpeler3.setText(Integer.toString(myGame.getScore(2)));
    lblScoreSpeler3.setOpaque(false);
    lblPlaatsSpeler3 = new GLabel(this, 1410, 320, 80, 20);
    lblPlaatsSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblPlaatsSpeler3.setText(Integer.toString(myGame.getPlaceOnBoard(2)));
    lblPlaatsSpeler3.setOpaque(false);
  }
  if(numberOfPlayers == 4) {
    lblSpeler4 = new GLabel(this, 1110, 360, 160, 20);
    lblSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblSpeler4.setText(playerNames[3]);
    lblSpeler4.setOpaque(false);
    lblScoreSpeler4 = new GLabel(this, 1300, 360, 80, 20);
    lblScoreSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblScoreSpeler4.setText(Integer.toString(myGame.getScore(3)));
    lblScoreSpeler4.setOpaque(false);
    lblPlaatsSpeler4 = new GLabel(this, 1410, 360, 80, 20);
    lblPlaatsSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblPlaatsSpeler4.setText(Integer.toString(myGame.getPlaceOnBoard(3)));
    lblPlaatsSpeler4.setOpaque(false);
  }
  //btnDobbelen = new GButton(this, 1110, 630, 80, 30);
  //btnDobbelen.setText("Dobbelen");
  //btnDobbelen.addEventHandler(this, "button1_click2");
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
  lblSpelerBeurt.setText(playerNames[playerNumber]);
  lblSpelerBeurt.setOpaque(false);
  lblGedobbeldeOgen = new GLabel(this, 1110, 470, 160, 20);
  lblGedobbeldeOgen.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblGedobbeldeOgen.setText("Gedobbelde ogen:");
  lblGedobbeldeOgen.setOpaque(false);
  lblAantalOgen = new GLabel(this, 1300, 470, 160, 20);
  lblAantalOgen.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblAantalOgen.setText(Integer.toString(myGame.getEyesRolled(playerNumber)));
  lblAantalOgen.setOpaque(false);
  btnVolgendeZet = new GButton(this, 1210, 630, 80, 30);
  btnVolgendeZet.setText("Volgende zet");
  btnVolgendeZet.addEventHandler(this, "button1_click3");
}

public void removeGameboardUI() {
  if(numberOfPlayers >= 2) {
    lblSpeler1.dispose();
    lblSpeler1 = null;
    lblSpeler2.dispose();
    lblSpeler2 = null;    
    lblNamen.dispose();
    lblNamen = null;
    lblScore.dispose();
    lblScore = null;
    lblScoreSpeler1.dispose();
    lblScoreSpeler1 = null;
    lblScoreSpeler2.dispose();
    lblScoreSpeler2 = null;
    lblPlaats.dispose();
    lblPlaats = null;
    lblPlaatsSpeler1.dispose();
    lblPlaatsSpeler1 = null;
    lblPlaatsSpeler2.dispose();
    lblPlaatsSpeler2 = null;
  }
  if(numberOfPlayers >= 3) {
    lblSpeler3.dispose();
    lblSpeler3 = null;
    lblScoreSpeler3.dispose();
    lblScoreSpeler3 = null;
    lblPlaatsSpeler3.dispose();
    lblPlaatsSpeler3 = null;
  }
  if(numberOfPlayers == 4) {
    lblSpeler4.dispose();
    lblSpeler4 = null;
    lblScoreSpeler4.dispose();
    lblScoreSpeler4 = null;
    lblPlaatsSpeler4.dispose();
    lblPlaatsSpeler4 = null;
  }
  btnHandleiding.dispose();
  btnHandleiding = null;
  btnSluitSpel.dispose();
  btnSluitSpel = null;
  lblBeurtAan.dispose();
  lblBeurtAan = null;
  lblSpelerBeurt.dispose();
  lblSpelerBeurt = null;
  lblGedobbeldeOgen.dispose();
  lblGedobbeldeOgen = null;
  lblAantalOgen.dispose();
  lblAantalOgen = null;
  btnVolgendeZet.dispose();
  //btnVolgendeZet = null;
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
    lblPlaatsSpeler4.setText("Start");
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

/*
  methods game Flappy Mario
*/
public void mousePressed() {
  // als op het startscherm geklikt wordt, start het spel 
  if (gameScreen==0)
  { 
    // als in dit vak geklikt wordt, opent er een scherm met de regels
    // no single game guide in game!!!
    //if(mouseX > width/2 - 150 && mouseX < width/2 + 150 && mouseY > 450 - 40 && mouseY < 450 + 40)
    //{
    //  gameScreen=3;
    //}
    //het spel start als je buiten het vak klikt
    //else
    //{
     gameScreen=1;
    //}
  }
  //spel start opnieuw
  else if (gameScreen==2) 
  {
    restart();
  }
  //als de regels open zijn, klik je ergens en gaat het beginscherm opnieuw open
  else if (gameScreen==3)
  {       
    gameScreen=0;
  }
  
}

//wanneer je dood bent, gaat dit scherm open en speelt een geluid
void gameOver() {
  file= new SoundFile(this, "gameover.wav");
  file.play();
  file.amp(2);
  gameScreen=2;
}


//reset het spel en je kunt opnieuw beginnen
void restart() {
  scoreFlappyMario = 0;
  health = maxHealth;
  ballX=width/4;
  ballY=height/5;
  lastAddTime = 0;
  Tubes.clear();
  gameScreen = 1;
  gravity = .3;
  airfriction = 0.00001;
  friction = 0.1;
  //score en levens
  scoreFlappyMario = 0;
  maxHealth = 100;
  health = 100;
  healthDecrease = 5;
  healthBarWidth = 60;
  //de bal
  ballSpeedVert = 0;
  ballSpeedHorizon = 0;
  ballSize = 20;
}

void background(){
  image(backgroundFlappyMario, 0, 0);
}

void drawBall() {
  image(Mario, ballX, ballY);  
}

void drawRacket() {
  fill(racketColor);
  rectMode(CENTER);
  rect(mouseX, mouseY, racketWidth, racketHeight, 5);
}

//na een aantal seconden komt er een muur tevoorschijn op de rechterrandvan het spel
void TubeAdder() {
  if (millis()-lastAddTime > TubeInterval) {
    int randHeight = round(random(minGapHeight, maxGapHeight));
    int randY = round(random(0, height-randHeight));
     //{gapTubeX, gapTubeY, gapTubeWidth, gapTubeHeight, scored}
    int[] randTube = {width, randY, TubeWidth, randHeight, 0}; 
    Tubes.add(randTube);
    lastAddTime = millis();
  }
}

//dit zegt wat het gedrag van de muren is
void TubeHandler() {
  for (int i = 0; i < Tubes.size(); i++) {
    TubeRemover(i);
    TubeMover(i);
    TubeDrawer(i);
    watchTubeCollision(i);
  }
}

//tekent de muur rechts
void TubeDrawer(int index) {
  int[] Tube  = Tubes.get(index);
  // get gap Tube settings 
  int gapTubeX = Tube[0];
  int gapTubeY = Tube[1];
  int gapTubeWidth = Tube[2];
  int gapTubeHeight = Tube[3];
  // draw actual Tubes
  
  noStroke();
  strokeCap(ROUND);
  fill(TubeColors);
  rect(gapTubeX, 0, gapTubeWidth, gapTubeY, 0, 0, 15, 15);
  rect(gapTubeX, gapTubeY+gapTubeHeight, gapTubeWidth, height-(gapTubeY+gapTubeHeight), 15, 15, 0, 0); 
}

//laat de muren van rechts naar links bewegen
void TubeMover(int index) {
  int[] Tube = Tubes.get(index);
  Tube[0] -= TubeSpeed;
}

//verwijdert de muren als ze de linkerrand raken
void TubeRemover(int index) {
  int[] Tube = Tubes.get(index);
  if (Tube[0]+Tube[2] <= 0) {
    Tubes.remove(index);
  }
}

//kijkt of de bal de muur raakt en doet dan een deel van de levens weg
void watchTubeCollision(int index) {
  int[] Tube = Tubes.get(index);
  // get gap Tube settings 
  int gapTubeX = Tube[0];
  int gapTubeY = Tube[1];
  int gapTubeWidth = Tube[2];
  int gapTubeHeight = Tube[3];
  int TubeScored = Tube[4];
  int TubeTopX = gapTubeX;
  int TubeTopY = 0;
  int TubeTopWidth = gapTubeWidth;
  int TubeTopHeight = gapTubeY;
  int TubeBottomX = gapTubeX;
  int TubeBottomY = gapTubeY+gapTubeHeight;
  int TubeBottomWidth = gapTubeWidth;
  int TubeBottomHeight = height-(gapTubeY+gapTubeHeight);
  
  if((ballY-(ballSize/2))==0)
  {
    decreaseHealth();
  }
  if((ballY+(ballSize/2))==750)
  {
    decreaseHealth();
  }

  if (  //kijkt of  de bol de bovenste muur raakt
      (ballX+(ballSize/2)>TubeTopX) &&
      (ballX-(ballSize/2)<TubeTopX+TubeTopWidth) &&
      (ballY+(ballSize/2)>TubeTopY) &&
      (ballY-(ballSize/2)<TubeTopY+TubeTopHeight)
    ) 
    {
      decreaseHealth();
    }
  if (  //kijkt of de bal de onderste muur raakt
      (ballX+(ballSize/2)>TubeBottomX) &&
      (ballX-(ballSize/2)<TubeBottomX+TubeBottomWidth) &&
      (ballY+(ballSize/2)>TubeBottomY) &&
      (ballY-(ballSize/2)<TubeBottomY+TubeBottomHeight)
    ) 
    {
      decreaseHealth();
    }

  //als de bal tussen de muren gaat, verandert de score
  if (ballX > gapTubeX+(gapTubeWidth/2) && TubeScored==0) {
    TubeScored=1;
    Tube[4]=1;
    score();
  }
}

//De bar met het resterende aantal levens
void drawHealthBar() {
  noStroke();
  fill(189, 195, 199);
  rectMode(CORNER);
  rect(ballX-(healthBarWidth/2), ballY - 30, healthBarWidth, 5);
  if (health > 60) 
  {
    fill(46, 204, 113);  //groen, nog veel levens
  } 
  else if (health > 30) 
  {
    fill(230, 126, 34);  //oranje, weinig levens
  } 
  else 
  {
    fill(231, 76, 60);  //rood, bijna dood
  }
  rectMode(CORNER);
  rect(ballX-(healthBarWidth/2), ballY - 30, healthBarWidth*(health/maxHealth), 5);
}


void decreaseHealth() {
  health -= healthDecrease;
  if (health <= 0) {
    gameOver();
  }
}

void score() {
  scoreFlappyMario++;
}

void printScore() {
  textAlign(CENTER);
  fill(0);
  textSize(30); 
  text(scoreFlappyMario, height/2, 50);
}

//de bal raakt het platform en "kaatst" naar boven
void watchRacketBounce() {
  float overhead = mouseY - pmouseY;
  if ((ballX+(ballSize/2) > mouseX-(racketWidth/2)) && (ballX-(ballSize/2) < mouseX+(racketWidth/2))) {
    if (dist(ballX, ballY, ballX, mouseY)<=(ballSize/2)+abs(overhead)) {
      makeBounceBottom(mouseY);
      ballSpeedHorizon = (ballX - mouseX)/10;
      // racket moving up
      if (overhead<0) {
        ballY+=(overhead/2);
        ballSpeedVert+=(overhead/2);
      }
    }
  }
}

//er wordt zwaartekracht toegepast op de bal
void applyGravity() {
  ballSpeedVert += gravity;
  ballY += ballSpeedVert;
  ballSpeedVert -= (ballSpeedVert * airfriction);
}

// de bal kan horizontaal bewegen
void applyHorizontalSpeed() {
  ballX += ballSpeedHorizon;
  ballSpeedHorizon -= (ballSpeedHorizon * airfriction);
}

//zorgt ervoor dat de bal niet buiten het scherm kan
void keepInScreen() {
  if (ballY+(ballSize/2) > height) 
  { 
    makeBounceBottom(height);
  }
  if (ballY-(ballSize/2) < 0) 
  {
    makeBounceTop(0);
  }
  if (ballX-(ballSize/2) < 0) 
  {
    makeBounceLeft(0);
  }
  if (ballX+(ballSize/2) > width) 
  {
    makeBounceRight(width);
  }
}

//als de bal de grond raakt, gaat die terug naar boven
void makeBounceBottom(float surface) {
  ballY = surface-(ballSize/2);
  ballSpeedVert*=-1;
  ballSpeedVert -= (ballSpeedVert * friction);
}

//als de bal de bovenkant raakt, keert die terug naar beneden
void makeBounceTop(float surface) {
  ballY = surface+(ballSize/2);
  ballSpeedVert*=-1;
  ballSpeedVert -= (ballSpeedVert * friction);
}

//de bal raakt de linkerkant en wordt naar rechts gestuurd
void makeBounceLeft(float surface) {
  ballX = surface+(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}

//de bal raakt de rechterkant en wordt naar links gestuurd
void makeBounceRight(float surface) {
  ballX = surface-(ballSize/2);
  ballSpeedHorizon*=-1;
  ballSpeedHorizon -= (ballSpeedHorizon * friction);
}

//startscherm
void initScreen() {
  background(236, 240, 241);
  textAlign(CENTER);
  fill(0);
  textSize(70);
  text("Flappy Mario", width/2, height/2);
  textSize(25); 
  text("Click or press ENTER to start", width/2, height/2 + height/3 - height/10);
  fill(255);
  // no button for single guide in game
  //rectMode(CENTER);
  //rect(width/2, height/2 + height/3,150,40);
  //fill(0);
  //text("rules", width/2, height/2 + height/3);
  if (keyCode == ENTER)
  {
   gameScreen=1; 
  }
}

//wat er gebeurt tijden shet spel
void gameScreen() {  
  background();
  drawRacket();
  watchRacketBounce();
  drawBall();
  applyGravity();
  applyHorizontalSpeed();
  keepInScreen();
  drawHealthBar();
  printScore();
  TubeAdder();
  TubeHandler();
}

//eindscherm, na je al je levens kwijt bent
void gameOverScreen() {
  background(44, 62, 80);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(12);
  text("Your Score", width/2, height/2 - 120);
  textSize(130);
  text(scoreFlappyMario, width/2, height/2);
  textSize(15);
  text("Click to Restart", width/2, height-30);
  flappyMarioStay5Seconds = true;
}

void regels() {
  background(236, 240, 241);  
  textSize(20);
  textAlign(LEFT);
  String s = "* De bedoeling van dit spel is dat je de bal tussen de muren krijgt door middel van het platform. Het platform kan bewogen worden door de muis, dus als de muis naar links gaat,";
  String t = "doet het platformpje dit ook.";
  String a = "* Als Mario de muur of de rand van het scherm raakt, verliest die een aantal levens. Wanneer al je levens op zijn, stopt het spel en zie je welke score je behaald hebt.";
  String b = "* De score ligt tussen";
  String c = "- 0 en 5:";
  String d = "Ga een vakje achteruit";
  String e = "- 6 en 10:";
  String f = "Blijf staan";
  String g = "- 11 en 15:";
  String h = "Ga een vakje vooruit";
  String i = "- Meer dan 16:";
  String j = "Ga twee vakjes vooruit";
  fill(0);
  text(s, 10, 50);  
  text(t, 27, 75);
  text(a, 10, 110);
  //score-aanduiding
  text(b, 50, 180);
  text(c, 100, 220);
  text(d, 300, 220);
  text(e, 100, 260);
  text(f, 300, 260);
  text(g, 100, 300);
  text(h, 300, 300);
  text(i, 100, 340);
  text(j, 300, 340);
}

void checkScore(){
  if (0 <= scoreFlappyMario && scoreFlappyMario <= 5)
  {
    //ga een vakje achteruit
  }
  else if (6 <= scoreFlappyMario && scoreFlappyMario <= 10)
  {
    //Blijf staan
  }
  else if (11 <= scoreFlappyMario && scoreFlappyMario <= 15)
  {
    //ga een vakje vooruit
  }
  else
  {
    //ga twee vakken vooruit
  }
}