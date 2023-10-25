class Figure {
  PVector initialVelocity;
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
    initialVelocity = velocity;
  }
  public void display() {
    fill(fillment);
    rect(pos.x, pos.y, size.x, size.y);
  }
  private void addForces() {
    velocity.add(gravity);
  }
  public void update() {
    addForces();
    PVector dir = new PVector(1, 1);
    if (isPositive(velocity.x)) {
      dir.x=1;
    } else {
      dir.x=-1;
    }
    if (isPositive(velocity.y)) {
      dir.y=1;
    } else {
      dir.y=-1;
    }

    for (int i = 0; i*initialVelocity.x +i*initialVelocity.y < abs(velocity.x)+abs(velocity.y); i++) {
      display();
      //if (checkIfOut()) play = false;
      PVector temp = new PVector(dir.x*initialVelocity.x,dir.y*initialVelocity.y);
      pos.add(temp);
    }
  }

  private boolean checkIfOut() {
    if (this.pos.x+this.size.x > canvasTopLeft.x+canvasSize.x) return true;
    if (this.pos.x < canvasTopLeft.x)return true;
    if (this.pos.y+this.size.y > canvasTopLeft.y+canvasSize.y) return true;
    if (this.pos.y < canvasTopLeft.y)return true;
    return false;
  }
};

boolean isPositive(float number) {
  return number >= 0;
}
