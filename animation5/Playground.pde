class Playground extends Displayable {
  Hitbox hitbox;
  Playground(PVector leftTopCorner, PVector size) {
    super(leftTopCorner,size);
    hitbox = new Hitbox(leftTopCorner,size);
  }  
}
