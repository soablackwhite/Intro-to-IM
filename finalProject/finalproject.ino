const int photo_input= A2;
const int potentio_input= A5;


int light_value; //
int potentio_value;
String input;

void setup() {
  // put your setup code here, to run once:
  pinMode(A2, INPUT);
  pinMode(A5, INPUT);
  Serial.begin(9600);
}

void loop() {
  delay(150);
  // put your main code here, to run repeatedly:
  light_value = analogRead(A2);
  potentio_value = analogRead(A5);
  
  input = String(light_value) + "," + String(potentio_value);
  Serial.println(input);
}
