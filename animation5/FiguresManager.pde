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
      figures.get(i).display(pg.leftTopCorner);
    }
  }
  void collisionWithWalls() {
    for (int i = 0; i< figures.size(); i++) {
      if (pg.leftTopCorner.x + figures.get(i).hitbox.leftTopCorner.x < pg.hitbox.leftTopCorner.x) {
        figures.get(i).angle -= 90;
        figures.get(i).calculateDireciton();
      }
      if (pg.leftTopCorner.x + figures.get(i).hitbox.rightBottomCorner.x > pg.hitbox.rightBottomCorner.x) {
        figures.get(i).angle -= 90;
        figures.get(i).calculateDireciton();
      }
      if (pg.leftTopCorner.y + figures.get(i).hitbox.leftTopCorner.y < pg.hitbox.leftTopCorner.y) {
        figures.get(i).angle -= 90;
        figures.get(i).calculateDireciton();
      }
      if (pg.leftTopCorner.y + figures.get(i).hitbox.rightBottomCorner.y > pg.hitbox.rightBottomCorner.y) {
        figures.get(i).angle -= 90;
        figures.get(i).calculateDireciton();
      }
    }
  }
};
