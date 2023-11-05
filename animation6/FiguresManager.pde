class FiguresManager {
  ArrayList<Figure> figures;
  boolean biggerOnCollision = false;
  float biggerOnCollisionPercent = 2;
  boolean fasterOnCollision = false;
  float fasterOnCollisionPercent = 2;
  boolean changeColorOnCollision = false;
  boolean playAudioOnCollision = true;
  FiguresManager() {
    figures = new ArrayList();
  }
  void addFigure(
    PVector leftTopCorner, 
    PVector size, 
    float angle, float velocity, float velocityStep, 
    color color1, 
    color color2)
  {
    figures.add(new Figure(leftTopCorner, size, angle, velocity, velocityStep, color1, color2));
  }
  void manage() {
    for (int i = 0; i<figures.size(); i++) {
      int numberOfSteps = figures.get(i).velocityNumberOfSteps;
      for (int step = 1; step <= numberOfSteps; step++) {
        figures.get(i).moveByStep();
        figures.get(i).updateHitbox();
        if (checkIfOut(figures.get(i)))
          figures.get(i).display(playgroundOffset);
      }
      figures.get(i).move(figures.get(i).velocity-figures.get(i).velocityStep*numberOfSteps);
      figures.get(i).updateHitbox();
      if (checkIfOut(figures.get(i)))
        figures.get(i).display(playgroundOffset);
    }
  }
  void collisions() {
    boolean thereWasCollision = false;
    for (int i = 0; i< figures.size(); i++) {
      boolean figureCollided = false;
      if (bounceOnPlayground(figures.get(i)) ) {
        if (!figures.get(i).inCollision) {
          specialActOnCollision(figures.get(i));
          thereWasCollision = true;
        }
        figureCollided = true;
      }
      for (int j = 0; j< figures.size(); j++) {
        if (i==j) continue;
        if (bounce(figures.get(i), figures.get(j).hitbox)) {
          if (!figures.get(i).inCollision) {
            specialActOnCollision(figures.get(i));
            thereWasCollision = true;
          }
          figureCollided = true;
          continue;
        }
      }
      figures.get(i).inCollision = figureCollided;
    }
    if (playAudioOnCollision && thereWasCollision) {
      pop.trigger();
    }
  }
  boolean bounceOnPlayground(Figure figure) {
    return bounce(figure, pg.top) ||
      bounce(figure, pg.bottom) ||
      bounce(figure, pg.left) ||
      bounce(figure, pg.right);
  }
  boolean bounce(Figure figure, Hitbox hitbox) {
    if (figure.checkCollisionWithBottom(hitbox)) {
      figure.direction.y = -abs(figure.direction.y) ;
      figure.calculateAngle();
      return true;
    }
    if (figure.checkCollisionWithTop(hitbox)) {
      figure.direction.y = abs(figure.direction.y) ;
      figure.calculateAngle();
      return true;
    }
    if (figure.checkCollisionWithLeft(hitbox)) {
      figure.direction.x = abs(figure.direction.x) ;
      figure.calculateAngle();
      return true;
    }
    if (figure.checkCollisionWithRight(hitbox)) {
      figure.direction.x = -abs(figure.direction.x) ;
      figure.calculateAngle();
      return true;
    }
    return false;
  }
  void specialActOnCollision(Figure figure) {
    if (changeColorOnCollision)
      figure.changeColor();
    if (fasterOnCollision) {
      figure.velocity *= 1+fasterOnCollisionPercent*0.01;
      figure.calculateVelocityNumberOfSteps();
    }
    if (biggerOnCollision) {
      figure.size.mult(1+biggerOnCollisionPercent*0.01);
      figure.calculateRightBottomCorner();
    }
  }
  void biggerOnCollisionBy(float percent) {
    for (int i = 0; i< figures.size(); i++) {
      biggerOnCollision = true;
      biggerOnCollisionPercent = percent;
    }
  }
  void notBiggerOnCollision() {
    for (int i = 0; i< figures.size(); i++) {
      biggerOnCollision = false;
    }
  }
  void fasterOnCollisionBy(float percent) {
    for (int i = 0; i< figures.size(); i++) {
      fasterOnCollision = true;
      fasterOnCollisionPercent = percent;
    }
  }
  void notFasterOnCollision() {
    for (int i = 0; i< figures.size(); i++) {
      fasterOnCollision = false;
    }
  }
  void changeColorOnCollision() {
    for (int i = 0; i< figures.size(); i++) {
      changeColorOnCollision = true;
    }
  }
  void notChangeColorOnCollision() {
    for (int i = 0; i< figures.size(); i++) {
      changeColorOnCollision = false;
    }
  }
  void playAudioOnCollision() {
    for (int i = 0; i< figures.size(); i++) {
      playAudioOnCollision = true;
    }
  }
  void notplayAudioOnCollision() {
    for (int i = 0; i< figures.size(); i++) {
      playAudioOnCollision = false;
    }
  }
  boolean checkIfOut(Figure figure) {
    return!((figure.leftTopCorner.x < pg.leftTopCorner.x-10)||
      (figure.rightBottomCorner.x > pg.rightBottomCorner.x+10) ||
      (figure.leftTopCorner.y < pg.leftTopCorner.y-10)||
      (figure.rightBottomCorner.y > pg.rightBottomCorner.y+10));
  }
};
