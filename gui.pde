/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void dropList1_click1(GDropList source, GEvent event) { //_CODE_:dropList1:450554:
  println("dropList1 - GDropList >> GEvent." + event + " @ " + millis());
  println(dropList1.getSelectedText());
  if(Integer.parseInt(dropList1.getSelectedText())==2) {
    numberOfPlayers = 2;
    textfield3.setEnabled(false);
    textfield4.setEnabled(false);
    println("2 aangeduid in droplist");
  } else if(Integer.parseInt(dropList1.getSelectedText())==3) {
    numberOfPlayers = 3;
    textfield3.setEnabled(true);
    textfield4.setEnabled(false);
    println("3 aangeduid in droplist");
  } else if(Integer.parseInt(dropList1.getSelectedText())==4) {
    numberOfPlayers = 4;
    textfield3.setEnabled(true);
    textfield4.setEnabled(true);
    println("4 aangeduid in droplist");
  }
} //_CODE_:dropList1:450554:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:893372:
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield1:893372:

public void textfield2_change1(GTextField source, GEvent event) { //_CODE_:textfield2:840856:
  println("textfield2 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield2:840856:

public void textfield3_change1(GTextField source, GEvent event) { //_CODE_:textfield3:528466:
  println("textfield3 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield3:528466:

public void textfield4_change1(GTextField source, GEvent event) { //_CODE_:textfield4:235535:
  println("textfield4 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield4:235535:

public void btnStartspel_event(GButton source, GEvent event) { //_CODE_:btnStartSpel:589420:
  println("btnStartSpel - GButton >> GEvent." + event + " @ " + millis());
  // initialize variables
  playerNames = new String[numberOfPlayers]; // or with number of players but to not conflict with the gui just set 4
  for(int i = 0; i<numberOfPlayers;i++) {
    playerNames[i] = "player" + Integer.toString(i);
  }
  myGame = new Game();
  myGame.newGame(numberOfPlayers, playerNames);
  
  // set background
  image(gameboardBackground, 0, 0);
  
  // set player names in labels
  if(numberOfPlayers >= 2) {
    playerNames[0] = textfield1.getText();
    playerNames[1] = textfield2.getText();
  }
  if(numberOfPlayers >=3) {
    playerNames[2] = textfield3.getText();
  }
  if(numberOfPlayers == 4) {
    playerNames[3] = textfield4.getText();
  }
  clear();
  screenBackground = 1;
  
  // remove elements from UI
  lblAantalSpelers.dispose();
  dropList1.dispose();
  lblNaamSpeler1.dispose();
  textfield1.dispose();
  lblNaamSpeler2.dispose();
  textfield2.dispose();
  lblNaamSpeler3.dispose();
  textfield3.dispose();
  lblNaamSpeler4.dispose();
  textfield4.dispose();
  btnStartSpel.dispose();
  btnOpenHandleiding.dispose();
  btnOpenWebsite.dispose();
  lblAantalSpelers = null; 
  dropList1 = null;
  lblNaamSpeler1 = null;
  textfield1 = null;
  lblNaamSpeler2 = null;
  textfield2 = null;
  lblNaamSpeler3 = null;
  textfield3 = null;
  lblNaamSpeler4 = null;
  textfield4 = null;
  btnStartSpel = null;
  btnOpenHandleiding = null;
  btnOpenWebsite = null;
  
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
} //_CODE_:btnStartSpel:589420:

public void button1_click1(GButton source, GEvent event) { //_CODE_:btnOpenHandleiding:433001:
  println("btnOpenHandleiding - GButton >> GEvent." + event + " @ " + millis());
  /* 
    TODO: ADD MORE CODE WHEN THE GUIDE IS MADE
  */
  windowGuide = GWindow.getWindow(this, "Handleiding", 0, 0, 800, 600, JAVA2D);
  windowGuide.noLoop();
  windowGuide.addDrawHandler(this, "win_draw1");
  lblGuide = new GLabel(windowGuide, 360, 290, 80, 20);
  lblGuide.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblGuide.setText("Handleiding");
  lblGuide.setOpaque(false);
  windowGuide.loop();
} //_CODE_:btnOpenHandleiding:433001:

public void button2_click1(GButton source, GEvent event) { //_CODE_:btnOpenWebsite:814012:
  println("btnOpenWebsite - GButton >> GEvent." + event + " @ " + millis());
  openWebpage(urlWebsite);
} //_CODE_:btnOpenWebsite:814012:

public void imgButton1_click1(GImageButton source, GEvent event) { //_CODE_:imgButton1:684065:
  println("imgButton1 - GImageButton >> GEvent." + event + " @ " + millis());
} //_CODE_:imgButton1:684065:

public void button1_click2(GButton source, GEvent event) { //_CODE_:btnDobbelen:558669:
  println("btnDobbelen - GButton >> GEvent." + event + " @ " + millis());
  diceIsRolled = true;
  // sound of a rolling dice
  
  /*
    TODO: ADD THE SOUND OF A ROLLING DICE
  */
  
  //change state of buttons dobbelen and volgendeZet
  //btnDobbelen.dispose();
  //btnDobbelen = null;
  btnDobbelen.setEnabled(false);
  btnDobbelen.dispose();
  btnDobbelen = null;
  diceSound.play();
} //_CODE_:btnDobbelen:558669:

public void button2_click2(GButton source, GEvent event) { //_CODE_:btnHandleiding:372716:
  println("btnHandleiding - GButton >> GEvent." + event + " @ " + millis());
  /* 
    TODO: ADD MORE CODE WHEN THE GUIDE IS MADE
  */
  windowGuide = GWindow.getWindow(this, "Handleiding", 0, 0, 800, 600, JAVA2D);
  windowGuide.noLoop();
  windowGuide.addDrawHandler(this, "win_draw1");
  lblGuide = new GLabel(windowGuide, 360, 290, 80, 20);
  lblGuide.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblGuide.setText("Handleiding");
  lblGuide.setOpaque(false);
  windowGuide.loop();
} //_CODE_:btnHandleiding:372716:

public void button3_click1(GButton source, GEvent event) { //_CODE_:btnSluitSpel:582357:
  println("btnSluitSpel - GButton >> GEvent." + event + " @ " + millis());
  exit();
} //_CODE_:btnSluitSpel:582357:

public void button1_click3(GButton source, GEvent event) { //_CODE_:btnVolgendeZet:697498:
  println("btnVolgendeZet - GButton >> GEvent." + event + " @ " + millis());
  if(numberOfPlayers == 2) {
    if(playerNumber == 0) {
      lblSpelerBeurt.setText(playerNames[1]);
    } else if(playerNumber == 1) {
      lblSpelerBeurt.setText(playerNames[0]);
    }
  } else if(numberOfPlayers == 3) {
    if(playerNumber == 0) {
      lblSpelerBeurt.setText(playerNames[1]);
    } else if(playerNumber == 1) {
      lblSpelerBeurt.setText(playerNames[2]);
    } else if(playerNumber == 2) {
      lblSpelerBeurt.setText(playerNames[0]);
    }
  } else if(numberOfPlayers == 4) {
    if(playerNumber == 0) {
      lblSpelerBeurt.setText(playerNames[1]);
    } else if(playerNumber == 1) {
      lblSpelerBeurt.setText(playerNames[2]);
    } else if(playerNumber == 2) {
      lblSpelerBeurt.setText(playerNames[3]);
    } else if(playerNumber == 3) {
      lblSpelerBeurt.setText(playerNames[0]);
    }
  }
  lblAantalOgen.setText("");
  nextStep = true;
  btnDobbelen = new GButton(this, 1110, 630, 80, 30);
  btnDobbelen.setText("Dobbelen");
  btnDobbelen.addEventHandler(this, "button1_click2");
  btnDobbelen.setEnabled(true);
  btnVolgendeZet.setEnabled(false);
  btnVolgendeZet.dispose();
  btnVolgendeZet = null;
  
} //_CODE_:btnVolgendeZet:697498:

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:windowGuide:815082:
  appc.background(230);
} //_CODE_:windowGuide:815082:

public void button1_click4(GButton source, GEvent event) { //_CODE_:button1:835056:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button1:835056:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  lblAantalSpelers = new GLabel(this, 190, 160, 108, 20);
  lblAantalSpelers.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblAantalSpelers.setText("Aantal spelers:");
  lblAantalSpelers.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lblAantalSpelers.setOpaque(false);
  dropList1 = new GDropList(this, 300, 160, 90, 80, 3);
  dropList1.setItems(loadStrings("list_450554"), 0);
  dropList1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  dropList1.addEventHandler(this, "dropList1_click1");
  lblNaamSpeler1 = new GLabel(this, 190, 200, 110, 20);
  lblNaamSpeler1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblNaamSpeler1.setText("Naam speler 1:");
  lblNaamSpeler1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lblNaamSpeler1.setOpaque(false);
  textfield1 = new GTextField(this, 300, 200, 160, 30, G4P.SCROLLBARS_NONE);
  textfield1.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  lblNaamSpeler2 = new GLabel(this, 190, 240, 110, 20);
  lblNaamSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblNaamSpeler2.setText("Naam speler 2:");
  lblNaamSpeler2.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lblNaamSpeler2.setOpaque(false);
  textfield2 = new GTextField(this, 300, 240, 160, 30, G4P.SCROLLBARS_NONE);
  textfield2.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  textfield2.setOpaque(true);
  textfield2.addEventHandler(this, "textfield2_change1");
  lblNaamSpeler3 = new GLabel(this, 190, 280, 110, 20);
  lblNaamSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblNaamSpeler3.setText("Naam speler 3:");
  lblNaamSpeler3.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lblNaamSpeler3.setOpaque(false);
  textfield3 = new GTextField(this, 300, 280, 160, 30, G4P.SCROLLBARS_NONE);
  textfield3.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  textfield3.setOpaque(true);
  textfield3.addEventHandler(this, "textfield3_change1");
  lblNaamSpeler4 = new GLabel(this, 190, 320, 110, 20);
  lblNaamSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblNaamSpeler4.setText("Naam speler 4:");
  lblNaamSpeler4.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  lblNaamSpeler4.setOpaque(false);
  textfield4 = new GTextField(this, 300, 320, 160, 30, G4P.SCROLLBARS_NONE);
  textfield4.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  textfield4.setOpaque(true);
  textfield4.addEventHandler(this, "textfield4_change1");
  btnStartSpel = new GButton(this, 190, 370, 270, 30);
  btnStartSpel.setText("Start spel");
  btnStartSpel.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  btnStartSpel.addEventHandler(this, "btnStartspel_event");
  btnOpenHandleiding = new GButton(this, 190, 410, 130, 30);
  btnOpenHandleiding.setText("Handleiding");
  btnOpenHandleiding.setLocalColorScheme(GCScheme.RED_SCHEME);
  btnOpenHandleiding.addEventHandler(this, "button1_click1");
  btnOpenWebsite = new GButton(this, 330, 410, 130, 30);
  btnOpenWebsite.setText("Website");
  btnOpenWebsite.setLocalColorScheme(GCScheme.RED_SCHEME);
  btnOpenWebsite.addEventHandler(this, "button2_click1");
  imgButton1 = new GImageButton(this, 0, 0, 1600, 800, new String[] { "backgroundG4P.png", "backgroundG4P.png", "backgroundG4P.png" } );
  imgButton1.addEventHandler(this, "imgButton1_click1");
  lblSpeler1 = new GLabel(this, 1110, 240, 160, 20);
  lblSpeler1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblSpeler1.setText("Speler1");
  lblSpeler1.setOpaque(false);
  lblSpeler2 = new GLabel(this, 1110, 280, 160, 20);
  lblSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblSpeler2.setText("Speler 2");
  lblSpeler2.setOpaque(false);
  lblSpeler3 = new GLabel(this, 1110, 320, 160, 20);
  lblSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblSpeler3.setText("Speler 3");
  lblSpeler3.setOpaque(false);
  lblSpeler4 = new GLabel(this, 1110, 360, 160, 20);
  lblSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblSpeler4.setText("Speler 4");
  lblSpeler4.setOpaque(false);
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
  lblScoreSpeler3 = new GLabel(this, 1300, 320, 80, 20);
  lblScoreSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblScoreSpeler3.setText("0");
  lblScoreSpeler3.setOpaque(false);
  lblScoreSpeler4 = new GLabel(this, 1300, 360, 80, 20);
  lblScoreSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblScoreSpeler4.setText("0");
  lblScoreSpeler4.setOpaque(false);
  lblPlaats = new GLabel(this, 1410, 180, 80, 20);
  lblPlaats.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblPlaats.setText("Plaats");
  lblPlaats.setOpaque(false);
  lblPlaatsSpeler1 = new GLabel(this, 1410, 240, 80, 20);
  lblPlaatsSpeler1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblPlaatsSpeler1.setText("Start");
  lblPlaatsSpeler1.setTextBold();
  lblPlaatsSpeler1.setOpaque(false);
  lblPlaatsSpeler2 = new GLabel(this, 1410, 280, 80, 20);
  lblPlaatsSpeler2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblPlaatsSpeler2.setText("Start");
  lblPlaatsSpeler2.setOpaque(false);
  lblPlaatsSpeler3 = new GLabel(this, 1410, 320, 80, 20);
  lblPlaatsSpeler3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblPlaatsSpeler3.setText("Start");
  lblPlaatsSpeler3.setOpaque(false);
  lblPlaatsSpeler4 = new GLabel(this, 1410, 360, 80, 20);
  lblPlaatsSpeler4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblPlaatsSpeler4.setText("Start");
  lblPlaatsSpeler4.setOpaque(false);
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
  lblSpelerBeurt.setText("niemand");
  lblSpelerBeurt.setOpaque(false);
  lblGedobbeldeOgen = new GLabel(this, 1110, 470, 160, 20);
  lblGedobbeldeOgen.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblGedobbeldeOgen.setText("Gedobbelde ogen:");
  lblGedobbeldeOgen.setOpaque(false);
  lblAantalOgen = new GLabel(this, 1301, 470, 160, 20);
  lblAantalOgen.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblAantalOgen.setText("0");
  lblAantalOgen.setOpaque(false);
  lblAantalOgen.setFont(new Font("Monospaced", Font.PLAIN, 25));
  btnVolgendeZet = new GButton(this, 1210, 630, 80, 30);
  btnVolgendeZet.setText("Volgende zet");
  btnVolgendeZet.addEventHandler(this, "button1_click3");
  windowGuide = GWindow.getWindow(this, "Handleiding", 0, 0, 800, 600, JAVA2D);
  windowGuide.noLoop();
  windowGuide.addDrawHandler(this, "win_draw1");
  lblGuide = new GLabel(windowGuide, 358, 248, 80, 20);
  lblGuide.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lblGuide.setText("Handleiding");
  lblGuide.setOpaque(false);
  button1 = new GButton(windowGuide, 475, 400, 80, 30);
  button1.setText("Toets");
  button1.addEventHandler(this, "button1_click4");
  windowGuide.loop();
}

// Variable declarations 
// autogenerated do not edit
GLabel lblAantalSpelers; 
GDropList dropList1; 
GLabel lblNaamSpeler1; 
GTextField textfield1; 
GLabel lblNaamSpeler2; 
GTextField textfield2; 
GLabel lblNaamSpeler3; 
GTextField textfield3; 
GLabel lblNaamSpeler4; 
GTextField textfield4; 
GButton btnStartSpel; 
GButton btnOpenHandleiding; 
GButton btnOpenWebsite; 
GImageButton imgButton1; 
GLabel lblSpeler1; 
GLabel lblSpeler2; 
GLabel lblSpeler3; 
GLabel lblSpeler4; 
GLabel lblNamen; 
GLabel lblScore; 
GLabel lblScoreSpeler1; 
GLabel lblScoreSpeler2; 
GLabel lblScoreSpeler3; 
GLabel lblScoreSpeler4; 
GLabel lblPlaats; 
GLabel lblPlaatsSpeler1; 
GLabel lblPlaatsSpeler2; 
GLabel lblPlaatsSpeler3; 
GLabel lblPlaatsSpeler4; 
GButton btnDobbelen; 
GButton btnHandleiding; 
GButton btnSluitSpel; 
GLabel lblBeurtAan; 
GLabel lblSpelerBeurt; 
GLabel lblGedobbeldeOgen; 
GLabel lblAantalOgen; 
GButton btnVolgendeZet; 
GWindow windowGuide;
GLabel lblGuide; 
GButton button1; 