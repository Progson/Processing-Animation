class Figure {
  PVector velocityStep;
  PVector velocity = new PVector(2, 2);
  PVector size = new PVector(10, 10);
  PVector gravity = new PVector(0, 0);
  PVector pos = new PVector(0, 0);
  color color1;
  color color2;
  color currentColor;
  private float colorChange = 0.1;
  private float incrementation =0.05;

  Figure(  PVector velocity, 
    PVector size, 
    PVector gravity, 
    PVector pos, 
    color color1,
    color color2) {
    this.velocity = velocity;
    this.size = size;
    this.gravity = gravity;
    this.pos = pos;
    this.color1 = color1;
    this.color2 = color2;
    currentColor = color1;
    velocityStep = new PVector(abs(velocity.x), abs(velocity.y));
  }
  public void display() {
    fill(currentColor);
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
    int numberOfSteps = int(abs(velocity.x)/velocityStep.x);
    for (int i = 1; i <= numberOfSteps; i++) {
      //if (checkIfOut()) return;
      display();
      PVector temp = new PVector(dir.x*velocityStep.x, dir.y*velocityStep.y);
      pos.add(temp);
    }
    PVector residual = new PVector(dir.x*(abs(velocity.x)-velocityStep.x*numberOfSteps), dir.y*(abs(velocity.y)-velocityStep.y*numberOfSteps));
    pos.add(residual);
  }

  private boolean checkIfOut() {
    if (this.pos.x+this.size.x > canvasTopLeft.x+canvasSize.x) return true;
    if (this.pos.x < canvasTopLeft.x)return true;
    if (this.pos.y+this.size.y > canvasTopLeft.y+canvasSize.y) return true;
    if (this.pos.y < canvasTopLeft.y)return true;
    return false;
  }
  public void changeColor(){
      if (colorChange > 1||colorChange < 0) {
      incrementation*=-1;
    }
    colorChange +=incrementation;
    currentColor =lerpColor(color(color1), color(color2), colorChange );
  }
};

boolean isPositive(float number) {
  return number >= 0;
}
