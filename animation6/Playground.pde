class Playground extends Displayable {
  Hitbox hitbox;
  Hitbox left;
  Hitbox right;
  Hitbox top;
  Hitbox bottom;
  float hitboxSize = 1000;
  Playground(PVector size) {
    super(new PVector(0,0),size);
    hitbox = new Hitbox(leftTopCorner,size); 
    left = new Hitbox(new PVector(leftTopCorner.x-hitboxSize,leftTopCorner.y-hitboxSize),new PVector(hitboxSize,size.y+2*hitboxSize));
    right = new Hitbox(new PVector(rightBottomCorner.x,leftTopCorner.y-hitboxSize),new PVector(hitboxSize,size.y+2*hitboxSize));
    top =  new Hitbox(new PVector(leftTopCorner.x-hitboxSize,leftTopCorner.y-hitboxSize),new PVector(size.x+2*hitboxSize,hitboxSize));
    bottom = new Hitbox(new PVector(leftTopCorner.x-hitboxSize,rightBottomCorner.y),new PVector(size.x+2*hitboxSize,hitboxSize));
  }  
}
