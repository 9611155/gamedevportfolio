// Lincoln Tayler | Shape Game | 3 Sept 2024
import processing.sound.*;
SoundFile collide;
int x, y, score, tx, ty, tw, speed, shapeDist;
PImage bg1, user1, target;
void setup() { // setup runs once at start
  size(800, 800);
  background(#311b32);
  collide = new SoundFile(this, "yay.mp3");
  bg1 = loadImage("PImage.jpg");
  target = loadImage("target.png");
  user1 = loadImage("user1.png");
  x = 100;
  y = 100;
  score = 0;
  tx = width/2;
  ty = width/2;
  tw = 100;
  speed = 0;
  shapeDist = 0;
}

void draw() { // draw runs on a 30 fps loop
  shapeDist = int(dist(x, y, tx, ty)<10+tw/2);
  println(shapeDist);
  frameRate(speed + 20);
  background(bg1);
  target();
  fill(255, 255, 0);
  stroke(255);
  //ellipse(x, y, 20, 20);
  user1.resize(100, 100);
  imageMode(CENTER);
  image(user1, x, y);
  target.resize(100, 100);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y = y - 15;
    } else if (key == 's' || key == 'S') {
      y = y + 15;
    } else if (key == 'a' || key == 'A') {
      x = x - 15;
    } else if (key == 'd' || key == 'D') {
      x = x + 15;
    }
  }
  score();
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y = y - 10;
    } else if (keyCode == DOWN) {
      y = y + 10;
    } else if (keyCode == LEFT) {
      x = x - 10;
    } else if (keyCode == RIGHT) {
      x = x + 10;
    }
  }
}

void score() {
  rectMode(CENTER);
  fill(128, 128);
  rect(width/2, 20, width, 40);
  fill(0);
  textSize(30);
  text("Score:" + score, 20, 30);
  if (dist(x, y, tx, ty)<10+tw/2) {
    collide.play();
    tx = int(random(width));
    ty = int(random(height));
    score = score + 2;
    tw = 100;
    speed = speed + 1;
  }
}

void target() {
  imageMode(CENTER);
  image(target, tx, ty);
  fill(100, 100, 100);
  rectMode(CENTER);
  //rect(tx, ty, tw, tw);
  tw = tw - 1;
  if (tw < 1) {
    gameOver();
  }
}
void gameOver() {
  background(0);
  fill(255);
  text("GAME OVER!", width/2, height/2);
  noLoop();
}
