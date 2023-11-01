class FiguresManager {
  ArrayList<Figure> figures;
  FiguresManager() {
    figures = new ArrayList();
  }
  void addFigure(
    PVector velocity, 
    PVector size, 
    PVector gravity, 
    PVector pos, 
    color color1,
    color color2)
  {
    figures.add(new Figure(velocity, size, gravity, pos, color1,color2));
  }
  void moveFigures() {
    for (int i = 0; i<figures.size(); i++) {
      figures.get(i).update();
    }
  }
  void displayFigures() {
    for (int i = 0; i<figures.size(); i++) {
      figures.get(i).display();
    }
  }
  void actOnCollision() {
    for (int i = 0; i<figures.size(); i++) {
      collisionWithWalls(figures.get(i));
      for (int j = i+1; j<figures.size(); j++) {   
        if (checkCollision( figures.get(i), figures.get(j) ) ) {
          PVector tempVel = figures.get(i).velocity;
          figures.get(i).velocity =  figures.get(j).velocity ;
          figures.get(j).velocity =  tempVel;
          //specialOnCollision(figures.get(i));
          //specialOnCollision(figures.get(j));
        }
      }
    }
  }
  void collisionWithWalls(Figure jeden) {
    if (jeden.pos.x + jeden.size.x > canvasTopLeft.x + canvasSize.x) {
      jeden.velocity.x*=-1;
      jeden.pos.x = canvasTopLeft.x+canvasSize.x - jeden.size.x;
      specialOnCollision(jeden);
      return;
    }

    if (jeden.pos.x < canvasTopLeft.x) {
      jeden.velocity.x*=-1;
      jeden.pos.x = canvasTopLeft.x;
      specialOnCollision(jeden);
      return;
    }
    if (jeden.pos.y+jeden.size.y > canvasTopLeft.y+canvasSize.y) {
      jeden.velocity.y*=-1;
      jeden.pos.y = canvasTopLeft.y+canvasSize.y - jeden.size.y;
      specialOnCollision(jeden);
      return;
    }
    if (jeden.pos.y < canvasTopLeft.y) {
      jeden.velocity.y*=-1;
      jeden.pos.y = canvasTopLeft.y;
      specialOnCollision(jeden);
      return;
    }
  }
  void specialOnCollision(Figure jeden) {
    jeden.size.mult(1.02);
    pop.trigger();
    jeden.changeColor();
  }
  boolean checkCollision(Figure a, Figure b) {
    if (a.pos.x + a.size.x < b.pos.x  || a.pos.x  > b.pos.x  + b.size.x || a.pos.y + a.size.y < b.pos.y || a.pos.y > b.pos.y + b.size.y)
      return false; 
    return true;
  }
};
