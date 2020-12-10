// TO DO:
// TIME OF THE DAY LIGHT CHANGE !!!!!
// ARDUINO FUCKING WORK !!!!
// FUCKING MUSIC & APPA SOUNDS !!!
// MOVE BACKGROUND!
// collectible spheres with sound! YOU DONT FUCKING NEED IT


//serial stuff
import processing.serial.*;
import processing.sound.*;
Serial myPort;

//inputs
float light_value=0;
float potentio_value=0;
float[] arduino_inputs;
//light transitions
float prev=0; //for lights
float prev2=0; //for bg hue
float light_mapped=0; //for lights
float light_mapped2=0; //for bg hue

//perspective
float cameraZ = (height/2.0)/tan(PI*60/360);
float distance_traveled_x=0;
float distance_traveled_z=0;

//appa
float temp_mouseX;
float temp_mouseY;
Bison appa;
PShape appaModel;


//grid
int cols, rows;
int scl = 45;
int w = 4500;
int h = 3600;
float[][] terrain;

//animation
float xoff = 0;
float yoff = 0;
float flying_x = 0;
float flying_y = 0;
float angle_x=0;
float angle_z=0;

//appa movement
float angleX;
float angleZ;
float angleY;
float angle_increment=PI/240;

float acceleration_xmax=0.1*cos(-2.27+angle_z);
float acceleration_ymax=0.1*sin(-2.27+angle_z);
float acceleration_xcurrent=0;
float acceleration_ycurrent=0;

//subcomponents for 3D movement
float acceleration_xcurrent_up;
float acceleration_ycurrent_up;
float acceleration_xcurrent_down;
float acceleration_ycurrent_down;
float acceleration_xcurrent_left;
float acceleration_ycurrent_left;
float acceleration_xcurrent_right;
float acceleration_ycurrent_right;
;

//translation variables
float tr_x=0;
float tr_y=0;
float tr_z=0;

//controls
boolean key_up=false;
boolean key_down=false;
boolean key_right=false;
boolean key_left=false;
//translation keys
boolean key_tr_up=false;
boolean key_tr_down=false;
boolean key_tr_right=false;
boolean key_tr_left=false;
boolean key_3D_up=false;
boolean key_3D_down=false;

//images
PImage img;
PImage bg;
PImage bg2;

//sounds
SoundFile sample;
Amplitude rms;
FFT fft;
float smoothingFactor = 0.2;
int bands = 128;
int scale = 5;
float sum;
float[] sum2 = new float[bands];

//supershape
float n1 = 0.3;
float n2 = 0.3;
float n3 = 0.3;
float m = 0;
float a = 1;
float b = 1;
float osc = 0;  
float radius=0;



void setup() {
  smooth();
  //sound analysis & all that
  sample = new SoundFile(this, "dearkatara.aiff");
  sample.loop();

  // Create and patch the rms tracker
  rms = new Amplitude(this);
  rms.input(sample);
  fft = new FFT(this, bands);
  fft.input(sample);
  size(1200, 800, P3D);
  textureMode(NORMAL);
  shapeMode(CORNER);
  appa = new Bison();
  //appa
  appaModel = loadShape("appa_source.obj");
  appaModel.scale(80);

  //ARDUINO
  // List all the available serial ports
  // if using Processing 2.1 or later, use Serial.printArray()
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
  //terrain
  cols = w*2 / scl;
  rows = h*2 / scl;
  terrain = new float[cols][rows];
  img = loadImage("texture12.jpg");
  bg = loadImage("bg3.png");
  bg2 = createImage(bg.width, bg.height, RGB);
  //bg.resize(width, height);
  // Since we are going to access the image's pixels too  

  /*for (int y = 0; y < height; y++) {
   for (int x = 0; x < width; x++) {
   int loc = x + y*width;
   
   // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
   float r = red(bg.pixels[loc]);
   float g = green(bg.pixels[loc]);
   float b = blue(bg.pixels[loc]);
   
   // Image Processing would go here
   // If we were to change the RGB values, we would do it here, 
   // before setting the pixel in the display window.
   
   // Set the display pixel to the image pixel
   bg2.pixels[loc] =  color(r,g,b)/2;          
   }
   }*/
}


void draw() {
  light_mapped2=map(light_value, 0, 1023, 0, 1);
  light_mapped=map(light_value, 0, 1023, -1, 1);
  prev=lerp(prev, light_mapped, 0.05);
  prev2=lerp(prev2,light_mapped2,0.05);
  bg2.loadPixels();
  //lights
  for (int x = 0; x < bg.width; x++) {
    for (int y = 0; y < bg.height; y++ ) {
      // Calculate the 1D pixel location
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r = red   (bg.pixels[loc]);
      float g = green (bg.pixels[loc]);
      float b = blue  (bg.pixels[loc]);
      // Change brightness according to the mouse here
      float adjustBrightness = (prev2) * 4;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;
      // Constrain RGB to between 0-255
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      bg2.pixels[loc] = c;
    }
  }
  bg2.updatePixels();

  
  
  smooth();
  checkKeys();

  yoff = flying_y;
  for (int y = 0; y < rows; y++) {
    xoff = flying_x;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -25, 25);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  background(bg2);
  //lights();
  pushMatrix();
  translate(width/2, height/2+50);
  //float fov= map(mouseX, 0, width, 0, PI);
  //perspective(fov, width/height, cameraZ/10, cameraZ*10);
  rotateX(0.76+angle_x);
  rotateZ(angle_z-2.27);
  translate(-w/2, -h/2);
  strokeWeight(10);
  stroke(0);
  //pointLight(255,0,0, dx, dy,0);
  drawAxes(10000);
  noStroke();
  noFill();
  directionalLight(255, 255, 255, prev, -1, -exp(prev)/2);
  //the terrain
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    texture(img);
    for (int x = 0; x < cols; x++) {
      int textureX;
      int textureY;
      if (x%2==0) {
        textureX=0;
        textureY=1;
      } else {
        textureY=0;
        textureX=1;
      }
      vertex(x*scl, y*scl, terrain[x][y], textureX, textureX);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1], textureX, textureY);
    }
    endShape();
  }
  popMatrix();
  noFill();
  visualize();
  appa.display();
}
