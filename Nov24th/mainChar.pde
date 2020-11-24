class mainChar { //character class
  PVector pos = new PVector(0, 0); //pos vector
  PVector velocity = new PVector(0, 0); //total velocity vector
  PVector move = new PVector(4, 0); //movement increment vector
  PVector gravity = new PVector(0, 0.25); //low gravity to give player air time to reflect
  PVector jumpForce = new PVector(0, -6);
  PVector push = new PVector(0, 0);
  PVector pull = new PVector(0, 0);

  //character
  int imgIndex=0;
  int jumps=2;
  int dir=1;
  int notGrounded;

  //for animation
  int sprWidth=64;
  int sprHeight=96;
  float frame=0; //current animation frame

  //hitbox
  int wBox=30;
  int hBox= 50;
  float nextY; //the character's next position
  float nextX; //the character's next position
  float signY;
  float moveType=0;

  //controls & flooring
  boolean jump = false;
  boolean right = false;
  boolean left = false;
  boolean grounded = false; //for animation phases
  boolean pushing = false;
  boolean pulling = false;
  boolean special = false;

  //debug
  float origX;
  float origY;

  PImage charImg; //character image
  PVector reference; //this is the vector we will use to determine the angle between mouse and the gravitation center of the characer

  mainChar(float x, float y) {
    pos.x=x;
    pos.y=y;
    image(sprites[imgIndex], pos.x, pos.y); //print image
    origY=y;
    origX=x;
  }






  // MOVEMENT BLOCK OF CODE



  void update() {
    notGrounded=0;
    //controls
    if (right==true) {
      velocity.x=move.x;
      dir=1;
      if (grounded) {
        if (!walkSound.isPlaying()) {
          walkSound.play(0.6, 0.35);
        }
      } else {
        walkSound.stop();
      }
    } else if (left==true) {
      velocity.x=-move.x;
      dir=-1;
      if (grounded) {
        if (!walkSound.isPlaying()) {
          walkSound.play(0.6, 0.35);
        }
      } else {
        walkSound.stop();
      }
    } else {
      velocity.x=0;
    }
    if (jump==true) {
      jumps-=1;
      velocity.y=0;
      velocity.add(jumpForce);
      jump=false;
    }

    //gravity
    if (grounded==false) {
      velocity.add(gravity);
    }

    //movement

    if (pulling) {
      velocity.add(pull);
    }

    if (pushing) {
      velocity.add(push);
    }

    collide();
    pos.y+=velocity.y;
    if (moveType==0) { //character actually moves
      pos.x+=velocity.x;
      move.x=2;
    } else if (moveType==1) {
      pos.x+=velocity.x;
      move.x=4;
    } else {
      move.x=3.25; //character stops moving, only objects are moving towards character now to give "side scroller" effect
    }
  }


  void collide() {
    notGrounded=0;
    //horizontal collisions  
    for (int i=0; i<blocks.length; i++) {
      if (pos.x-wBox/2+2*velocity.x<=blocks[i].pos.x+blocks[i].sprWidth && pos.x+2*velocity.x+wBox/2 >= blocks[i].pos.x && pos.y-0.1+hBox/2>=blocks[i].pos.y && pos.y-0.1-hBox/2<=blocks[i].pos.y+blocks[i].sprHeight) {
        velocity.x=0;
      }
    }

    //vertical collisions
    for (int i=0; i<blocks.length; i++) {
      if (pos.x+velocity.x-wBox/2<=blocks[i].pos.x+blocks[i].sprWidth && pos.x+velocity.x+wBox/2 >= blocks[i].pos.x && pos.y+velocity.y+hBox/2>=blocks[i].pos.y && pos.y+velocity.y-hBox/2<=blocks[i].pos.y+blocks[i].sprHeight) {
        //ground conditions
        if (pos.y+hBox/2+velocity.y <= blocks[i].pos.y) {
          jumps=2;
          //snapping to the ground
          if (pos.y+velocity.y<=blocks[i].pos.y-hBox/2) {
            pos.y=blocks[i].pos.y-hBox/2;
          }
        }
        if (pos.y+velocity.y>blocks[i].pos.y-hBox/2 && velocity.y>0) {
          pos.y=blocks[i].pos.y-hBox/2;
        }
        velocity.y=0;
      } else {
        notGrounded+=1;
      }
    }
    if (notGrounded==blocks.length) {
      grounded=false;
    } else {
      grounded=true;
    }

    //collision with ennemies
    for (int i=0; i<orbs.length; i++) {
      if (dist(orbs[i].pos.x, orbs[i].pos.y, pos.x+velocity.x, pos.y+velocity.y)<=45) {
        state="lost";
        deathSound.play(1, 0.5);
      }
    }

    //collision with gem
    if (dist(winGem.x, winGem.y, pos.x+velocity.x, pos.y+velocity.y)<=200) {
      state="win";
    }

    for (int i=0; i<orbs.length; i++) {
      if (dist(orbs[i].pos.x, orbs[i].pos.y, pos.x+velocity.x, pos.y+velocity.y)<=45) {
        state="lost";
      }
    }
  }









  void display() {
    //updating image & animating

    if (grounded == false) { //if moving vertically
      if (imgIndex!=2) {
        frame=0;
      }
      imgIndex=2;
      if (velocity.y<0) { //ascending altitude
        if (int(frame+0.2)<sprites[imgIndex].width/sprWidth - 7) {
          frame+=0.2;
        }
      } else if (velocity.y>0) { //descending altitude
        if (int(frame+0.2)<sprites[imgIndex].width/sprWidth-3) {
          frame+=0.2;
        }
      }
    } else if (velocity.x!=0) { //if moving horizontally
      if (imgIndex!=1) {
        frame=0;
      }
      imgIndex=1;
      if (int(frame+0.2)<sprites[imgIndex].width/sprWidth) {
        frame+=0.2;
      } else {
        frame=0;
      }
    } 

    //idle
    else if (grounded==true) {
      frame=0;
      imgIndex=0;
    }

    //drawing the image
    if (pushing || pulling) {
      tint(169, 209, 246);  // Tint blue
    } else {
      noTint();
    }
    if (dir==-1) {
      pushMatrix();
      scale(dir, 1);
      image(sprites[imgIndex].get(int(frame)*sprWidth, 0, sprWidth, sprHeight), -pos.x, pos.y);
      popMatrix();
    } else {
      image(sprites[imgIndex].get(int(frame)*sprWidth, 0, sprWidth, sprHeight), pos.x, pos.y);
    }

    fill(255, 0, 0);
    //ellipse(pos.x, pos.y, 5, 2);
    noFill();
    stroke(255, 0, 0);
    //rect(pos.x-wBox/2, pos.y-hBox/2, wBox, hBox);
  }





  //ALLOMANCY BLOCK OF CODE



  void detect() {

    //create array of distances
    int idx = 0;
    float[] dst = new float[3];

    //registering metal object distances to character
    for (int i=0; i<blocks.length; i++) {
      if (blocks[i].isMetal==true) {
        dst[idx]=dist(blocks[i].pos.x+blocks[i].sprWidth/2, blocks[i].pos.y+blocks[i].sprHeight/2, pos.x, pos.y);
        idx++;
      }
    }

    //identifying the nearest metal object
    if (dist(pos.x, pos.y, myFairy.pos.x, myFairy.pos.y)<min(dst)) {
      myFairy.isNearest=true;
    } else {
      myFairy.isNearest=false;
    }

    for (int i=0; i<blocks.length; i++) {
      if (blocks[i].isMetal==true) {
        if (dist(blocks[i].pos.x+blocks[i].sprWidth/2, blocks[i].pos.y+blocks[i].sprHeight/2, pos.x, pos.y)<=min(dst) && min(dst)<350 && myFairy.isNearest==false) {
          blocks[i].isNearest=true;
        } else {
          blocks[i].isNearest=false;
        }
      }
    }


    //finding the minimum value
    //println(min(dst));
  }

  void steelPush() {
    if (myFairy.isNearest) {
      float angle = atan2(myFairy.pos.y-pos.y, myFairy.pos.x-pos.x); //angle between vector & character
      push.x = -2.4*cos(angle);
      push.y = -0.6*sin(angle);
      pushing=true;
      allomancySound.amp(0.2);
      allomancySound.play(1.5);
    } else {
      for (int i=0; i<blocks.length; i++) {
        if (blocks[i].isNearest) {
          float angle = atan2(blocks[i].pos.y+blocks[i].sprHeight/2-pos.y, blocks[i].pos.x+blocks[i].sprWidth/2-pos.x); //angle between vector & character
          push.x = -2.4*cos(angle);
          push.y = -0.6*sin(angle);
          pushing=true;
          allomancySound.amp(0.2);
          allomancySound.play(1.5);
        }
      }
    }
  }

  void ironPull() {
    if (myFairy.isNearest) {
      float angle = atan2(myFairy.pos.y-pos.y, myFairy.pos.x-pos.x); //angle between vector & character
      pull.x = 2.8*cos(angle);
      pull.y = 0.8*sin(angle);
      pulling=true;
      allomancySound.amp(0.2);
      allomancySound.play(1.5);
    } else {
      for (int i=0; i<blocks.length; i++) {
        if (blocks[i].isNearest) {
          float angle = atan2(blocks[i].pos.y+blocks[i].sprHeight/2-pos.y, blocks[i].pos.x+blocks[i].sprWidth/2-pos.x); //angle between vector & character
          pull.x= 2.4*cos(angle);
          pull.y= 0.6*sin(angle);
          pulling=true;
          allomancySound.amp(0.2);
          allomancySound.play(1.5);
        }
      }
    }
  }

  void floating() {
    if (special==true) {
      gravity.y=0.1;
    } else {
      gravity.y=0.25;
    }
  }
}
