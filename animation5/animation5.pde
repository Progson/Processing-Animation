
//recording stuff
import ddf.minim.*;
import ddf.minim.ugens.*;
int recordingFrameRate = 60;
Minim minim;
AudioSample pop;
AudioInput in;
AudioRecorder recorder;

boolean play = true;
Playground pg;
FiguresManager figureManager;
PVector playgroundOffset;
void setup() {
  size(600, 800);
  frameRate(recordingFrameRate);
  background(255);

  playgroundOffset = new PVector(width/5, height/5/2);
  play = true;
  recordingFrameRate = 60;
  
  minim = new Minim(this);
  pop = minim.loadSample("../sounds/metronom.mp3", 512);
  recorder = minim.createRecorder(pop, "../exports/"+sketchname+"A.wav");

  pg = new Playground(new PVector(3*width/5, 3*height/5));
  pg.currentColor = color(180);

  figureManager = new FiguresManager();  
  figureManager.addFigure(new PVector(100, 100), 
    new PVector(30, 30), 
    45, 3, 6, 
    color(#45DB28), 
    color(#8A45ED)
    );
  figureManager.addFigure(new PVector(200,200), 
    new PVector(30, 30), 
    45+180, 3, 6, 
    color(#EA45ED), 
    color(#1BDEE3)
    );
  figureManager.biggerOnCollisionBy(2);
  figureManager.changeColorOnCollision();
  figureManager.fasterOnCollisionBy(2);
  figureManager.playAudioOnCollision();
}
void draw () {
  if (!play) {
    stopRec();
    if (recorder.isRecording()) {
      recorder.endRecord();
      recorder.save().close();
    }
    exit();
  } else {
    drawSurrounding();
    if (frameCount == 1) {
      pg.display(playgroundOffset);
    }
    figureManager.collisions();
    figureManager.manage();
    if (!recorder.isRecording()) recorder.beginRecord();
    rec();
  }
}
void keyReleased() { 
  if (key == 's') {
    play = false;
  }
}
