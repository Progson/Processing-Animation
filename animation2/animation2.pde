import ddf.minim.*;
import ddf.minim.ugens.*;

boolean play=true;

Minim minim;
AudioSample pop;
AudioInput in;
AudioRecorder recorder;

Figure jeden;
FiguresManager man;
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

  man = new FiguresManager();
  man.addFigure(
    new PVector(3, 3), 
    new PVector(30, 30), 
    new PVector(0, 0), 
    new PVector(canvasTopLeft.x, canvasTopLeft.y), 
    color(#1DF2F0));
  man.addFigure(
    new PVector(3, 3), 
    new PVector(30, 30), 
    new PVector(0, 0), 
    new PVector(canvasTopLeft.x, canvasTopLeft.y+canvasSize.y/2), 
    color(#1DF2F0));
}
void draw () {
  if (!play) {
    stopRec();
    recorder.endRecord();
    recorder.save().close(); 
    exit();
  } else {
    man.moveFigures();
    //man.displayFigures();
    man.actOnCollision();
    if (!recorder.isRecording()) recorder.beginRecord();
    rec();
    print("---------->" + frameRate+ "\n");
  }
  print(frameCount);
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
