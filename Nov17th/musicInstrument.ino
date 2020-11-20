#include "pitches.h"
#include "Keyboard.h"

char input;
//inputs
int potentio = A1;
int pushButton = A2;
int pushButton2 = A3;
int pushButton3 = A4;
int pushButton4 = A5;

//notes
int note1[]={NOTE_D3, NOTE_G3, NOTE_B2,  NOTE_A2 };
int note2[]={NOTE_D4, NOTE_F3, NOTE_AS2,  NOTE_E4};
int note3[]={NOTE_A3, NOTE_C3, NOTE_GS3,  NOTE_F4};

int durations1[] = {16, 12, 8, 16};
int durations2[] = {16, 8, 8, 12};
int durations3[] = {8, 16, 8, 8};
int index=0;

//output
int buzzer = 8;

//variables
int TEMPO = 1200;

/* int melody[] = {
  NOTE_D3, NOTE_D3, NOTE_D4, NOTE_A3, 0, NOTE_GS3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_F3, NOTE_G3, NOTE_C3, NOTE_C3, NOTE_D4, NOTE_A3, 0, NOTE_GS3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_F3, NOTE_G3, NOTE_B2, NOTE_B2,
};*/

/*int noteDurations[] = {
  16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16,
};*/

int melody[] = {
  NOTE_D3, NOTE_D3, NOTE_D4, NOTE_A3, 0, NOTE_GS3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_F3, NOTE_G3, NOTE_C3, NOTE_C3, NOTE_D4, NOTE_A3, 0, NOTE_GS3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_F3, NOTE_G3, NOTE_B2, NOTE_B2, NOTE_D4, NOTE_A3, 0, NOTE_GS3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_F3, NOTE_G3, NOTE_AS2, NOTE_AS2, NOTE_D4, NOTE_A3, 0, NOTE_GS3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_F3, NOTE_G3, NOTE_D3, NOTE_D3, NOTE_D4, NOTE_A3, 0, NOTE_GS3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_F3, NOTE_G3, NOTE_C3, NOTE_C3, NOTE_D4, NOTE_A3, 0, NOTE_GS3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_F3, NOTE_G3, NOTE_B2, NOTE_B2, NOTE_D4, NOTE_A3, 0, NOTE_GS3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_F3, NOTE_G3, NOTE_AS2, NOTE_AS2, NOTE_D4, NOTE_A3, 0, NOTE_GS3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_F3, NOTE_G3, NOTE_D4, NOTE_D4, NOTE_D5, NOTE_A4, 0, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, NOTE_C4, NOTE_C4, NOTE_D5, NOTE_A4, 0, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, NOTE_B3, NOTE_B3, NOTE_D5, NOTE_A4, 0, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, NOTE_AS3, NOTE_AS3, NOTE_D5, NOTE_A4, 0, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, NOTE_D4, NOTE_D4, NOTE_D5, NOTE_A4, 0, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, NOTE_C4, NOTE_C4, NOTE_D5, NOTE_A4, 0, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, NOTE_B3, NOTE_B3, NOTE_D5, NOTE_A4, 0, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, NOTE_AS3, NOTE_AS3, NOTE_D5, NOTE_A4, 0, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_G4, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, 0, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_G4, NOTE_GS4, NOTE_A4, NOTE_C5, NOTE_A4, NOTE_D5, NOTE_D5, NOTE_D5, NOTE_A4, NOTE_D5, NOTE_C5, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_E4, NOTE_D4, NOTE_C4, 0, NOTE_G4, NOTE_E4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_F3, NOTE_G3, NOTE_AS3, NOTE_C4, NOTE_D4, NOTE_F4, NOTE_C5, 0, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_GS4, NOTE_A4, NOTE_C5, NOTE_A4, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_E4, NOTE_F4, NOTE_G4, NOTE_A4, NOTE_C5, NOTE_CS5, NOTE_GS4, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_G4, NOTE_F3, NOTE_G3, NOTE_A3, NOTE_F4, NOTE_E4, NOTE_D4, NOTE_E4, NOTE_F4, NOTE_G4, NOTE_E4, NOTE_A4, NOTE_A4, NOTE_G4, NOTE_F4, NOTE_DS4, NOTE_CS4, NOTE_DS4, 0, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_G4, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_F4, NOTE_F4, NOTE_F4, NOTE_GS4, NOTE_A4, NOTE_C5, NOTE_A4, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_D4, NOTE_E4, NOTE_F4, NOTE_G4, NOTE_A4, NOTE_C5, NOTE_CS5, NOTE_GS4, NOTE_GS4, NOTE_G4, NOTE_F4, NOTE_G4, NOTE_F3, NOTE_G3, NOTE_A3, NOTE_F4, NOTE_E4, NOTE_D4, NOTE_E4, NOTE_F4, NOTE_G4, NOTE_E4, NOTE_A4, NOTE_A4, NOTE_G4, NOTE_F4, NOTE_DS4, NOTE_CS4, NOTE_DS4, 
};

int noteDurations[] = {
  16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 16, 16, 8, 6, 32, 8, 8, 8, 16, 16, 16, 8, 16, 8, 8, 8, 8, 4, 16, 8, 16, 8, 8, 8, 16, 16, 16, 16, 16, 8, 8, 16, 8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 16, 2, 8, 16, 8, 8, 8, 8, 4, 16, 8, 16, 8, 8, 8, 8, 8, 16, 8, 16, 8, 8, 8, 8, 8, 8, 8, 16, 8, 15, 8, 8, 2, 3, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 8, 2, 16, 8, 16, 8, 16, 16, 16, 16, 16, 16, 8, 8, 8, 8,  8, 8, 16, 16, 16, 2, 8, 8, 8, 8, 4, 4, 4, 4, 4, 4, 2, 8, 8, 8, 8, 2, 2, 3, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 8, 2, 16, 8, 16, 8, 16, 16, 16, 16, 16, 16, 8, 8, 8, 8,  8, 8, 16, 16, 16, 2, 8, 8, 8, 8, 4, 4, 4, 4, 4, 4, 2, 8, 8, 8, 8, 2, 1
};



// the setup routine runs once when you press reset:
void setup() {
  //Keyboard.begin();
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // make the pushbutton's pin an input:
  pinMode(pushButton, INPUT);
  pinMode(pushButton2, INPUT);
  pinMode(pushButton3, INPUT);
  pinMode(pushButton4, INPUT);
  pinMode(potentio, INPUT);
}

// the loop routine runs over and over again forever:
void loop() {

  // read the input pin:
  int buttonState = digitalRead(pushButton);
  int button2State = digitalRead(pushButton2);
  int button3State = digitalRead(pushButton3);
  int button4State = digitalRead(pushButton4);
  int potentioState = analogRead(potentio);
  TEMPO = map(potentioState, 0, 1023, 800, 3000);


  if (buttonState > 0) {
    tone(buzzer, note1[index], TEMPO / durations1[index]);
  }
  if (button2State > 0) {
    tone(buzzer, note2[index], TEMPO / durations2[index]);
  }
  if (button3State > 0) {
    tone(buzzer, note3[index], TEMPO / durations3[index]);
  }
  if (button4State > 0) {
    index=1;
  } else {
    index=0;
  }

  input = Serial.read();
  Serial.print("You typed: " );
  Serial.print(input);
  if (input>0) {
    int melody_len = sizeof(melody) / sizeof(melody[0]);
    for (int thisNote = 0; thisNote < melody_len; thisNote++) {
      TEMPO = map(potentioState, 0, 1023, 800, 3000);
      int noteDuration = TEMPO / noteDurations[thisNote];
      tone(8, melody[thisNote], noteDuration);
      int pauseBetweenNotes = noteDuration * 1.45;
      delay(pauseBetweenNotes);
      noTone(8);
    }
  }
}
