import ddf.minim.*;
 
Minim minim;
AudioPlayer meow;
AudioPlayer purr;

MotionDetector motionDetector;

PImage[] cat = new PImage[45];
int catIndex = 0;

void setup() {
  size(400, 700);
  frameRate(5);
  
  minim = new Minim(this);
  meow = minim.loadFile("meow.wav");
  purr = minim.loadFile("purr.wav");
  //purr.play();
  
  for (int index = 0; index < 45; index++) {
    String prefix = "cat-";
    String indexToString = str(index);
    String fileExt = ".gif";
    String temp1 = prefix.concat(indexToString);
    String temp2 = temp1.concat(fileExt);
    cat[index] = loadImage(temp2);
  }
  
  motionDetector = new MotionDetector(this, width, height, true);
  
}

void draw() {
  background(0, 0, 0);
  
  motionDetector.run();
  
  //motionDetector.drawVideo(width-160, 0, 160, 120);
  
  if (motionDetector.checkHit(0, 0, width, height) != true) {
    println("no movement");
    image(cat[catIndex], 75, 50);
    if (catIndex < 10) {
      catIndex++;
    } else {
      catIndex = 0;
    }
  } else {
    println("movement");
    image(cat[catIndex], 75, 50);
    if (catIndex == 32) {
      meow.play();
      meow = minim.loadFile("meow.wav");
    }
    if (catIndex < cat.length - 1) {
      catIndex++;
    } else {
      catIndex = 12;
    }
  }
  
  println(catIndex);
  
}
