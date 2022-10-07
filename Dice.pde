static int DPX = 10;
static int DPY = 10;
static int WIDTH = 500;
static int HEIGHT = 500;
boolean mouikkai = false;
float cooldown = 60 * 3;
int sum = 0;

void setup() {
  size(500,500);
	//noLoop();
  frameRate(60);
  fill(0, 0, 0, 140);
  rect(WIDTH/10, HEIGHT/50, WIDTH-(WIDTH/10*2), HEIGHT/10, HEIGHT/50);
  fill(255, 255, 255);
  textSize(20);
  text("Click to roll dice", 20+WIDTH/10, 20+2*(HEIGHT/50));
  
}
void rDraw(){
  background(255);
  sum = 0;
  for (int x = 0; x < DPX; x++) {
    for (int y = 0; y < DPY; y++) {
      int rw = (int)(WIDTH/DPX);
      int rh = (int)(HEIGHT/DPY);
      int rx = (int)(((float)WIDTH/DPX)*x)+(rw/2);
      int ry = (int)(((float)HEIGHT/DPY)*y)+(rh/2);
      Die die = new Die(rx, ry, rw, rh);
      int roll = die.roll(9);
      die.show(roll);
      sum += roll; 
    }
  }
  fill(0, 0, 0, 140);
  rect(WIDTH/10, HEIGHT/50, WIDTH-(WIDTH/10*2), HEIGHT/10, HEIGHT/50);
  fill(255, 255, 255);
  textSize(20);
  cooldown -= 1;
    if (cooldown <= 0) {
      mouikkai = false;
      cooldown = 60*3;
      String i = "Total Dice: "+(DPX*DPY)+", Sum: "+(sum)+", Average: "+(float)sum/(DPX*DPY);
      text(i, 20+WIDTH/10, 20+2*(HEIGHT/50));
    } else {
      String s = "Rolling";
      for (int i = 0; i<frameCount/20%4; i++) {
        s += ".";
      }
      while (s.length() < 13) {
        s = "(click to skip)";
      }
      text(s, 20+WIDTH/10, 20+2*(HEIGHT/50));   
    }
  }
void draw()
{
  if (mouikkai) {
     rDraw();
  }
}
void mousePressed()
{
  if (mouikkai) {
    cooldown = 0;
    rDraw();
  	mouikkai = false;
  } else {
    mouikkai = true;
    cooldown = 60*3;
  }
}
class Die //models one single dice cube
{
	//variable declarations here
  int width;
  int height;
  int x;
  int y;
  int range = 6;
  int value;
	
	Die(int x, int y, int width, int height) {
		//variable initializations here
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
	}
  int roll() {
    value = (int)(Math.random()*range)+1;
    return value;
  }
  int roll(int range) {
    value = (int)(Math.random()*range)+1;
    return value;
  }
	void show(int value) {
    resetMatrix();
    translate(x, y);
    
    //fill(255-((int)(Math.random()*50)),255-((int)(Math.random()*50)),255-((int)(Math.random()*50)));
    fill(255,255,255);
    stroke(0,0,0);
    rect(rw(-.5), rh(-.5), rw(1), rh(1), rw(.2));
    fill(0,0,0);
    noStroke();
		switch (value) {
      case 1:
        ellipse(0, 0, rw(.4), rh(.4));
        break;
      case 2:
        ellipse(rw(-.5+.25), rh(-.5+.25), rw(.2), rh(.2));
        ellipse(rw(.5-.25), rh(.5-.25), rw(.2), rh(.2));
        break;
      case 3:
        ellipse(rw(-.5+.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(0, 0, rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(.5-.2), rw(.2), rh(.2));
        break;
      case 4:
        ellipse(rw(-.5+.25), rh(-.5+.25), rw(.2), rh(.2));
        ellipse(rw(.5-.25), rh(.5-.25), rw(.2), rh(.2));
        ellipse(rw(-.5+.25), rh(.5-.25), rw(.2), rh(.2));
        ellipse(rw(.5-.25), rh(-.5+.25), rw(.2), rh(.2));
        break;
      case 5:
        ellipse(rw(-.5+.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(.5-.2), rw(.2), rh(.2));
        ellipse(rw(-.5+.2), rh(.5-.2), rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(0, 0, rw(.2), rh(.2));
        break;
      case 6:
        ellipse(rw(-.5+.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(.5-.2), rw(.2), rh(.2));
        ellipse(rw(-.5+.2), rh(.5-.2), rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(rw(-.5+.2), 0, rw(.2), rh(.2));
        ellipse(rw(.5-.2), 0, rw(.2), rh(.2));
        break;
      case 7:
        ellipse(rw(-.5+.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(.5-.2), rw(.2), rh(.2));
        ellipse(rw(-.5+.2), rh(.5-.2), rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(rw(-.5+.2), 0, rw(.2), rh(.2));
        ellipse(rw(.5-.2), 0, rw(.2), rh(.2));
        ellipse(0, 0, rw(.2), rh(.2));
        break;
      case 8:
        ellipse(rw(-.5+.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(.5-.2), rw(.2), rh(.2));
        ellipse(rw(-.5+.2), rh(.5-.2), rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(rw(-.5+.2), 0, rw(.2), rh(.2));
        ellipse(rw(.5-.2), 0, rw(.2), rh(.2));
        ellipse(0, rh(-.5+.2), rw(.2), rh(.2));
        ellipse(0, rh(.5-.2), rw(.2), rh(.2));
        break;
      case 9:
        ellipse(rw(-.5+.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(.5-.2), rw(.2), rh(.2));
        ellipse(rw(-.5+.2), rh(.5-.2), rw(.2), rh(.2));
        ellipse(rw(.5-.2), rh(-.5+.2), rw(.2), rh(.2));
        ellipse(rw(-.5+.2), 0, rw(.2), rh(.2));
        ellipse(rw(.5-.2), 0, rw(.2), rh(.2));
        ellipse(0, rh(-.5+.2), rw(.2), rh(.2));
        ellipse(0, rh(.5-.2), rw(.2), rh(.2));
        ellipse(0, 0, rw(.2), rh(.2));
        break;
    }
    resetMatrix();
	}
  private int rw(float r) {
    return (int)(width*r);
  }
  private int rh(float h) {
    return (int)(height*h);
  }
}
