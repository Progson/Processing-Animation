final String sketchname = getClass().getName();
import com.hamoid.*;

VideoExport videoExport;


void rec() {
  if (frameCount == 1 )
  {
    videoExport = new VideoExport(this, "../exports/"+sketchname+"V.mp4");
    videoExport.setFrameRate(60);
    videoExport.startMovie();
  }  
  videoExport.saveFrame();
}
void stopRec(){
  videoExport.endMovie();
}
