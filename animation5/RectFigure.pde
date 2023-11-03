class RectFigure extends Movable {
  Hitbox hitbox;
  RectFigure(PVector leftTopCorner, 
    PVector size, 
    float angle, float velocity, float velocityStep, 
    color color1, 
    color color2) {
    super(leftTopCorner, size, angle, velocity, velocityStep);
    this.color1 = color1;
    this.color2 = color2;
    currentColor = color1;
    hitbox = new Hitbox(leftTopCorner, size);
  }
  void updateHitbox(){
    hitbox.leftTopCorner = leftTopCorner;
    hitbox.size = size;
    hitbox.rightBottomCorner = rightBottomCorner;
  }
};
