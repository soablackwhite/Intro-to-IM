class collectible { 
  PVector tilt = new PVector(0,0,0);
  PVector pos = new PVector(0,0,0);
  PImage texture;

  // The Constructor is defined with arguments.
  collectible(float _x,float _y,float _z) { 
    pos.x=_x;
    pos.y=_y;
    pos.z=_z;
  }

  void display() {
    pushMatrix();    
    translate(width/2, height/2+50);
    rotateX(0.825*PI);
    rotateY(angleZ);
    rotateZ(angleY);
    popMatrix();
    println(angleZ);
  }
}
