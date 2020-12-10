void keyPressed() {
  if (keyCode==UP) {
    key_up = true;
  }
  if (keyCode==DOWN) {
    key_down = true;
  }
  if (keyCode==RIGHT) {
    key_right = true;
  } else if (keyCode==LEFT) {
    key_left = true;
  }
  if (key=='z') {
    key_tr_up = true;
  }
  if (key=='s') {
    key_tr_down = true;
  }
  if (key=='d') {
    key_tr_right = true;
  }
  if (key=='q') {
    key_tr_left = true;
  }
  if (key=='r') {
    key_3D_up = true;
  }
  if (key=='f') {
    key_3D_down = true;
  }
}

void keyReleased() {
  if (keyCode==UP) {
    key_up = false;
  }
  if (keyCode==DOWN) {
    key_down = false;
  }
  if (keyCode==RIGHT) {
    key_right = false;
  }
  if (keyCode==LEFT) {
    key_left = false;
  }

  //translation keys
  if (key=='z') {
    key_tr_up = false;
  }
  if (key=='s') {
    key_tr_down = false;
  }
  if (key=='d') {
    key_tr_right = false;
  }
  if (key=='q') {
    key_tr_left = false;
  }
}

void checkKeys() {
  if (key_up==true) {
    //flying_y-=0.1;
    if (angle_x<0.17*PI) {
      angle_x+=angle_increment;
    }
    if (angleX<0.3*PI) {
      angleX-=PI/240;
    }
  }
  if (key_down==true) {
    //flying_y+=0.1;
    if (angle_x>0) {
      angle_x-=angle_increment;
    }
    if (angleX>-0.3*PI) {
      angleX+=PI/240;
    }
  }
  else if (!key_up && !key_down) {
    if (angleX<0) {
      angleX+=PI/240;
    } else if (angleX>0) {
      angleX-=PI/240;
    }
  }
  if (key_right==true) {
    //flying_x+=0.1;
    if (angle_z>-PI/8) {
      angle_z-=angle_increment;
      if (angleZ<PI/3) {
        angleZ+=PI/240;
      }
    }
  }
  if (key_left==true) {
    //flying_x-=0.1;
    if (angle_z<PI/16) {
      angle_z+=angle_increment;
      if (angleZ>-PI/3) {
        angleZ-=PI/240;
      }
    }
  }
  else if (!key_left && !key_right) {
    if (angleZ<0) {
      angleZ+=PI/240;
    } else if (angleZ>0) {
      angleZ-=PI/240;
    }
  }

  acceleration_xmax=0.1*cos(-2.27+angle_z);
  acceleration_ymax=0.1*sin(-2.27+angle_z);
  //translation
  if (key_tr_right==true) {
    //flying_x+=0.1;
    acceleration_xcurrent_right=acceleration_xmax;
    acceleration_ycurrent_right=-acceleration_ymax;
    if (angleY>-PI/6) {
      angleY-=PI/240;
    }
  }
  if (key_tr_left==true) {
    //flying_x-=0.1;
    acceleration_xcurrent_left=-acceleration_xmax;
    acceleration_ycurrent_left=acceleration_ymax;
    if (angleY<PI/6) {
      angleY+=PI/240;
    }
  }
  if (!key_tr_left && !key_tr_right) {
    if (angleY<0) {
      angleY+=PI/240;
    } else if (angleY>0) {
      angleY-=PI/240;
    }
  }
  if (key_tr_up==true) {
    //flying_x+=0.1;
    acceleration_xcurrent_up=-acceleration_ymax;
    acceleration_ycurrent_up=-acceleration_xmax;
  }
  if (key_tr_down==true) {
    //flying_x-=0.1;
    acceleration_xcurrent_down=acceleration_ymax;
    acceleration_ycurrent_down=acceleration_xmax;
  }

  //fading speed
  /*if (!key_tr_down && !key_tr_up && !key_tr_right && !key_tr_left) {
   acceleration_xcurrent=0.8*acceleration_xcurrent;
   acceleration_ycurrent=0.8*acceleration_ycurrent;
   }*/
  if (!key_tr_down) {
    acceleration_xcurrent_down=acceleration_xcurrent_down*0.8;
    acceleration_ycurrent_down=acceleration_ycurrent_down*0.8;
  }
  if (!key_tr_up) {
    acceleration_xcurrent_up=acceleration_xcurrent_up*0.8;
    acceleration_ycurrent_up=acceleration_ycurrent_up*0.8;
  }
  if (!key_tr_right) {
    acceleration_xcurrent_right=acceleration_xcurrent_right*0.8;
    acceleration_ycurrent_right=acceleration_ycurrent_right*0.8;
  }
  if (!key_tr_left) {
    acceleration_xcurrent_left=acceleration_xcurrent_left*0.8;
    acceleration_ycurrent_left=acceleration_ycurrent_left*0.8;
  }

  acceleration_xcurrent=acceleration_xcurrent_up+acceleration_xcurrent_down+acceleration_xcurrent_right+acceleration_xcurrent_left;
  acceleration_ycurrent=acceleration_ycurrent_up+acceleration_ycurrent_down+acceleration_ycurrent_right+acceleration_ycurrent_left;

  flying_x+=acceleration_xcurrent;
  flying_y+=acceleration_ycurrent;
}
