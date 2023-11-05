
//recording stuff
import ddf.minim.*;
import ddf.minim.ugens.*;
int recordingFrameRate = 60;
Minim minim;
AudioSample pop;
AudioInput in;
AudioRecorder recorder;

boolean play = true;
PVector playgroundOffset;

Playground pg;
FiguresManager figureManager;
Comment comment1;
void setup() {
  size(1080, 1920);
  frameRate(recordingFrameRate);
  background(255);

  playgroundOffset = new PVector(width/5, height/5);
  play = true;
  recordingFrameRate = 60;

  minim = new Minim(this);
  pop = minim.loadSample("../sounds/tenisBallBounce.mp3", 512);
  recorder = minim.createRecorder(pop, "../exports/"+sketchname+"A.wav");

  pg = new Playground(new PVector(3*width/5, 3*height/5));
  pg.currentColor = color(0);

  figureManager = new FiguresManager();
  int numberOfFigures = 10;
  int numberOfFiguresInRow = 2;
  int numberOfFiguresInColumn = numberOfFigures/numberOfFiguresInRow;
  for (int i = 0; i < numberOfFiguresInRow; i++) {
    for (int j = 0; j< numberOfFiguresInColumn; j++) {
      figureManager.addFigure(new PVector(pg.rightBottomCorner.x/numberOfFiguresInRow / 2 + i*pg.rightBottomCorner.x/numberOfFiguresInRow, 
        pg.rightBottomCorner.y/numberOfFiguresInColumn/2+j*pg.rightBottomCorner.y/numberOfFiguresInColumn), 
        new PVector(30, 30), 
        45+i*j*90, 10, 3, 
        color(100+20*j, 20*i*j, 100-50*i*j), 
        color(100-50*i*j, 20*i*j, 100+20*j)
        );
    }
  }
  figureManager.notBiggerOnCollision();
  //figureManager.biggerOnCollisionBy(2);
  figureManager.changeColorOnCollision();
  figureManager.fasterOnCollisionBy(2);
  figureManager.playAudioOnCollision();

  comment1 = new Comment(new PVector (10, 10), new PVector (600, 1000), -5);
  comment1.setImg("../comments/10 of them.png");
}
void draw () {
  if (!play) {
    if (recorder.isRecording()) {
      recorder.endRecord();
      recorder.save().close();
      stopRec();
    }
    exit();
  } else {
    if (frameCount == 1) {
      pg.display(playgroundOffset);
    }
    figureManager.collisions();
    figureManager.manage();
    drawSurrounding();
    comment1.display();
    if (!recorder.isRecording()) recorder.beginRecord();
    rec();
  }
}
void keyReleased() { 
  if (key == 's') {
    play = false;
  }
}
