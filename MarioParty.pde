import g4p_controls.*;
import java.awt.Font;
import java.awt.*;
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
private PImage startBackground;
int screenBackground;
int screenStartBackground;
int screenGameboard;
int screenMiniGame1;
int screenMiniGame2;
int screenMiniGame3;
int screenMiniGame4;
int screenMiniGame5;
int screenMiniGame6;
int screenPlayerWin;
int screenGuide;
int onlyOnce;
private PImage gameboardBackground;
URL urlWebsite;
SoundFile diceSound;
int teller;
int tellerPlaces;
int playerNumber;
int tellerVoorPlaatsen;
boolean diceIsRolled;
boolean nextStep;
boolean mainGame, stepGame, endStepGame, isSettingStepsTo38, onceFor38;

/*
  game Flappy Mario
*/
boolean marioMolStay5Seconds, onlyOnceAfterMarioMol, makeGameOverScreenMarioMol;
boolean marioApplesStay5Seconds, onlyOnceAfterMarioApples, makeGameOverScreenMarioApples;
boolean flappyMarioStay5Seconds, MarioFirevasionStay5Seconds, onlyOnceAfterMarioFirevasion, makeGameOverScreenMarioFirevasion, makeGameOverScreenFlappyMario, removeGameboardInterface, onlyOnceAfterFlappyMario;
boolean marioArrowStay5Seconds, onlyOnceAfterMarioArrow, makeGameOverScreenMarioArrow;
int gameScreen = 0;
import processing.sound.*;
SoundFile file;
PImage backgroundFlappyMario;
float gravity = .3;
float airfriction = 0.00001;
float friction = 0.1;
int scoreFlappyMario = 0;
int maxHealth = 100;
float health = 100;
float healthDecrease = 5;
int healthBarWidth = 60;
float ballX, ballY;
float ballSpeedVert = 0;
float ballSpeedHorizon = 0;
float ballSize = 20;
color ballColor = color(0);
PImage Mario;
color racketColor = color(0);
float racketWidth = 150;
float racketHeight = 15;
int TubeSpeed = 6;
int TubeInterval = 1500;
float lastAddTime = 0;
int minGapHeight = 350;
int maxGapHeight = 450;
int TubeWidth = 80;
color TubeColors = color(44, 62, 80);
ArrayList<int[]> Tubes = new ArrayList<int[]>();

/*
  Variables Mario firevasion
*/
 PImage img1;
 PImage img2;
 PImage img3;
 PImage img4;
 PImage img5;
 PImage img6;
float xMarioFirevasion = 760;    
float yMarioFirevasion = 700;   
float speedMarioFirevasion = 12;  //snelheid van beweging
float leftPosition = 410;   
float ylaser1 = (111.111)+5;
float ylaser2 = (222.222)+5;
float ylaser3 = (333.333)+5;
float ylaser4 = (444.444)+5;
float ylaser5 = (555.555)+5;
int stage = 1;
int startingTime;
int n = 1;
int interval1 = 1;
int interval2 = 2;
int interval3 = 3;
int interval4 = 4;
int interval5 = 5;
int livesMarioFirevasion = 3;
boolean life = true; 
  
/*
  Variables mario arrow
*/
boolean runMarioArrow;
import processing.sound.*; // library's
SoundFile file1;
SoundFile file2;
SoundFile file3;
float x, y;
float speedMarioArrow= 12;
int dim = 22;
int LL = 2;
int LW = 40;
int UDRL = 0;
int time;
int rect1Width = 700;
int rect1Height = 400;
int rectWidth;
int rectHeight;
int midX = width/2;
int midY = height/2;
private int tellerMarioArrow;
private int tijd;
PImage imgUP;
PImage imgDown;
PImage imgLeft;
PImage imgRight;
PImage imgGameOver;
PImage imgGameWin;
PImage Spel_Background;
color geel = color(255, 204, 0); 
color lichtBlauw = color(50, 55, 100);
color donkerGroen = color(180, 50, 50);
color rood = color(255,200,200);
color transparant = color(255,0,0,128);
color white = color(255);
color colloooor;
color fill;
color fill2;

/*
  Variables Mario Apples
*/
int [] xMarioApples;                                      
float [] yMarioApples;
float [] bx;                                      
float [] by;
int scoreMarioApples=0;
int blokjes=20, bommen=5;
PImage appel,bom;
PImage mand;
PImage bg;
PImage marioMarioApples;

/*
  Variables Mario Mol
*/
boolean marioMolIsRunning;
PImage mol;
PImage molsgat;
PImage hamer;
PImage uitroep;
PImage gras;
float [] xMarioMol= {400, 400, 800, 800, 1200, 1200};
float [] yMarioMol= {250, 500, 250, 500, 250, 500};
int scoreMarioMol=0;
int mollen=5;
int prog=0;
boolean [] aan;
int [] tijdMarioMol;
float [] randomMarioMol;
  
void setup() { 
  frameRate(1000);
  size(1600, 800, JAVA2D);
  // create custom GUI without other windows
  customStartGUI();
  // initialize startup variables
  numberOfPlayers = 2;
  screenBackground = 0;
  screenStartBackground = 0;
  screenGameboard = 1;
  screenMiniGame1 = 2;
  screenMiniGame2 = 3;
  screenMiniGame3 = 4;
  screenMiniGame4 = 5;
  screenMiniGame5 = 6;
  screenMiniGame6 = 7;
  screenPlayerWin = 8;
  screenGuide = 9;
  onlyOnce = 1;
  teller = 0;
  tellerPlaces = 0;
  playerNumber = 0;
  tellerVoorPlaatsen = 0;
  diceIsRolled = false;
  nextStep = false;
  // the third and fourth player is not initialized
  textfield3.setEnabled(false);
  textfield4.setEnabled(false);
  // initialize backgrounds
  startBackground = loadImage("startBackground.png");
  gameboardBackground = loadImage("backgroundG4P.png");
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
      // exception handler
      println(e);
  }
  // initialize dice sound
  diceSound = new SoundFile(this, "diceSound.mp3");
  
  /*
    Setup flappy mario
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
  
  /* 
    Setup mario firevasion
  */
  img4 = loadImage("startscherm.jpg");
  img1 = loadImage("laser.jpg");
  img2 = loadImage("bowser.png");
  img3 = loadImage("background.jpg");
  img5 = loadImage("hero.jpg");
  img6 = loadImage("pause.jpg");
  MarioFirevasionStay5Seconds = false;
  onlyOnceAfterMarioFirevasion = false;
  makeGameOverScreenMarioFirevasion = true;
  
  /*
    Setup mario arrow
  */
  noStroke();
  time=millis();
  rectWidth = 5*dim;
  rectHeight = 2*dim;
  x = midX + width/4 - 2*dim;
  fill = transparant;
  imgUP = loadImage("pijl_omhoog.jpg");
  imgDown = loadImage("pijl_Onder.jpg");
  imgLeft = loadImage("pijl_links.jpg");
  imgRight = loadImage("pijl_Rechts.jpg");
  imgGameOver = loadImage("Gameover.jpg");
  imgGameWin = loadImage("Mariovlag.jpg");
  Spel_Background = loadImage("Spel_Background.png");
  marioArrowStay5Seconds = false;
  onlyOnceAfterMarioArrow = false;
  makeGameOverScreenMarioArrow = true;
  runMarioArrow = true;
  
  /*
    Setup Mario apples
  */
  xMarioApples = new int [blokjes];
  yMarioApples = new float [blokjes];
  bx = new float [bommen];
  by = new float [bommen];
  appel=loadImage("appel.png");                  //afbeeldingen laden
  mand=loadImage("mand.png");
  bg=loadImage("bg.jpg");
  marioMarioApples=loadImage("marioStanding.png");
  bom=loadImage("bom.png");
  for (int i=0; i<blokjes; i++) {               //beginposities van appels declareren
    yMarioApples[i] = random(50, 1750);
    xMarioApples[i] = int(-100*random(1, 10));
  }
  for (int i=0; i<bommen; i++) {               //beginposities van bommen declareren
    by[i] = random(50, 1750);
    bx[i] = -100*random(1, 10);
  }
  marioApplesStay5Seconds = false;
  onlyOnceAfterMarioApples = false;
  makeGameOverScreenMarioApples = true;
  
  /*
    Mario Mol setup
  */
  marioMolIsRunning = false;
  hamer=loadImage("hamer.png");
  mol=loadImage("mol.png");
  molsgat=loadImage("molsgat.png");
  uitroep=loadImage("uitroepteken.png");
  gras=loadImage("gras.png");
  tijdMarioMol = new int [6];
  aan = new boolean [6];
  randomMarioMol = new float [6];
  for (int i=0; i<6; i++) {
    randomMarioMol[i] = random(0, 400);
  }
  marioMolStay5Seconds = false;
  onlyOnceAfterMarioMol = false;
  makeGameOverScreenMarioMol = true;
}

/*
  Main game in draw method
*/
public void draw() {
  /*
    Initialization of the game on the first window
  */
  if(screenBackground == screenStartBackground) {
    image(startBackground, 0, 0);
  } 
  /*
    Gameboard to play the main game
  */
  else if(screenBackground == screenGameboard) {  
    // project players on gameboard
    myGame.projectPlayerBoard();
    // set new background after the first window
    while(onlyOnce == 1) {
      image(gameboardBackground, 0, 0);
      onlyOnce = 0;
    }
    // generate a new UI after Flappy Mario Game
    while(onlyOnceAfterFlappyMario) {
      showGameboardUI();
      myGame.projectPlayerBoard();
      onlyOnceAfterFlappyMario = false;
      image(gameboardBackground, 0, 0);
    }
    // generate a new UI after Mario Arrow Game
    while(onlyOnceAfterMarioArrow) {
      showGameboardUI();
      myGame.projectPlayerBoard();
      onlyOnceAfterMarioArrow = false;
      image(gameboardBackground, 0, 0);
    }
    // generate a new UI after Mario Firevision
    while(onlyOnceAfterMarioFirevasion) {
      showGameboardUI();
      myGame.projectPlayerBoard();
      onlyOnceAfterMarioFirevasion = false;
      image(gameboardBackground, 0, 0);
    }
    while(onlyOnceAfterMarioApples) {
      showGameboardUI();
      myGame.projectPlayerBoard();
      onlyOnceAfterMarioApples = false;
      image(gameboardBackground, 0, 0);
    }
    while(onlyOnceAfterMarioMol) {
      showGameboardUI();
      myGame.projectPlayerBoard();
      onlyOnceAfterMarioMol = false;
      image(gameboardBackground, 0, 0);
    }
    // when the dice is rolled
    if(diceIsRolled) {
      image(gameboardBackground, 0, 0);
      // play the main game
      if(mainGame) {
        myGame.gameLoop(playerNumber);
        tellerVoorPlaatsen = 0;
        mainGame = false;
        stepGame = true;
      }
      diceIsRolled = false;
      // the end of the steps of a player on the gameboard
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
      // show the steps that the player is doing on the gameboard after rolling the dice
      if(stepGame) {
        image(gameboardBackground, 0, 0);
        // only when there are steps to be taken
        if(tellerVoorPlaatsen < myGame.getEyesRolled(playerNumber)) {
          tellerVoorPlaatsen++;
          // end of the gameboard but not exactly thrown the eyes to become 38
          if (myGame.getPlaceOnBoard(playerNumber) + myGame.getEyesRolled(playerNumber) > 38) {
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
          // 1 second between every step
          delay(1000);
          diceIsRolled = true;
        }  
        // if the player is on 38 and there are no steps to be taken anymore
        if(tellerVoorPlaatsen ==  myGame.getEyesRolled(playerNumber)) {
          if (myGame.getPlaceOnBoard(playerNumber) == 38) {
            println("player wins");
            // TODO: add method to end game and play last game for the player who wins
            isSettingStepsTo38 = false;
            screenBackground = screenPlayerWin;
            myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) + 1, playerNumber);
          }
          endStepGame = true;
        } 
      }
    }
    // change variables when the next step is pressed
    if(nextStep) {
      image(gameboardBackground, 0, 0);
      if(playerNumber == numberOfPlayers-1) {
        playerNumber = 0;
      } else {
        playerNumber++;
      }
      // project players on the gameboard
      myGame.projectPlayerBoard();
      nextStep = false;
    } 
  } 
  /*
    Screen at end of game
  */
  else if(screenBackground == screenPlayerWin) {
    // end of the game and show score and name of the winner
    if(removeGameboardInterface) {
        removeGameboardUIEndOfGame();
        removeGameboardInterface = false;
    }
    background(44, 62, 80);
    textAlign(CENTER);    // after this, set it back to left!!!
    fill(255, 255, 255);
    textSize(130);
    text(playerNames[playerNumber], width/2, height/2 - 85);
    textSize(65);
    text("won the game with a score of" , width/2, height/2);
    textSize(130);
    text(myGame.getScore(playerNumber), width/2, height/2 + 150);
  } 
  /*
    Flappy Mario Game
  */
  else if(screenBackground == screenMiniGame1) {
    if (gameScreen == 0) { 
      if(removeGameboardInterface) {
        removeGameboardUI();
        removeGameboardInterface = false;
      }
      // start screen
      initScreen();
    } else if (gameScreen == 1) {
      // loop of the game
      gameScreen();
    } else if (gameScreen == 2) { 
      if(flappyMarioStay5Seconds) {
        // stay for 5 seconds
        delay(5000);
        // change background 
        image(gameboardBackground, 0, 0);
        // change state
        screenBackground = screenGameboard;
        // variables to the value when the game is stopped
        flappyMarioStay5Seconds = false;
        removeGameboardInterface = true;
        onlyOnceAfterFlappyMario = true;
        makeGameOverScreenFlappyMario = false;
        checkScore();
        myGame.checkActionsAfterGame(playerNumber);
        restartFlappyMario();
      }
      if(makeGameOverScreenFlappyMario) {
        // screen if the minigame ends
        gameOverScreen();
        // add score to player
        myGame.addScore(playerNumber, scoreFlappyMario); // maybe add more points
      }
      makeGameOverScreenFlappyMario = true;
    }
      else if (gameScreen == 3){
        // screen with rules
        regels();
    }
  } 
  /*
    Mario Firevision Game
  */
  else if(screenBackground == screenMiniGame2) { 
    if(stage == 1) {
      // remove the gameboard UI
      if(removeGameboardInterface) {
        removeGameboardUI();
        removeGameboardInterface = false;
      }
      // ADD TO SET IT BACK TO THE RIGHT POSITION (CENTER)!!!
      textAlign(LEFT);
      image(img4,0,0,width,height);
      textSize(100);
      fill(150,0,0);
      text("Mario Firevasion", 1600/3.8, 800/10); 
      textSize(50);
      fill(150,150,0);
      text("Press any key to continue", 1600/3.2, 800/1.074626865671642); 
      if (keyPressed) {
        stage = 2;
      }
    }
    else {
      image(img3,0,0, width, height);
      fill(255);
      rect(width/3.97,3,width/2.03,height/10.2,7);
      rect(width/38,height/8.41,305,145,7);
      fill(25);
      rect(width/3.95,5,width/2.04,height/10.8,7);
      rect(width/36,height/8.2,300,140,7);
      fill(150,0,0);
      text("Lives left:" + livesMarioFirevasion, 1600/30, 800/5.4);
      textSize(35);
      text("Press P to pause", 1600/1.3, 800/1.02);
      textSize(50);
      // level 1
      if(stage == 3) {
        text("LEVEL 1", 1600/30, 800/4);
        if (life == true){                             
          drawHero();
        }
        // move the hero
        keyPressedMarioFirevasion();
        drawEnemy();
        drawProjectile1();
        finish();
        textSize(50);
        if( (keyCode == 'P' || keyCode == 'p') ) {
          stage = 4;
        }
      }
      // pause 1
      if(stage == 4) {
        image(img6,-50,0, width+50, height);
        textSize(50);
        fill(150,150,0);
        text("Press ENTER to resume", 1600/3.2, 800/1.074626865671642);
        if (keyCode == ENTER) {
          stage = 3;
        }
      }
      // level 2
      if (stage == 6) {
        text("LEVEL 2", 1600/30, 800/4);
        if (life == true){
          drawHero();
        }
        keyPressedMarioFirevasion();                                                                                       
        drawEnemy();
        drawProjectile2();
        finish();
        textSize(50);
        if( (keyCode == 'P' || keyCode == 'p') ) {
          stage = 7;
        }
      } 
      // pause 2
      if(stage == 7) {
        image(img6,-50,0, width+50, height);
        textSize(50);
        fill(150,150,0);
        text("Press ENTER to resume", 1600/3.2, 800/1.074626865671642);
        if (keyCode == ENTER) {
          stage = 6;
        }
      }
      // level 3
      if (stage == 9) {                  
        text("LEVEL 3", 1600/30, 800/4);
        if (life == true){
          drawHero();
        }
        keyPressedMarioFirevasion();
        drawEnemy();
        drawProjectile3();
        finish();
        textSize(50);
        if( (keyCode == 'P' || keyCode == 'p') ) {
          stage = 10;
        }
      }
      // pause 3
      if(stage == 10) { 
        image(img6,-50,0, width+50, height);
        textSize(50);
        fill(150,150,0);
        text("Press ENTER to resume", 1600/3.2, 800/1.074626865671642);
        if (keyCode == ENTER) {
          stage = 9;
        }
      }
       // end of the game
      if (stage == 11) {
        if(MarioFirevasionStay5Seconds) {
          // stay 5 seconds
          delay(5000);
          // change background
          image(gameboardBackground, 0, 0);
          // change state
          screenBackground = screenGameboard;
          // variables to the value when the game is stopped
          MarioFirevasionStay5Seconds = false;
          removeGameboardInterface = true;
          onlyOnceAfterMarioFirevasion = true;
          makeGameOverScreenMarioFirevasion = false;
          stage = 1;
          // add score to player
          myGame.addScore(playerNumber, 25);
          // reset values for the next time         
          myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) + 1, playerNumber);
          myGame.checkActionsAfterGame(playerNumber);
          resetMarioFirevasion();
        }
        if(makeGameOverScreenMarioFirevasion) {
          background(0);
          fill(25,200,200);
          textAlign(CENTER);
          textSize(80);
          text("You win!", 1600/2,800/2);
          MarioFirevasionStay5Seconds = true;
        }
        makeGameOverScreenMarioFirevasion = true;
      }
      // end of the game
      if (stage == 12) {
          if(MarioFirevasionStay5Seconds) {
          // stay for 5 seconds
          delay(5000);
          // change background
          image(gameboardBackground, 0, 0);
          // change state
          screenBackground = screenGameboard;
          // variables to the value when the game is stopped
          MarioFirevasionStay5Seconds = false;
          removeGameboardInterface = true;
          onlyOnceAfterMarioFirevasion = true;
          makeGameOverScreenMarioFirevasion = false;
          stage = 1;
          // add score to player
          myGame.addScore(playerNumber, 0);
          // reset values for the next time
          resetMarioFirevasion();
        }
        if(makeGameOverScreenMarioFirevasion) {
          background(0);
          fill(25,200,200);
          textAlign(CENTER);
          textSize(80);
          text("You lose!", 1600/2, 800/2); //scherm als je dood bent
          MarioFirevasionStay5Seconds = true;
        }
        makeGameOverScreenMarioFirevasion = true;
      }
    }
    // screen when hero is dead
    if (life == false){
      if (livesMarioFirevasion > 0) {
        livesMarioFirevasion--;
        life = true;
        yMarioFirevasion = height/1.08;
      }
      if (livesMarioFirevasion == 0 ){
        stage = 12;
      }
    }
    // before level 1
    if (stage == 2) {
      background(0);
      textSize(100);
      fill(150,0,0);
      text("Mario Firevasion", 1600/3.8, 800/10); 
      textSize(50);
      fill(150,150,0);
      text("Press ENTER to continue", 1600/3.3, 800/1.074626865671642);
      textSize(150);
      text("Ready for level 1?", 1600/11, 800/2);
      if (keyCode == ENTER) {
        stage = 3;
      }
    }
    // before level 2
    if (stage == 5) {
      background(0);
      textSize(100);
      fill(150,0,0);
      text("Mario Firevasion", 1600/3.8, 800/10); 
      textSize(50);
      fill(150,150,0);
      text("Press ENTER to continue", 1600/3.3, 800/1.074626865671642);
      text("You passed!", width/2.4, height/5);
      textSize(150);
      text("Ready for level 2?", width/11, height/2);
      if (keyCode == ENTER) {
        stage = 6;
      }
    }
    // before level 3
    if (stage == 8) {
      background(0);
      textSize(100);
      fill(150,0,0);
      text("Mario Firevasion", width/3.8, height/10); 
      textSize(50);
      fill(150,150,0);
      text("Press ENTER to continue", width/3.3, height/1.074626865671642);
      text("You passed!", width/2.4, height/5);
      textSize(150);
      text("Ready for level 3?", width/11, height/2);
      if (keyCode == ENTER) {
        stage = 9;
      }
    }
  }
  /*
    Mario Arrow Game
  */
  else if(screenBackground == screenMiniGame3) {
    // remove GUI
    if(removeGameboardInterface) {
        removeGameboardUI();
        removeGameboardInterface = false;
    }
    // set text to center of position
    textAlign(CENTER);
    // only when the game is running
    if(runMarioArrow) {
      scenery();
      scoreMarioArrow();
      time();
      pressed();
      isAtEdge();
      movingRect();
      println("runMarioArrow");
    }
    // check if the game is stopped
    if( tijd == 0 && tellerMarioArrow > 20){
      if(marioArrowStay5Seconds) {
        // stay 5 seconds
        delay(5000);
        // change background
        image(gameboardBackground, 0, 0, width, height);
        // change state
        screenBackground = screenGameboard;
        // variables to the value when the game is stopped
        marioArrowStay5Seconds = false;
        removeGameboardInterface = true;
        onlyOnceAfterMarioArrow = true;
        makeGameOverScreenMarioArrow = false;
        runMarioArrow = true;
        myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) + 1, playerNumber);
        myGame.checkActionsAfterGame(playerNumber);
        // reset the game for the next time
        resetMarioArrow();
      }
      if(makeGameOverScreenMarioArrow) {
        scenery();
        background(44, 62, 80);
        textAlign(CENTER);    // after this, set it back to left!!!
        fill(255, 255, 255);
        textSize(130);
        text("You won!",  50, 50 - 85);
        textSize(65);
        text("with a score of" , 50, 50);
        textSize(130);
        text(tellerMarioArrow,  50, 50 + 150);
        translate(0,0);
        marioArrowStay5Seconds = true;
        // add score to player
        myGame.addScore(playerNumber, tellerMarioArrow);
        // game is stopped
        runMarioArrow = false;
      }
      makeGameOverScreenMarioArrow = true;
    } else if(tijd == 0 && tellerMarioArrow < 20){        //verlies
      // stay for 5 seconds
      if(marioArrowStay5Seconds) {
        // stay 5 seconds
        delay(5000);
        // change background
        image(gameboardBackground, 0, 0, width, height);
        // change state
        screenBackground = screenGameboard;
        // variables to the value when the game is stopped
        marioArrowStay5Seconds = false;
        removeGameboardInterface = true;
        onlyOnceAfterMarioArrow = true;
        makeGameOverScreenMarioArrow = false;
        runMarioArrow = true;
        // reset the game for the next time
        resetMarioArrow();
      }
      if(makeGameOverScreenMarioArrow) {
        background(44, 62, 80);
        //textAlign(CENTER);    // after this, set it back to left!!!
        fill(255, 255, 255);
        textSize(130);
        text("You lost!" , 50, 50);
        noFill();
        marioArrowStay5Seconds = true;
        // add score to player
        myGame.addScore(playerNumber, tellerMarioArrow);
        // game is stopped
        runMarioArrow =false;
      }
      makeGameOverScreenMarioArrow = true;
    }
  } 
  /*
    mario apples
  */
  else if(screenBackground == screenMiniGame4) {
    // remove GUI
    if(removeGameboardInterface) {
        removeGameboardUI();
        removeGameboardInterface = false;
    }
    background(bg);
    image(marioMarioApples, mouseX-25, 660, 50, 100);
    image(mand, mouseX-40, 650, 80, 80);    //mand op muis tekenen
    textAlign(LEFT);
    textSize(30);                                  //score op scherm zetten
    fill(255, 0, 0);
    text("Score:"+scoreMarioApples, 30, 30);
    for (int i=0; i<blokjes; i++) {                    //appels laten vallen
      xMarioApples[i]=xMarioApples[i]+3;
      fill(0);
      image(appel, yMarioApples[i], xMarioApples[i], 40, 40);                  //appels plaatsen
      if (xMarioApples[i] > height-120 && xMarioApples[i]<height-100) {    //vangen in mandje
        if ( abs(yMarioApples[i]-mouseX) <= 50) {
          scoreMarioApples++;
          xMarioApples[i]=1000;
        }
      }
    }
      for (int i=0; i<bommen; i++) {                    //bommen laten vallen
      bx[i]=bx[i]+3;
      fill(0);
      image(bom, by[i], bx[i], 40, 40);                  //bommen plaatsen
      if (bx[i] > height-100 && bx[i]<height-60) {    //vangen in mandje
        if ( abs(by[i]-mouseX) <= 50) {
          if(scoreMarioApples>=1)
          scoreMarioApples--;
          
          bx[i]=1000;
        }
      }
    }
    if(min(xMarioApples)>=800){                              //spel resetten na einde
      /* for (int i=0; i<blokjes; i++) {               //gewonnen als score0>6
        yMarioApples[i] = random(50, 1750);
        xMarioApples[i] = int(-100*random(1, 10));
      }
      for (int i=0; i<bommen; i++) {              
        by[i] = random(50, 1750);
        bx[i] = -100*random(1, 10);
      } */      
      if(marioApplesStay5Seconds) {
        // stay for 5 seconds
        delay(5000);
        // change background 
        image(gameboardBackground, 0, 0);
        // change state
        screenBackground = screenGameboard;
        // variables to the value when the game is stopped
        marioApplesStay5Seconds = false;
        removeGameboardInterface = true;
        onlyOnceAfterMarioApples = true;
        makeGameOverScreenMarioApples = false;
        if(scoreMarioApples>5) {
          // do nothing
        } else {
          myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) - 1, playerNumber);
        }
        myGame.checkActionsAfterGame(playerNumber);
        scoreMarioApples = 0;
        for (int i=0; i<blokjes; i++) {               //beginposities van appels declareren
          yMarioApples[i] = random(50, 1750);
          xMarioApples[i] = int(-100*random(1, 10));
        }
        for (int i=0; i<bommen; i++) {               //beginposities van bommen declareren
          by[i] = random(50, 1750);
          bx[i] = -100*random(1, 10);
        }
      }
      if(makeGameOverScreenMarioApples) {
        // screen if the minigame ends
        gameOverScreenMarioApples();
        marioApplesStay5Seconds = true;
        // add score to player
        myGame.addScore(playerNumber, scoreMarioApples*2); // maybe add more points
      }
      makeGameOverScreenMarioApples = true;
    }
    // TODO: ADD CODE FOR MINI GAME. IF THE GAME ENDS, SET THE VAR screenBackground BACK TO THE GAMEBOARD VALUE!!!
  } 
  /*
    Mario Mol Game
  */  
  else if(screenBackground == screenMiniGame5) {
    //background(gras); 
    if(removeGameboardInterface) {
        removeGameboardUI();
        removeGameboardInterface = false;
        marioMolIsRunning = true;
    }
    image(gras, 0, 0, 1600, 1600);
    for (int i=0; i<6; i++) {
      image(molsgat, xMarioMol[i]-40, yMarioMol[i], 80, 50);
  
      if (aan[i]==true) {
        image(mol, xMarioMol[i]-40, yMarioMol[i]-60, 80, 120);
      }
  
      if (aan[i]==true)
        tijdMarioMol[i]++;
  
      if ( tijdMarioMol[i]==100) {                          //weggaaan mol na tijdMarioMol
        aan[i]=false;
        randomMarioMol[i]=random(0, 400);
        tijdMarioMol[i]=0;
        prog++;
      }
  
      if (tijdMarioMol[i]<=70 && tijdMarioMol[i]>=50)            //uitroepteken als mol bijna weg
        image(uitroep, xMarioMol[i]+20, yMarioMol[i]-80, 20, 60);
    }
    textAlign(LEFT);
    textSize(30);                             //score op scherm zetten
    fill(255, 0, 0);
    text("score:"+scoreMarioMol, 10, 30);
  
    image(hamer, mouseX-25, mouseY-25, 50, 80);   //hammer tekenen
  
    for (int i=0; i<6; i++) {                      //mol verschijnt op random moment
      if ( randomMarioMol[i]>=500) {
        aan[i]=true;
      } else randomMarioMol[i]++;
    }
    if (prog>=10) {
      if(marioMolStay5Seconds) {
        // stay for 5 seconds
        delay(5000);
        // change background 
        image(gameboardBackground, 0, 0);
        // change state
        screenBackground = screenGameboard;
        // variables to the value when the game is stopped
        marioMolIsRunning = false;
        marioMolStay5Seconds = false;
        removeGameboardInterface = true;
        onlyOnceAfterMarioMol = true;
        makeGameOverScreenMarioMol = false;
        println("einde spel");           //gewonnen als score>7
        if(scoreMarioMol>7) {
          myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) + 1, playerNumber);
        } else {
          // do nothing
        }
        myGame.checkActionsAfterGame(playerNumber);
        scoreMarioMol=0;
        mollen=5;
        prog=0;
        for (int i=0; i<6; i++) {
          randomMarioMol[i] = random(0, 400);
        }
      }
      if(makeGameOverScreenMarioMol) {
        // screen if the minigame ends
        gameOverScreenMarioMol();
        marioMolStay5Seconds = true;
        // add score to player
        myGame.addScore(playerNumber, scoreMarioMol*2); // maybe add more points
      }
      makeGameOverScreenMarioMol = true;
    }
    // TODO: ADD CODE FOR MINI GAME. IF THE GAME ENDS, SET THE VAR screenBackground BACK TO THE GAMEBOARD VALUE!!!
  } else if(screenBackground == screenMiniGame6) {
    // TODO: ADD CODE FOR MINI GAME. IF THE GAME ENDS, SET THE VAR screenBackground BACK TO THE GAMEBOARD VALUE!!!
  } else if(screenBackground == screenGuide) {
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

/*
  Method to show the gamebord ui after it was removed 
*/
public void showGameboardUI() {
  // add new elements to UI according to how many players there are
  if(numberOfPlayers >= 2) {
    lblSpeler1 = new GLabel(this, 1110, 240, 160, 20);
    lblSpeler1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblSpeler1.setText(playerNames[0] + " (rood)");
    lblSpeler1.setOpaque(false);
    lblSpeler2 = new GLabel(this, 1110, 280, 160, 20);
    lblSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblSpeler2.setText(playerNames[1]  + " (groen)");
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
    lblSpeler3.setText(playerNames[2]  + " (blauw)");
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
    lblSpeler4.setText(playerNames[3]  + " (geel)");
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
  lblAantalOgen.setFont(new Font("Monospaced", Font.PLAIN, 25));
  btnVolgendeZet = new GButton(this, 1210, 630, 80, 30);
  btnVolgendeZet.setText("Volgende zet");
  btnVolgendeZet.addEventHandler(this, "button1_click3");
}

/*
  Remove the gameboard UI
*/

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

/*
  Remove the gamebord UI at hte end of the game
*/
public void removeGameboardUIEndOfGame() {
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
  //btnVolgendeZet.dispose();
  //btnVolgendeZet = null;
}

/*
  Method to add a gameboard UI after it was removed
*/
public void customGameBoardUI() {
  // add new elements to UI according to how many players there are
  if(numberOfPlayers >= 2) {
    lblSpeler1 = new GLabel(this, 1110, 240, 160, 20);
    lblSpeler1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblSpeler1.setText(playerNames[0]  + " (rood)");
    lblSpeler1.setOpaque(false);
    lblSpeler2 = new GLabel(this, 1110, 280, 160, 20);
    lblSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
    lblSpeler2.setText(playerNames[1]  + " (groen)");
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
    lblSpeler3.setText(playerNames[2]  + " (blauw)");
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
    lblSpeler4.setText(playerNames[3]  + " (geel)");
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
  lblAantalOgen.setFont(new Font("Monospaced", Font.PLAIN, 25));
  btnVolgendeZet = new GButton(this, 1210, 630, 80, 30);
  btnVolgendeZet.setText("Volgende zet");
  btnVolgendeZet.addEventHandler(this, "button1_click3");
}

// method to open a link
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

// method to open a link
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
    gameScreen = 1;
  }
  //als de regels open zijn, klik je ergens en gaat het beginscherm opnieuw open
  else if (gameScreen==3)
  {       
    gameScreen=0;
  }
  if(marioMolIsRunning) {
    for (int i=0; i<6; i++) {
      if (aan[i] == true) {                             //is er een mol?
        if (mouseX<xMarioMol[i]+20 && mouseX>xMarioMol[i]-20 &&        // muis op mol?   
          mouseY<yMarioMol[i]+50 && mouseY>yMarioMol[i]-50) {
          aan[i]=false;
          tijdMarioMol[i]=0;
          randomMarioMol[i]=random(0, 400);   
          scoreMarioMol++;
          prog++;
        }
      }
    }
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
void restartFlappyMario() {
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
  //text("Click to Restart", width/2, height-30);
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
    myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) - 1, playerNumber);
  }
  else if (6 <= scoreFlappyMario && scoreFlappyMario <= 10)
  {
    //Blijf staan
  }
  else if (11 <= scoreFlappyMario && scoreFlappyMario <= 15)
  {
    myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) + 1, playerNumber);
  }
  else
  {
    myGame.changePlaceOnBoard(myGame.getPlaceOnBoard(playerNumber) + 2, playerNumber);
  }
}

/* 
  Methods game mario firevision
*/
void keyPressedMarioFirevasion() {                                                                                   // Verplaatsen met pijltjestoesten, alleen in y-richting
  if (keyPressed == true) {
    if (keyCode == UP) {
      yMarioFirevasion = yMarioFirevasion - speedMarioFirevasion;
    }
    else {
      if (keyCode == DOWN) {
        yMarioFirevasion = yMarioFirevasion + speedMarioFirevasion;
      }
    }
  } 
}

void drawEnemy() {
  for (float b = (height/7.2); b < (height/1.348314606741573); b = b+(height/7.2) ) {
    if (b < (height/1.348314606741573)) {
    image(img2, leftPosition, b, width/30, height/21.6);
    }
  }
}
 
void drawProjectile1() {                                                                              //Lasers voor level 1
  int seconds = (millis() - startingTime)/1000;
  for (n = 1; n<1000; n++) {
    //Positie van lasers en intervallen 1
    if ( seconds == (interval3*n) ) {
      image(img1, leftPosition+(width/30), ylaser1, (width/2.212389380530973), height/36);
    }
    if ( seconds == 2+(interval2*n) ) {
      image(img1, leftPosition+(width/30), ylaser2, (width/2.212389380530973), height/36);
    }
    if ( seconds == 1+(interval4*n) ) {
      image(img1, leftPosition+(width/30), ylaser3, (width/2.212389380530973), height/36);
    }
    if ( seconds == 0+(interval5*n) ) {
      image(img1, leftPosition+(width/30), ylaser4, (width/2.212389380530973), height/36);
    }
    if ( seconds == -1+(interval2*n) ) {
      image(img1, leftPosition+(width/30), ylaser5, (width/2.212389380530973), height/36);
    }
  }
}
 
void drawProjectile2() {                                                                             // lasers voor level 2
  int seconds = (millis() - startingTime)/1000;
  for (n = 1; n<1000; n++)
  {                                                                                                   //Positie van lasers en intervallen 2
    if ( seconds == (interval3*n) ) {
      image(img1, leftPosition+(width/30), ylaser1, (width/2.212389380530973), height/36);
    }
    if ( seconds == 0+(interval2*n) ) {
      image(img1, leftPosition+(width/30), ylaser2, (width/2.212389380530973), height/36);
    }
    if ( seconds == 2+(interval3*n) ) {
      image(img1, leftPosition+(width/30), ylaser3, (width/2.212389380530973), height/36);
    }
    if ( seconds == 2+(interval4*n) ) {
      image(img1, leftPosition+(width/30), ylaser4, (width/2.212389380530973), height/36);
    }
    if ( seconds == 3+(interval5*n) ) {
      image(img1, leftPosition+(width/30), ylaser5, (width/2.212389380530973), height/36);
    }
  }
}
 
void drawProjectile3() {                                                                             
  //Lasers voor level 3
  int seconds = (millis() - startingTime)/1000;
  for (n = 1; n<1000; n++) { 
    //Positie van lasers en intervallen 3
    if ( seconds == (interval3*n) ) {
      image(img1, leftPosition+(width/30), ylaser1, (width/2.212389380530973), height/36);
    }
    if ( seconds == 0+(interval5*n) ) {
      image(img1, leftPosition+(width/30), ylaser2, (width/2.212389380530973), height/36);
    }
    if ( seconds == 3+(interval5*n) ) {
      image(img1, leftPosition+(width/30), ylaser3, (width/2.212389380530973), height/36);
    }
    if ( seconds == 2+(interval2*n) ) {
      image(img1, leftPosition+(width/30), ylaser4, (width/2.212389380530973), height/36);
    }
    if ( seconds == 1+(interval3*n) ) {
      image(img1, leftPosition+(width/30), ylaser5, (width/2.212389380530973), height/36);
    }
  }
}
 
 
void drawHero() {     
  //Tekent Hero, de ster
  int seconds = (millis() - startingTime)/1000;                                                    
  //Tijd onthouden
  image(img5, xMarioFirevasion, yMarioFirevasion, width/27, height/24 );
  for (n = 1; n<1000; n++) {
    if (stage == 3){                                                                               //Het doodgaan in LEVEL1 met bijhorende intervallen gebruikt in Projectile1
      if ( yMarioFirevasion < ylaser1+(height/36) && yMarioFirevasion > ylaser1-(height/24) && seconds == (interval3*n)){
        life = false;
      }
      if ( yMarioFirevasion < ylaser2+(height/36) && yMarioFirevasion > ylaser2-(height/24) && seconds == 2+(interval2*n)){
        life = false;
      }
      if ( yMarioFirevasion < ylaser3+(height/36) && yMarioFirevasion > ylaser3-(height/24) && seconds == 1+(interval4*n)){
        life = false;
      }   
      if ( yMarioFirevasion < ylaser4+(height/36) && yMarioFirevasion > ylaser4-(height/24) && seconds == 0+(interval5*n)){
        life = false;
      }
      if ( yMarioFirevasion < ylaser5+(height/36) && yMarioFirevasion > ylaser5-(height/24) && seconds == -1+(interval2*n)){
        life = false;
      }
    }
    if (stage == 6){                                                                                    //Het doodgaan in LEVEL2 met bijhorende intervallen gebruikt in Projectile2
      if ( yMarioFirevasion < ylaser1+(height/36) && yMarioFirevasion > ylaser1-(height/24) && seconds == (interval3*n)){
        life = false;
      }
      if ( yMarioFirevasion < ylaser2+(height/36) && yMarioFirevasion > ylaser2-(height/24) && seconds == (interval2*n)){
        life = false;
      } 
      if ( yMarioFirevasion < ylaser3+(height/36) && yMarioFirevasion > ylaser3-(height/24) && seconds == 2+(interval3*n)){
        life = false;
      }
      if ( yMarioFirevasion < ylaser4+(height/36) && yMarioFirevasion > ylaser4-(height/24) && seconds == 2+(interval4*n)){
        life = false;
      }
      if ( yMarioFirevasion < ylaser5+(height/36) && yMarioFirevasion > ylaser5-(height/24) && seconds == 3+(interval5*n)){
      life = false;
      }
    }  
    if (stage == 9){                                                                                    //Het doodgaan in LEVEL3 met bijhorende intervallen gebruikt in Projectile3
      if ( yMarioFirevasion < ylaser1+(height/36) && yMarioFirevasion > ylaser1-(height/24) && seconds == (interval3*n)){
        life = false;
      }
      if ( yMarioFirevasion < ylaser2+(height/36) && yMarioFirevasion > ylaser2-(height/24) && seconds == (interval5*n)){
        life = false;
      }
      if ( yMarioFirevasion < ylaser3+(height/36) && yMarioFirevasion > ylaser3-(height/24) && seconds == 3+(interval5*n)){
        life = false;
      }
      if ( yMarioFirevasion < ylaser4+(height/36) && yMarioFirevasion > ylaser4-(height/24) && seconds == 2+(interval2*n)){
        life = false;
      }
      if ( yMarioFirevasion < ylaser5+(height/36) && yMarioFirevasion > ylaser5-(height/24) && seconds == 1+(interval3*n)){
        life = false;
      }
    }
  }  
}
 
void finish() {                                                                              
  if (yMarioFirevasion < (height/11)) {                                                                                         //Finishline!
    if (stage == 3) {                                                                                    //Overgaan van LEVEL1 naar LEVEL2
      yMarioFirevasion = height/1.08;                                                                                          //Terug naar beginpositie gaan en dan pas stage veranderen
      stage = 5;
    }
    else if (stage == 6) {                                                                               //Overgaan van LEVEL2 naar LEVEL3
      yMarioFirevasion = height/1.08;                                                                                          //Terug naar beginpositie gaan en dan pas stage veranderen
      stage = 8; 
    }
    else if (stage == 9) {                                                                               //Overgaan van LEVEL3 naar eindscherm
      stage = 11;
    }
  }
}

void resetMarioFirevasion() {
  //Hero
  xMarioFirevasion = 760;    
  yMarioFirevasion = 700;   
  speedMarioFirevasion = 12;  //snelheid van beweging
  //Vijanden
  leftPosition = 410;   
  ylaser1 = (111.111)+5;
  ylaser2 = (222.222)+5;
  ylaser3 = (333.333)+5;
  ylaser4 = (444.444)+5;
  ylaser5 = (555.555)+5;
  //Begin-"stage"
  stage = 1;
  interval1 = 1;
  interval2 = 2;
  interval3 = 3;
  interval4 = 4;
  interval5 = 5;
  livesMarioFirevasion = 3;
  //Vraag: Is Hero dood of levend?
  life = true; 
}

/*
  methods mario arrow
*/
void scenery(){
  image(Spel_Background, 0, 0, width, height );
  stroke(255, 0, 0);
  strokeWeight(10);
  fill(fill);
  rect(midX + width/4 - 2*dim , midY + height/4 - 3*dim, width/2, height/2, 7);
  noStroke();
  noFill();
  fill(255);
  rect(width/2 -20,height/2 - dim,LL,LW);
  rect(width/2 +20,height/2 - dim,LL,LW);
  noFill();
}

void pressedOk(){
  x = midX + width/4 - 2*dim;
  speedMarioArrow = random(12, 30);
  UDRL=int(random(0, 4));
} 

void isAtEdge(){
  if(x > midX + width/4 -3*dim + width/2){
    geluid(3);
    x = midX + width/4 - dim;
    speedMarioArrow = random(12, 30);
    UDRL= int(random(0, 4));
    tellerMarioArrow--;
  }
} 

  
void pressed(){
  switch(UDRL){
    case 0:
      colloooor = geel;
      image( imgUP, (width/2) -imgUP.width/12, midY + 400, imgUP.width/6, imgUP.height/6);
        if (keyPressed == true ){
          if (keyCode == UP && x >= width/2 -20 && x<= width/2 +20){
            tellerMarioArrow++;
            twolinesFill();
            geluid(1);
            pressedOk();     
          }
          if (keyCode != UP && x >= width/2 -20 && x<= width/2 +20){
            tellerMarioArrow--;
            twolinesFill();
            geluid(2);
            pressedOk();
          }
        }
    break;
    case 1:
      colloooor = lichtBlauw;
      image( imgDown, (width/2) -imgDown.width/12, midY + 400, imgDown.width/6, imgDown.height/6);
          if (keyPressed == true ){
            if (keyCode == DOWN && x >= width/2 -20 && x<= width/2 +20){
              tellerMarioArrow++;
              twolinesFill();
              geluid(1);
              pressedOk();
            } 
            if (keyCode != DOWN && x >= width/2 -20 && x<= width/2 +20){
            tellerMarioArrow--;
            twolinesFill();
            geluid(2);
            pressedOk();
          }
          }
    break;
    case 2:
      colloooor = donkerGroen;
      image( imgRight, (width/2) -imgRight.width/12, midY + 400, imgRight.width/6, imgRight.height/6);
         if (keyPressed == true ){
           if (keyCode == RIGHT && x >= width/2 -20 && x<= width/2 +20){
             tellerMarioArrow++;
             twolinesFill();
             geluid(1);
             pressedOk();
           }
           if (keyCode != RIGHT && x >= width/2 -20 && x<= width/2 +20){
            tellerMarioArrow--;
            twolinesFill();
            geluid(2);
            pressedOk();
          }
         }
    break;
    case 3:
      colloooor = rood;
      image( imgLeft, (width/2) -imgLeft.width/12, midY + 400, imgLeft.width/6, imgLeft.height/6);
        if (keyPressed == true ){
          if (keyCode == LEFT && x >= width/2 -20 && x<= width/2 +20){
            tellerMarioArrow++;
            twolinesFill();
            geluid(1);
            pressedOk();
          }
          if (keyCode != LEFT && x >= width/2 -20 && x<= width/2 +20){
            tellerMarioArrow--;
            twolinesFill();
            geluid(2);
            pressedOk();
          }
        }
    break;
  }
}

void movingRect(){
  x = x + speedMarioArrow;
  translate(x, height/2);
  fill(colloooor);
  rect(-dim/2, -dim/2, dim, dim); 
  noFill();
}

void scoreMarioArrow(){
  textSize(65);
  fill(255);
  text(tellerMarioArrow, width/2, midY + height/4 + 3*dim);
  noFill();
}
void time(){
  textSize(50);
  tijd = ( 60 -(millis()- time)/1000);
  if(tijd <0){
    tijd =0;
  }
  text( "tijd: " + tijd, 5*dim,3*dim-20);
}

void twolinesFill(){ 
  fill(colloooor);
  rect(width/2 -20,height/2 - dim,LL,LW);
  rect(width/2 +20,height/2 - dim,LL,LW); 
  noFill();
}

void geluid(int geluid){
  if(geluid == 1){
   file1 = new SoundFile(this, "marioCoin.mp3");
   file1.play();
   }  
  if(geluid == 2){
   file2 = new SoundFile(this, "fail.wav");
   file2.play();
   } 
  if(geluid == 3){
   file3 = new SoundFile(this, "edge.wav");
   file3.play();
   }
}

public void resetMarioArrow() {
  rectWidth = 5*dim;
  rectHeight = 2*dim;
  x = midX + width/4 - 2*dim;
  fill = transparant;
  imgUP = loadImage("pijl_omhoog.jpg");
  imgDown = loadImage("pijl_Onder.jpg");
  imgLeft = loadImage("pijl_links.jpg");
  imgRight = loadImage("pijl_Rechts.jpg");
  imgGameOver = loadImage("Gameover.jpg");
  imgGameWin = loadImage("Mariovlag.jpg");
  Spel_Background = loadImage("Spel_Background.png");
  speedMarioArrow= 12;
  dim = 22;
  LL = 2;
  LW = 40;
  UDRL = 0;
  tellerMarioArrow = 0;
}

void gameOverScreenMarioApples() {
  background(44, 62, 80);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(12);
  text("Your Score", width/2, height/2 - 120);
  textSize(130);
  text(scoreMarioApples, width/2, height/2);
  textSize(15);
}

void gameOverScreenMarioMol() {
  background(44, 62, 80);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(12);
  text("Your Score", width/2, height/2 - 120);
  textSize(130);
  text(scoreMarioMol, width/2, height/2);
  textSize(15);
}