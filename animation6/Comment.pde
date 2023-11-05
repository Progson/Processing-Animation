class Comment extends Displayable {
  float angle;
  PImage img;
  Comment(PVector leftTopCorner, PVector size, float angle){
  super(leftTopCorner,size);
  this.angle = angle;
  }
  void display(PVector Offset,float angle){
    rotate(radians(angle));
    image(img,Offset.x + leftTopCorner.x, Offset.y + leftTopCorner.y,size.x,size.y);
    rotate(-radians(angle));
  }
  void display(PVector Offset){
    display(Offset,this.angle);
  }
  void display(float angle){
    display(new PVector(0,0), angle);
  }
  void display(){
    display(new PVector(0,0),this.angle);
  }
  void setImg(String path){
    img = loadImage(path);
    float ratio = img.width/img.height;
    size.y = size.x/ratio;
  }
};
