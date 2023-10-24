
String theTitle = "Every collision +5%";


Figure jeden;
PVector canvasTopLeft;
PVector canvasSize;
void setup() {
  size( 600, 800);
  frameRate(60);
  background(255);
  textAlign(CENTER);
  
  drawCanvas();
  drawTheTitle();
  jeden = new Figure(
    new PVector(2, 2),
    new PVector(30, 30),
    new PVector(0, 0),
    new PVector(canvasTopLeft.x+canvasSize.x/2, canvasTopLeft.y+canvasSize.y/2),
    color(255, 0, 0));
}
void drawTheTitle(){
  textSize(40);
  fill(0);
  text(theTitle, canvasTopLeft.x+canvasSize.x/2, canvasTopLeft.y-20);
}
void drawCanvas() {
  fill(230);
  canvasTopLeft = new PVector(width/5, height/5/2);
  canvasSize = new PVector(3*width/5, 3*height/5);
  rect(canvasTopLeft.x, canvasTopLeft.y, canvasSize.x, canvasSize.y);
  fill(200);
  textSize(30);
  text("@the_progson", canvasTopLeft.x+canvasSize.x/2, canvasTopLeft.y+canvasSize.y+50);
}
void collisionDetection() {
  if (jeden.pos.x+jeden.size.x+jeden.velocity.x > canvasTopLeft.x+canvasSize.x) {
    jeden.velocity.x*=-1;
    specialOnCollision();
    return;
  }

  if (jeden.pos.x+jeden.velocity.x < canvasTopLeft.x) {
    jeden.velocity.x*=-1;
    specialOnCollision();
    return;
  }
  if (jeden.pos.y+jeden.size.y+jeden.velocity.y > canvasTopLeft.y+canvasSize.y) {
    jeden.velocity.y*=-1;
    specialOnCollision();
    return;
  }
  if (jeden.pos.y+jeden.velocity.y < canvasTopLeft.y) {
    jeden.velocity.y*=-1;
    specialOnCollision();
    return;
  }
}
void specialOnCollision() {
  jeden.velocity.mult(1.05);
  
  jeden.fillment =color(random(1,300),random(1,300),random(1,300));
}

void draw () {
  jeden.update();
  collisionDetection();
  jeden.display();
}
