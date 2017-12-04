/*This is a simple project to make LED Dice.*/


//Defining LED Pins
int ledPins[7] = {2, 3, 4, 5, 6, 7, 8};
int dicePatterns[7][7] = {
  {0, 0, 0, 0, 0, 0, 1}, // 1
  {0, 0, 1, 1, 0, 0, 0}, // 2
  {0, 0, 1, 1, 0, 0, 1}, // 3
  {1, 0, 1, 1, 0, 1, 0}, // 4
  {1, 0, 1, 1, 0, 1, 1}, // 5
  {1, 1, 1, 1, 1, 1, 0}, // 6
  {0, 0, 0, 0, 0, 0, 0} // BLANK
};

int switchPin = 9;   //Defining button pin
int blank = 6;    

void setup();
void loop();
void rollTheDice();
void show(int result);


void setup(){
  for (int i = 0; i < 7; i++){
    pinMode(ledPins[i], OUTPUT);
    digitalWrite(ledPins[i], LOW);
  }
  randomSeed(analogRead(0));
}

void loop(){
  if(digitalRead(switchPin)){
    rollTheDice();
  }
  delay(100);
}

void rollTheDice(){
  int result = 0;
  int lengthOfRoll = random(15, 25);
  for (int i = 0; i < lengthOfRoll; i++){
    result = random(0, 6); // result will be 0 to 5 not 1 to 6
    show(result);
    delay(50 + i * 10);
  }
  for (int j = 0; j < 3; j++){
    show(blank);
    delay(500);
    show(result);
    delay(500);
  }
}

void show(int result){
  for (int i = 0; i < 7; i++){
    digitalWrite(ledPins[i], dicePatterns[result][i]);
  }
}
