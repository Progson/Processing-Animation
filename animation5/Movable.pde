class Movable extends Displayable {
  PVector direction, Gravity;
  float velocity, velocityStep, angle;
  int velocityNumberOfSteps;

  Movable(PVector leftTopCorner, PVector size, float angle, float velocity, float velocityStep) {
    super(leftTopCorner, size);
    this.velocity = velocity;
    this.velocityStep = velocityStep;
    this.angle = angle;
    direction = new PVector(0, 0);
    calculateDireciton();
  }

  Movable(PVector leftTopCorner, PVector size, 
    float angle, float velocity) {
    super(leftTopCorner, size);
    this.velocity = velocity;
    this.velocityStep = velocity;
    this.angle = angle;
    direction = new PVector(0, 0);
    calculateDireciton();
  }
  void calculateDireciton() {
    direction.x = cos(radians(angle));
    direction.y = sin(radians(angle));
  }
  void calculateAngle() {
    angle = degrees(atan2(direction.y, direction.x));
  }
  void calculateVelocityNumberOfSteps() {
    velocityNumberOfSteps = int(velocity/velocityStep);
  }
  void move() {
    leftTopCorner.add(PVector.mult(direction, velocity));
    calculateRightBottomCorner();
  }
  void move(float velocity) {
    leftTopCorner.add(PVector.mult(direction, velocity));
    calculateRightBottomCorner();
  }
  void moveByStep() {
    leftTopCorner.add(PVector.mult(direction, velocityStep));
    calculateRightBottomCorner();
  }

};
