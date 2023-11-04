class Figure extends Movable {
  Hitbox hitbox;
  Figure(PVector leftTopCorner, 
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
  void updateHitbox() {
    hitbox.leftTopCorner = leftTopCorner;
    hitbox.size = size;
    hitbox.rightBottomCorner = rightBottomCorner;
  }
  void display(PVector offset) {
    fill(currentColor);
    stroke(0);
    //noStroke();
    rect(offset.x+leftTopCorner.x, offset.y+leftTopCorner.y, size.x, size.y);
  }
  boolean checkCollisionWithBottom(Hitbox other) {
    return (hitbox.rightBottomCorner.y >= other.leftTopCorner.y &&
      hitbox.leftTopCorner.y <= other.leftTopCorner.y &&
      hitbox.rightBottomCorner.x >= other.leftTopCorner.x &&
      hitbox.leftTopCorner.x <= other.rightBottomCorner.x);
  }
  boolean checkCollisionWithTop( Hitbox other) {
    return (hitbox.leftTopCorner.y <= other.rightBottomCorner.y && 
      hitbox.rightBottomCorner.y >= other.rightBottomCorner.y &&
      hitbox.rightBottomCorner.x >= other.leftTopCorner.x &&
      hitbox.leftTopCorner.x <= other.rightBottomCorner.x); 
  }
  boolean checkCollisionWithRight(Hitbox other) {
    return (hitbox.rightBottomCorner.x >= other.leftTopCorner.x &&
      hitbox.leftTopCorner.x <= other.leftTopCorner.x &&
      hitbox.rightBottomCorner.y >= other.leftTopCorner.y &&
      hitbox.leftTopCorner.y <= other.rightBottomCorner.y);

  }
  boolean checkCollisionWithLeft( Hitbox other) {
    return (hitbox.leftTopCorner.x <= other.rightBottomCorner.x &&
      hitbox.rightBottomCorner.x >= other.rightBottomCorner.x &&
      hitbox.rightBottomCorner.y >= other.leftTopCorner.y &&
      hitbox.leftTopCorner.y <= other.rightBottomCorner.y);
  }
};
