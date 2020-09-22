float rippleFreq=15;
ArrayList<Ripple> ripples = new ArrayList<Ripple>();//list to store all ripples
ArrayList<Center> centers = new ArrayList<Center>();//list to store all centers

void setup() {
  size(600,600);
  colorMode(HSB, 360, 100, 100);
}

void draw() {

background(0);
//for loop to display the centers of the ripples
  for (int i = 0; i<centers.size(); i++) {
    Center eachCenter=centers.get(i);
    eachCenter.update();
    eachCenter.createRipple();
  }
  
//for loop to display the ripples & remove transparent ones
  for (int i = 0; i<ripples.size(); i++) {
    Ripple eachRipple=ripples.get(i);
    eachRipple.display();
    // destroying ripples that have gone completely transparent
    if (100-eachRipple.size/2<=0){
      ripples.remove(i);
    }
  }

}

void mouseClicked() {
  //a mouse click is the point of impact that disturbs the surface
  centers.add(new Center(mouseX, mouseY, millis() ));
}

//tried experimenting with this to "write", very laggy unless i change the parameters
void mouseDragged() {
  centers.add(new Center(mouseX, mouseY, millis() ));
}

//class for the ripples
class Ripple {
  float x;
  float y;
  float size;
  float rippleGrowth;
  float birthDate;
  Ripple(float xPos, float yPos, float time) {
    x= xPos;
    y= yPos;
    size=0;
    rippleGrowth=.25;
    birthDate=time;
  } 
  
  void display() {
    noFill();
    strokeWeight(5);
    //lot of things happening in this upcoming line, but basically what I'm doing is I'm mapping the hue to the x coordinate, the saturation to the y coordinate,
    // and decreasing the opacity based on the distance traveled (or the time, or the size, since they're all coded proportionately). The lightness has a fixed value of 100.
    stroke(map(x, 0, width, 0, 360), map(y, 0, height, 0, 360), 100, 100-size/2);
    circle(x, y, size);
    //size increase, and growth rate increase
    size+=rippleGrowth;
    rippleGrowth+=.1;
  }  
}

//the class for the point that creates the ripples
class Center {
  float x;
  float y;
  int birthDate;
  float size;
  int timer;
  Center(float xPos, float yPos, int time) {
    x= xPos;
    y= yPos;
    birthDate = time;
    size=0;
    timer=0;
  } 
  void update(){
    timer+=1;
  }

  void createRipple() {
    if (timer%rippleFreq==0) {
      ripples.add(new Ripple(x, y, birthDate));
    }
  }
}
