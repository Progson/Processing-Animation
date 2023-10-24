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
  public void display() {
    fill(fillment);
    rect(pos.x, pos.y, size.x, size.y);
  }
  private void move(){
     pos.add(velocity);
  }
  private void addForces(){
    velocity.add(gravity);  
  }
  public void update() {
    addForces();
    move();
  }
}
