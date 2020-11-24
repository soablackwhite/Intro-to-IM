//serial stuff
import processing.serial.*;
Serial myPort;

//inputs
boolean left_input;
boolean right_input;
boolean down_input;
boolean up_input;

void serialEvent(Serial myPort) {
    // get the ASCII string:
    String inString = myPort.readStringUntil('\n');
    if (inString != null) {
      // trim off any whitespace:
      inString = trim(inString);
      // split the string on the commas and convert the resulting substrings
      // into an integer array:
      int[] controls = int(split(inString, ","));
      // if the array has at least three elements, you know you got the whole
      // thing.  Put the numbers in the color variables:
      if (controls.length >= 4) {
        if (controls[0]>500){       //left button
          left_input=true;
        } else {
          left_input=false;
        }
        if (controls[1]>500){    //right button
          right_input=true;
        } else {
          right_input=false;
        }
        if (controls[2]>500){    //jump button
          down_input=true;
        } else {
          down_input=false;
        }
        if (controls[3]>500){    //special button
          up_input=true;
        } else {
          up_input=false;
        }
      }
    }
  }
