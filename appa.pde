class Bison { 
  PVector tilt = new PVector(0,0,0);
  PVector pos = new PVector(width/2,height/2,0);

  // The Constructor is defined with arguments.
  Bison() { 
    
  }

  void display() {
    pushMatrix();    
    translate(width/2, height/2+100,200);
    rotateX(0.825*PI+angleX);
    rotateY(angleZ);
    rotateZ(angleY);
    shape(appaModel,0,50);
    popMatrix();
    println(potentio_value);
  }
}
