//pins
const int btn1 = A4;
const int btn2 = A5;
const int enemy1 = 10;
const int enemy2 = 9;
const int rgb_pin_red = 5;
const int rgb_pin_blue = 6;
const int rgb_pin_green = 3;

//variables enemy
int hp1 = 50;
int hp2 = 50;
int counter = 0;

//variables player
int atk1 = 0; //attack button
int atk2 = 0; //attack button
int hp_red = 0; //will light up player is has lower health points
int hp_blue = 200; //will light up if player has higher health points
int hp_green = 0; //will only use for winning animation


//boolean
bool clicked1 = false;
bool clicked2 = false;
bool over = false; //variable for game over when the player wins

void setup() {
  Serial.begin(9600);
  // put your setup code here, to run once:
  pinMode(atk1, INPUT);
  pinMode(atk2, INPUT);
  pinMode(enemy1, OUTPUT);
  pinMode(enemy2, OUTPUT);
  pinMode(rgb_pin_red, OUTPUT);
  pinMode(rgb_pin_blue, OUTPUT);
  pinMode(rgb_pin_green, OUTPUT);
}

void loop() {
  // reading
  atk1 = digitalRead(btn1);
  atk2 = digitalRead(btn2);

  //player attack right
  if (atk1 > 0 && clicked1 == false && !over) {
    clicked1 = true;
    if (hp1 > 0) {
      hp1 -= 5;
    }
  } else if (atk1 < 1) {
    clicked1 = false;
  }
  //player attack left
  if (atk2 > 0 && clicked2 == false && !over) {
    clicked2 = true;
    if (hp2 > 0) {
      hp2 -= 5;
    }
  } else if (atk2 < 1) {
    clicked2 = false;
  }

  //enemy attack
  if (counter >= 10) {
    if (hp_blue > 0 & !over) {
      counter = 0;
      hp_blue--;
      hp_red++;
    } else if (hp_blue <= 0) { //losing condition
      hp_red = 255;
      over = true;
    }
  } else {
    counter ++;
  }

  //winning condition
  if (hp1 <= 0 && hp2 <= 0) {
    over = true;
    hp_red = random(90);
    hp_green = random(90);
    hp_blue = random(90);
    RGB_COLOR(hp_red, hp_green, hp_blue);
    delay(100);
  }

  if (over) {
    if (atk1 > 0 && atk2 > 0) {
      RESET();
    }
  }

  //update stats
  analogWrite(enemy1, hp1);
  analogWrite(enemy2, hp2);
  RGB_COLOR(hp_red, hp_green, hp_blue); //player health points

  //debug
  Serial.println(over);
}

void RGB_COLOR(int r, int g, int b)
{
  analogWrite(rgb_pin_red, r);
  analogWrite(rgb_pin_green, g);
  analogWrite(rgb_pin_blue, b);
}

void RESET()
{
  over = false;
  hp_blue = 200;
  hp_red = 0;
  hp_green = 0;
  hp1 = 50;
  hp2 = 50;
}
