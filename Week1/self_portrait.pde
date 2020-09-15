//settings
float headX=250;
float headY=280;
size(500,500);

//neck
noStroke();
fill(236, 188, 180);
rect(headX-40,headY+100,80,100);

//body
fill(255);
rect(headX-140,headY+180,280,100,100,100,0,0);
fill(236, 188, 180);
arc(headX, headY+180, 125, 50, radians(0), radians(180), OPEN);

//necklace
noFill();
stroke(124,87,61);
strokeWeight(4);
arc(headX, headY+180, 90, 150, radians(0), radians(180), OPEN);

//beanie
noStroke();
//yellow
fill(220,220,20);
ellipse(headX, headY-90, 270, 375);
//red
fill(220,20,20);
ellipse(headX, headY-90, 319, 360);
//blue
fill(20,20,220);
ellipse(headX, headY-85, 319, 360);
//green
fill(20,220,20);
ellipse(headX, headY-80, 315, 355);
//yellow
fill(220,220,20);
ellipse(headX, headY-70, 319, 350);
//red
fill(220,20,20);
ellipse(headX, headY-60, 320, 340);

//head
noStroke();
fill(236, 188, 180);
ellipse(headX, headY, 300, 300);

//eyes
stroke(0);
strokeWeight(2);
fill(255);
ellipse(4*headX/5, 6*headY/7, 55, 60);
ellipse(6*headX/5, 6*headY/7, 55, 60);

//pupils
noStroke();
fill(0);
ellipse(4*headX/5, 6*headY/7, 20, 25);
ellipse(6*headX/5, 6*headY/7, 20, 25);

//eyebrows
stroke(0);
strokeWeight(10);
line(4*headX/5-30, 6*headY/7-40, 4*headX/5+30, 6*headY/7-37);
line(6*headX/5-30, 6*headY/7-37, 6*headX/5+30, 6*headY/7-40);


strokeWeight(3);
//glasses
stroke(0);
noFill();
rect(4*headX/5-35, 6*headY/7-30, 70, 60, 3, 3, 18, 18);
rect(6*headX/5-35, 6*headY/7-30, 70, 60, 3, 3, 18, 18);
line(4*headX/5-35+70, 6*headY/7, 6*headX/5-35, 6*headY/7);

//smile
curve(headX-30, 200, headX-30, headY+70, headX+30, headY+70, headX+30, 200);

//beard
for (int i = 0; i<width; i+=3){
  for (int j=0; j<height; j+=3){
    if (dist(i,j, headX, headY)<150 && dist(i,j, headX, 1.70*headY)<150){
      strokeWeight(1);
      point(i,j);
    }
  }
}
