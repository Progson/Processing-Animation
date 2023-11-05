class Displayable {
  PVector leftTopCorner, rightBottomCorner, size;
  color currentColor, color1, color2;
  float colorChange = 0.01;
  float colorIncrementation = 0.1;
  Displayable(PVector size) {
    this.size = size;
    leftTopCorner = new PVector(0, 0);
    calculateRightBottomCorner();
    color1 = color(#FFFFFF);
    color2 = color(#030303);
    currentColor = color1;
  }
  Displayable(PVector LeftTopCorner, PVector size) {
    this.size = size;
    this.leftTopCorner = LeftTopCorner;
    calculateRightBottomCorner();
  }
  void display(PVector offset) {
    fill(currentColor);
    noStroke();
    rect(offset.x+leftTopCorner.x, offset.y+leftTopCorner.y, size.x, size.y);
  }
   void display() {
    display(new PVector(0,0));
  }
  void calculateRightBottomCorner() {
    rightBottomCorner = PVector.add(leftTopCorner, size);
  }
  void changeColor() {
    if (colorChange > 1) {
      colorIncrementation = -abs(colorIncrementation) ;
    }
    if (colorChange < 0) {
      colorIncrementation = abs(colorIncrementation) ;
    }
    colorChange += colorIncrementation;
    currentColor = lerpColor(color(color1), color(color2), colorChange);
  }
};
