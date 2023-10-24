class Figure {

  PVector velocity = new PVector(2, 2);
  PVector size = new PVector(10, 10);
  PVector gravity = new PVector(0, 0);
  PVector pos = new PVector(0, 0);
  color fillment = color(0);

  Figure(  PVector velocity, 
    PVector size, 
    PVector gravity, 
    PVector pos, 
    color fillment) {
    this.velocity = velocity;
    this.size = size;
    this.gravity = gravity;
    this.pos = pos;
    this.fillment = fillment;
  }
  public void display(){
    if(!checkIfOut()){
    play = false;
    return;
    }
    fill(fillment);
    rect(pos.x, pos.y, size.x, size.y);
  }
  private void move() {
    pos.add(velocity);
  }
  private void addForces() {
    velocity.add(gravity);
  }
  public void update() {
    addForces();
    move();
  }
  private boolean checkIfOut() {
    if (jeden.pos.x+jeden.size.x+jeden.velocity.x > canvasTopLeft.x+canvasSize.x) return false;
    if (jeden.pos.x+jeden.velocity.x < canvasTopLeft.x)return false;
    if (jeden.pos.y+jeden.size.y+jeden.velocity.y > canvasTopLeft.y+canvasSize.y) return false;
    if (jeden.pos.y+jeden.velocity.y < canvasTopLeft.y)return false;

    return true;
  }
}
