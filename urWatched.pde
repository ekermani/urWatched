import processing.video.*;
Capture cam;

PFont font;
PImage bars;
PImage img; 

boolean modeA = true;
int clockStart;
int a=255;
      
void setup() {
  font = loadFont("PingFangHK-Ultralight-48.vlw"); 

  size(500, 600);  
  cam = new Capture(this, 640, 600);  //CHECK THE SIZE
  cam.start(); 

  bars = loadImage("images/watchFrameBars.png");
  noStroke();
  background(255);
}

void draw() {
      
  if (cam.available()) {
    cam.read();
  }
  if (modeA) {
    pushMatrix();
    translate(width/2, height/2);
    imageMode(CENTER);
    image(cam, 0, 0); //load cam at 0,0
    popMatrix();
  }
  imageMode(CORNER);
  image(bars, 0, 0);


  if (!modeA) {

    int hour = hour();
    int min = minute();
    int sec = second();
    int day = day();
    int mon = month();

    img = loadImage("0.png"); 
    image(img, 0, 0, width, height); 
    
      rect(0,0,500,600);
        a--;
        if(a<0){a=0;} //to stop at 0
        
   noTint();
    noStroke();
    fill(0);
    textFont(font);
    textSize(50);
    text((mon + ":" + day  + ":" + hour + ":" + min + ":" + sec),185,72);
    fill(255,a);
     println(a);
  }
}

void mousePressed() {
  if (modeA) {
    saveFrame("data/"+0+".png");
    modeA = false;
  }
} 