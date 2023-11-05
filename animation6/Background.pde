color backgroundColor = color(114,137,218);

String title = "10 OF THEM!";
PFont titleFont;
PVector titleLeftTopCorner;
PVector titleCenterPosition;
PVector titleSize;
float titleTextSize;
color titleColor = color(0);

String signature = "@progson2";
PFont signatureFont = titleFont;
PVector signatureLeftTopCorner;
PVector signatureCenterPosition;
PVector signatureSize;
float signatureTextSize;
color signatureColor = color(30,33,36);
void drawSurrounding() {
  if (frameCount == 1) { 
    titleFont = createFont("Calibri-Bold-48.vlw", 48);
    titleCenterPosition = new PVector(playgroundOffset.x+pg.size.x/2, 
      playgroundOffset.y/2);
    titleSize = new PVector(pg.rightBottomCorner.x+playgroundOffset.x, 
      playgroundOffset.y);
    titleTextSize = calculateTextSize(title, titleFont, 
      titleSize.x, titleSize.y);

    signatureFont = titleFont;
    signatureLeftTopCorner = new PVector(playgroundOffset.x, 
      playgroundOffset.y + pg.rightBottomCorner.y); 
    signatureCenterPosition = new PVector(playgroundOffset.x+pg.size.x/2, 
      playgroundOffset.y + pg.rightBottomCorner.y); 
    signatureSize = new PVector(pg.rightBottomCorner.x, 200); 
    //signatureTextSize = calculateTextSize(signature, signatureFont, 
     // signatureSize.x, signatureSize.y);
  }
  drawBackground();
  drawTitle();
  drawSignature();
}
void drawBackground() {
  noStroke();
  fill(backgroundColor);
  rect(0, 0, width, playgroundOffset.y);
  rect(0, playgroundOffset.y+pg.rightBottomCorner.y, 
    width, height-playgroundOffset.y+pg.rightBottomCorner.y);
  rect(0, 0, playgroundOffset.x, height);
  rect(playgroundOffset.x+pg.rightBottomCorner.x, 0, 
    width-playgroundOffset.x+pg.rightBottomCorner.x, height);
}
void drawTitle() {
  textFont(titleFont);
  textSize(70);
  fill(titleColor);
  textAlign(CENTER,BOTTOM);
  text(title, titleCenterPosition.x, playgroundOffset.y);
}
void drawSignature() {
  textFont(signatureFont);
  textSize(50);
  fill(signatureColor);
  textAlign(CENTER,TOP);
  text(signature, signatureCenterPosition.x, signatureCenterPosition.y);
}
float calculateTextSize(String text, PFont font, float sizeX, float sizeY) {
  float fontSize = 1;
  textFont(font);
  textSize(fontSize);
  while (textWidth(text) < sizeX && textAscent() + textDescent() < sizeY) {
    fontSize += 1;
    textSize(fontSize);
  }
  return fontSize;
}
