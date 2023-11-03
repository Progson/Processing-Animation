Playground pg;
FiguresManager figureManager;
void setup() {
  size(600, 800);
  pg = new Playground(
    new PVector(width/5, height/5/2), 
    new PVector(3*width/5, 3*height/5)
    );
  figureManager = new FiguresManager();
  pg.currentColor = color(100,100,255);
  figureManager.addFigure(new PVector(100, 100), 
    new PVector(30, 30), 
    30, 6, 3, 
    color(#D80202), 
    color(#08FFF1)
    );
  pg.display(new PVector(0, 0));
}
void draw () {
  figureManager.collisionWithWalls();
  figureManager.manage();
  
}
