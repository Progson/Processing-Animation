final String sketchname = getClass().getName();
import com.hamoid.*;
import ddf.minim.*;
import ddf.minim.ugens.*;


VideoExport videoExport;


void rec() {
  if (frameCount == 1 )
  {
    videoExport = new VideoExport(this, "../exports/"+sketchname+"V.mp4");
    videoExport.setFrameRate(30);
    videoExport.startMovie();
  }
  videoExport.saveFrame();
}
void stopRec(){
  videoExport.endMovie();
}
