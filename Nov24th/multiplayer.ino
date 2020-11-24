const int left_input= A2;
const int right_input= A3;
const int jump_input= A4;
const int special_input= A5;


int left_read; //
int right_read;
int jump_read;
int special_read;
String input;

void setup() {
  // put your setup code here, to run once:
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  pinMode(A5, INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  left_read = analogRead(A2);
  right_read = analogRead(A3);
  jump_read = analogRead(A4);
  special_read = analogRead(A5);
  
  input = String(left_read) + "," + String(right_read) + "," + String(jump_read) + "," + String(special_read);
  Serial.println(input);
}
