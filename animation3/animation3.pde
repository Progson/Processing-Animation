import ddf.minim.*;
import ddf.minim.ugens.*;

boolean play=true;
int recordingFrameRate = 60;

Minim minim;
AudioSample pop;
AudioInput in;
AudioRecorder recorder;

Figure jeden;
FiguresManager man;
PVector canvasTopLeft;
PVector canvasSize;
String theTitle = "Every collision +2% bigger";
String signature = "@progson";

void setup() {
  size( 600, 800);
  frameRate(recordingFrameRate);
  background(255);
  textAlign(CENTER);

  drawCanvas();
  drawTheTitle();

  minim = new Minim(this);
  pop = minim.loadSample("../sounds/pop-2.mp3", 512);
  recorder = minim.createRecorder(pop, "../exports/"+sketchname+"A.wav");

  man = new FiguresManager();
  man.addFigure(
    new PVector(3, -3), 
    new PVector(30, 30), 
    new PVector(0, 0), 
    new PVector(canvasTopLeft.x+canvasSize.x/2, canvasSize.y/4), 
    color(#0DF502),
    color(#0F39FF));
  man.addFigure(
  new PVector(-3, 3),
  new PVector(30, 30),
  new PVector(0, 0),
  new PVector(canvasTopLeft.x+canvasSize.x/2,canvasTopLeft.y+3*canvasSize.y/4),
  color(#FEFF00),
  color(#FF0004));
}
void draw () {
  if (!play) {
    stopRec();
    recorder.endRecord();
    recorder.save().close(); 
    exit();
  } else {

    //man.displayFigures();
    man.moveFigures();
    man.actOnCollision();
    if (!recorder.isRecording()) recorder.beginRecord();
    rec();
  }
}
void keyReleased(){
  if(key == 's'){
    play = false;
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
  text( signature, canvasTopLeft.x+canvasSize.x/2, canvasTopLeft.y+canvasSize.y+50);
}
