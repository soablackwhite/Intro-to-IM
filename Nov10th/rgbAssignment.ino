//output pins
const int red_light_pin= 11;
const int green_light_pin = 10;
const int blue_light_pin = 9;
const int digital_pin = 13;

//input pins
const int sensor_pin = A2; //photo resistor
const int red_switch = A3;
const int green_switch = A4;
const int blue_switch = A5;

//VARIABLES

//photosensor
int minSensor=1023;
int maxSensor=0;
int sensorValue=0;

//switches
int redSwitch=0;
int greenSwitch=0;
int blueSwitch=0;

//color values
int redValue=0;
int greenValue=0;
int blueValue=0;

//booleans
bool adjust=true;

void setup() {
  //inputs
  pinMode(sensor_pin, INPUT);
  pinMode(red_switch, INPUT);
  pinMode(green_switch, INPUT);
  pinMode(blue_switch, INPUT);

  //outputs
  pinMode(digital_pin, OUTPUT);
  pinMode(red_light_pin, OUTPUT);
  pinMode(green_light_pin, OUTPUT);
  pinMode(blue_light_pin, OUTPUT);

  //serial
  Serial.begin(9600);
}


void loop() {
  //current to the light sensor
  digitalWrite(digital_pin, 500);
  
  //reading
  redSwitch=digitalRead(red_switch);
  greenSwitch=digitalRead(green_switch);
  blueSwitch=digitalRead(blue_switch);
  sensorValue= analogRead(sensor_pin);

  //adjusting minimum & maximum values
  if(adjust){
    if (sensorValue>maxSensor){ //adjusting max value
      maxSensor=sensorValue;
    }  
    if (sensorValue<minSensor){ //adjusting min value
      minSensor=sensorValue;
    }
  }
  
  //writing
  if (redSwitch>0){
    redValue=map(sensorValue, minSensor, maxSensor, 0, 255);
  }
  if (greenSwitch>0){
    greenValue=map(sensorValue, minSensor, maxSensor, 0, 255);
  }
  if (blueSwitch>0){
    blueValue=map(sensorValue, minSensor, maxSensor, 0, 255); 
  }

  //checking if ANY switch was pressed
  if (blueSwitch+greenSwitch+redSwitch!=0){
    adjust=false;
  }
  
  RGB_COLOR(redValue, greenValue, blueValue); // adjust color
  Serial.println(minSensor);
  Serial.print(maxSensor);

}


//functions
void RGB_COLOR(int red_light_value, int green_light_value, int blue_light_value)
 {
  analogWrite(red_light_pin, red_light_value);
  analogWrite(green_light_pin, green_light_value);
  analogWrite(blue_light_pin, blue_light_value);
 }
