import peasy.*;
PeasyCam cam;

// A Table object
Table table;
//P Vector for sphere coordinates & data points
PVector[][] globe;
PVector[]data;

//variables that we're gonna change
int detail = 75;
float offset = 0;
float m1 = 0;
float m2 = 0;
float n1=0.3;
float n2=0.3;
float n3=0.3;

int currentRow=1; // index to navigate between items in the dataset

// data variables
String title = "";
int episodes = 0;
float score = 0;
float rating = 0;
float complexity = 0;

//changeRate of variables
float mchange = 0;
float n1change = 0;
float n2change = 0;

//variables that we're not gonna change, here for squeezing horizontally or vertically
float a = 1;
float b = 1;


//function to load our data
void loadData() {
  table = loadTable("animeDataFiltered.csv", "header");
  //determining current row
  TableRow row = table.getRow(currentRow);
  //getting data from the current row
  title = row.getString("series_title");
  episodes = row.getInt("series_episodes");
  score = row.getFloat("my_score");
  rating = row.getFloat("rating");
  complexity = row.getFloat("complexity");
}


void setup() {
  loadData();
  size(1200, 800, P3D);
  cam = new PeasyCam(this, 500);
  globe = new PVector[detail+1][detail+1];
}

//creating the supershape radius based on
float supershape(float theta, float m, float n1, float n2, float n3) {
  float t1 = abs((1/a)*cos(m * theta / 4));
  t1 = pow(t1, n2);
  float t2 = abs((1/b)*sin(m * theta/4));
  t2 = pow(t2, n3);
  float t3 = t1 + t2;
  float r = pow(t3, - 1 / n1);
  return r;
}

void draw() {
  m1 = map(float(title.length()),0,30,-40,40);
  m2 = map(1/(complexity+1), 0, 1, -40, 40);
  n1 = map(log(episodes), 1, 100, -40, 40);
  n2 = map(1/(rating+1), 0, 1, -20, 20);
  n3 = map(score, 0, 10, -40, 40);
  
  print(detail);
  background(0);
  lights();

  float r = 50;
  for (int i = 0; i < detail+1; i++) {
    float lat = map(i, 0, detail, -HALF_PI, HALF_PI);
    float r2 = supershape(lat, m2, n1, n2, n3);
    //float r2 = supershape(lat, 2, 10, 10, 10);
    for (int j = 0; j < detail+1; j++) {
      float lon = map(j, 0, detail, -PI, PI);
      float r1 = supershape(lon, m1, n1, n2, n3);
      //float r1 = supershape(lon, 8, 60, 100, 30);
      float x = r * r1 * cos(lon) * r2 * cos(lat);
      float y = r * r1 * sin(lon) * r2 * cos(lat);
      float z = r * r2 * sin(lat);
      globe[i][j] = new PVector(x, y, z);
    } 
  }

  //stroke(255);
  //fill(255);
  //noFill();
  stroke(255);
  fill(255);
  for (int i = 0; i < detail; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < detail+1; j++) {
      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
  stroke(255,0,0);
  fill(235,110,101);
  textSize(32);
  textAlign(CENTER,CENTER);
  text(title, 0, -200, 0);
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == RIGHT && currentRow < table.getRowCount()+1 ){
      currentRow++;
      loadData();
    }
    else if (keyCode == LEFT && currentRow > 0){
      currentRow--;
      loadData();
    }
  }
}
