

void serialEvent(Serial myPort) {
    // get the ASCII string:
    String inString = myPort.readStringUntil('\n');
    if (inString != null) {
      // trim off any whitespace:
      inString = trim(inString);
      // split the string on the commas and convert the resulting substrings
      // into an integer array:
      int[] arduino_inputs = int(split(inString, ","));
      // if the array has at least three elements, you know you got the whole
      // thing.  Put the numbers in the color variables:
      if (arduino_inputs.length >=1) {
        light_value = arduino_inputs[0];
        potentio_value = arduino_inputs[1];
      }
    }
  }
