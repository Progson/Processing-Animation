class FiguresManager {
  ArrayList<RectFigure> figures;
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
    figures.add(new RectFigure(leftTopCorner, size, angle, velocity, velocityStep, color1, color2));
  }
  void manage() {
    for (int i = 0; i<figures.size(); i++) {
      int numberOfSteps = figures.get(i).velocityNumberOfSteps;
      for (int step = 1; step <= numberOfSteps; step++) {
        figures.get(i).moveByStep();
        figures.get(i).updateHitbox();
        figures.get(i).display(pg.leftTopCorner);
      }
      figures.get(i).move(figures.get(i).velocity-figures.get(i).velocityStep*numberOfSteps);
      figures.get(i).updateHitbox();
      figures.get(i).display(playgroundOffset);
    }
  }
  void collision(RectFigure figure, Hitbox other) {
    // Sprawdź kolizję z górą
    if (figure.hitbox.rightBottomCorner.y >= other.leftTopCorner.y &&
      figure.hitbox.leftTopCorner.y <= other.leftTopCorner.y &&
      figure.hitbox.rightBottomCorner.x >= other.leftTopCorner.x &&
      figure.hitbox.leftTopCorner.x <= other.rightBottomCorner.x) {

      figure.direction.y = -abs(figure.direction.y) ;
      figure.calculateAngle();
      figure.changeColor();
      return;      
    }
    // Sprawdź kolizję z góra
    if (figure.hitbox.leftTopCorner.y <= other.rightBottomCorner.y && 
      figure.hitbox.rightBottomCorner.y >= other.rightBottomCorner.y &&
      figure.hitbox.rightBottomCorner.x >= other.leftTopCorner.x &&
      figure.hitbox.leftTopCorner.x <= other.rightBottomCorner.x) {
      
      figure.direction.y = abs(figure.direction.y) ;
      figure.calculateAngle();
      figure.changeColor();
      return;  
    }

    // Sprawdź kolizję z lewą stroną
    if (figure.hitbox.rightBottomCorner.x >= other.leftTopCorner.x &&
      figure.hitbox.leftTopCorner.x <= other.leftTopCorner.x &&
      figure.hitbox.rightBottomCorner.y >= other.leftTopCorner.y &&
      figure.hitbox.leftTopCorner.y <= other.rightBottomCorner.y) {

      figure.direction.x = -abs(figure.direction.x) ;
      figure.calculateAngle();
      figure.changeColor();
      return;  
    }

    // Sprawdź kolizję z prawą stroną
    if (figure.hitbox.leftTopCorner.x <= other.rightBottomCorner.x &&
      figure.hitbox.rightBottomCorner.x >= other.rightBottomCorner.x &&
      figure.hitbox.rightBottomCorner.y >= other.leftTopCorner.y &&
      figure.hitbox.leftTopCorner.y <= other.rightBottomCorner.y) {

      figure.direction.x = abs(figure.direction.x) ;
      figure.calculateAngle();
      figure.changeColor();
      return;  
    }
    
  }

  void collision() {
    for (int i = 0; i< figures.size(); i++) {
      for (int j = 0; j< figures.size(); j++) {
        if (i==j) continue;
        collision(figures.get(i), figures.get(j).hitbox);
      }
    }
  }
  void collisionWithPlayground(){
    for (int i = 0; i< figures.size(); i++) {
        collision(figures.get(i), pg.top);
        collision(figures.get(i), pg.bottom);
        collision(figures.get(i), pg.left);
        collision(figures.get(i), pg.right);
    }
  }
  void collisionWithWalls() {
    for (int i = 0; i< figures.size(); i++) {
      if (pg.leftTopCorner.x + figures.get(i).hitbox.leftTopCorner.x < pg.hitbox.leftTopCorner.x) {
        figures.get(i).direction.x =  abs(figures.get(i).direction.x) ;
        figures.get(i).calculateAngle();
        figures.get(i).changeColor();
        //figures.get(i).angle = 540 - figures.get(i).angle;
        //figures.get(i).calculateDireciton();
      }
      if (pg.leftTopCorner.x + figures.get(i).hitbox.rightBottomCorner.x > pg.hitbox.rightBottomCorner.x) {

        figures.get(i).direction.x =  -abs(figures.get(i).direction.x) ;
        figures.get(i).calculateAngle();
        figures.get(i).changeColor();
        //figures.get(i).angle = 540 - figures.get(i).angle;
        //figures.get(i).calculateDireciton();
      }
      if (pg.leftTopCorner.y + figures.get(i).hitbox.leftTopCorner.y < pg.hitbox.leftTopCorner.y) {
        figures.get(i).direction.y = abs(figures.get(i).direction.y) ;
        figures.get(i).calculateAngle();
        figures.get(i).changeColor();
        //figures.get(i).angle = 360 - figures.get(i).angle;
        //figures.get(i).calculateDireciton();
      }
      if (pg.leftTopCorner.y + figures.get(i).hitbox.rightBottomCorner.y > pg.hitbox.rightBottomCorner.y) {
        figures.get(i).direction.y = -abs(figures.get(i).direction.y) ;
        figures.get(i).calculateAngle();
        figures.get(i).changeColor();
        // figures.get(i).angle = 360 - figures.get(i).angle;
        //figures.get(i).calculateDireciton();
      }
    }
  }
};
