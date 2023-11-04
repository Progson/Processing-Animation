color backgroundColor = color(130);
String signature = "@progson2";
String title = "Make it more like painting";
PFont titleFont;
PVector titleLeftTopCorner;
PVector titleSize;
float titleTextSize;
void drawSurrounding() {
  if (frameCount == 1) { 
    titleFont = createFont("Calibri-Bold-48.vlw", 48);
    titleLeftTopCorner = new PVector(playgroundOffset.x/2, playgroundOffset.y/4);
    titleSize = new PVector(pg.rightBottomCorner.x+playgroundOffset.x, playgroundOffset.y);
    titleTextSize = calculateTextSize(title, titleFont, titleSize.x, titleSize.y);
  }
  drawBackground();
  drawTitle();
  drawSignature();
}
void drawBackground() {
  noStroke();
  fill(backgroundColor);
  rect(0, 0, width, playgroundOffset.y);
  rect(0, playgroundOffset.y+pg.rightBottomCorner.y, width, height-playgroundOffset.y+pg.rightBottomCorner.y);
  rect(0, 0, playgroundOffset.x, height);
  rect(playgroundOffset.x+pg.rightBottomCorner.x, 0, width-playgroundOffset.x+pg.rightBottomCorner.x, height);
}
void drawTitle() {
  textFont(titleFont);
  textSize(titleTextSize);
  fill(0);
  text(title, titleLeftTopCorner.x, titleLeftTopCorner.y, titleSize.x, titleSize.y);
}
void drawSignature() {
}
float calculateTextSize(String text, PFont font, float sizeX, float sizeY) {
  float fontSize = 50;
  textFont(font);
  textSize(fontSize);
  while (textWidth(text) > sizeX || textAscent() + textDescent() > sizeY) {
    fontSize -= 1;
    textSize(fontSize);
  }
  return fontSize;
}
