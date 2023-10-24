import ddf.minim.*;
import ddf.minim.ugens.*;

boolean play=true;

Minim minim;
AudioSample pop;
AudioInput in;
AudioRecorder recorder;

Figure jeden;
PVector canvasTopLeft;
PVector canvasSize;
String theTitle = "Every collision +2%";

void setup() {
  size( 600, 800);
  frameRate(60);
  background(255);
  textAlign(CENTER);

  drawCanvas();
  drawTheTitle();

  minim = new Minim(this);
  pop = minim.loadSample("../sounds/pop-2.mp3", 512);
  recorder = minim.createRecorder(pop, "../exports/"+sketchname+"A.wav");


  jeden = new Figure(
    new PVector(3, 3), 
    new PVector(30, 30), 
    new PVector(0, 0), 
    new PVector(canvasTopLeft.x+canvasSize.x/2, canvasTopLeft.y+canvasSize.y/2), 
    color(#1DF2F0));
    
}

void draw () {
  if (!play) {
    stopRec();
    recorder.endRecord();
    recorder.save().close(); 
    exit();
  } else {
    if (!recorder.isRecording()) {
      recorder.beginRecord();
    }
    jeden.update();
    collisionDetection();
    jeden.display();
    rec();
  }
}

void drawTheTitle() {
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
  if (jeden.pos.x+jeden.size.x+jeden.velocity.x >= canvasTopLeft.x+canvasSize.x) {
    jeden.velocity.x*=-1;
    jeden.pos.x = canvasTopLeft.x+canvasSize.x - jeden.size.x;
    specialOnCollision();
    return;
  }

  if (jeden.pos.x+jeden.velocity.x <= canvasTopLeft.x) {
    jeden.velocity.x*=-1;
    jeden.pos.x = canvasTopLeft.x;
    specialOnCollision();
    return;
  }
  if (jeden.pos.y+jeden.size.y+jeden.velocity.y >= canvasTopLeft.y+canvasSize.y) {
    jeden.velocity.y*=-1;
    jeden.pos.y = canvasTopLeft.y+canvasSize.y - jeden.size.y;
    specialOnCollision();
    return;
  }
  if (jeden.pos.y+jeden.velocity.y <= canvasTopLeft.y) {
    jeden.velocity.y*=-1;
    jeden.pos.y = canvasTopLeft.y;
    specialOnCollision();
    return;
  }
}
float colorChange = 0.1;
float incrementation =0.05;
void specialOnCollision() {
  jeden.velocity.mult(1.02);
  pop.trigger();
  if(colorChange > 1||colorChange < 0){
    incrementation*=-1;
  }
  colorChange +=incrementation;
  jeden.fillment =lerpColor(color(#1DF2F0), color(#FA19EB), colorChange );
}
