Playground pg;
FiguresManager figureManager;
PVector playgroundOffset;
void setup() {
  size(600, 800);
  playgroundOffset = new PVector(width/5, height/5/2);
  pg = new Playground(
    new PVector(0,0), 
    new PVector(3*width/5, 3*height/5)
    );
  figureManager = new FiguresManager();
  pg.currentColor = color(100,100,255);
  figureManager.addFigure(new PVector(100, 300), 
    new PVector(30, 30), 
    30, 6, 3, 
    color(#D80202), 
    color(#08FFF1)
    );
    figureManager.addFigure(new PVector(0, 0), 
    new PVector(30, 30), 
    72, 6, 3, 
    color(#024EE0), 
    color(#22C902)
    );
    pg.display(playgroundOffset);
}
void draw () {
  figureManager.collisionWithPlayground();
  figureManager.collision();
  figureManager.manage();
  
}
