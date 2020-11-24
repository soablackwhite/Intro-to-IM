class firefly { //character class
  PVector pos = new PVector(0, 0); //pos vector
  PVector velocity = new PVector(0, 0); //total velocity vector
  PVector move = new PVector(3, 3); //movement increment vector

  //character
  int imgIndex=0;
  int dir=-1;

  //for animation
  int sprWidth=47;
  int sprHeight=47;
  float frame=0; //current animation frame

  //hitbox
  float nextY; //the character's next position
  float nextX; //the character's next position
  float signY;
  float moveType=0;

  //controls & flooring
  boolean up = false;
  boolean down = false;
  boolean right = false;
  boolean left = false;
  boolean isNearest = false;


  //debug
  float origX;
  float origY;

  PImage charImg; //character image
  PVector reference; //this is the vector we will use to determine the angle between mouse and the gravitation center of the characer

  firefly(float x, float y) {
    pos.x=x;
    pos.y=y;
    image(firefly, pos.x, pos.y); //print image
    origY=y;
    origX=x;
  }




  // MOVEMENT BLOCK OF CODE



  void update() {
    pos.x-=Vin.velocity.x;

    if (right_input) {
      velocity.x=move.x;
      dir=-1;
    } else if (left_input) {
      velocity.x=-move.x;
      dir=1;
    } else {
      velocity.x=0;
    }

    if (down_input) {
      velocity.y=-move.y;
    } else if (up_input) {
      velocity.y=move.y;
    } else {
      velocity.y=0;
    }

    pos.add(velocity);
  }


  void display() {
    noTint();
    if (isNearest && (Vin.pushing||Vin.pulling)) {
      tint(169, 209, 246);
    } 
    //updating image & animating
    if (velocity.mag()>0) {
      if (int(frame+0.2)<firefly.width/sprWidth) {
        frame+=0.2;
      } else {
        frame=0;
      }
    } else {
      frame=0;
    }


    if (dir==-1) {
      pushMatrix();
      scale(dir, 1);
      image(firefly.get(int(frame)*sprWidth, 0, sprWidth, sprHeight), -pos.x, pos.y);
      popMatrix();
    } else {
      image(firefly.get(int(frame)*sprWidth, 0, sprWidth, sprHeight), pos.x, pos.y);
    }
    noTint();
  }
}
