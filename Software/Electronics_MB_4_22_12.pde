/**********************************
 * Resica Falls Scout Reservation *
 * Electronics Merit Badge Kit    *
 *                                *
 * - Electronic Candle            *
 * - Tent Light                   *
 * - Flash Light                  *
 *                                *
 * CodeVer: 7-14-14               *
 *                                *
 *********************************/

// Set a constant name for each pin.
int const LED1 = 0;    // Yellow LED 1
int const LED2 = 1;    // Yellow LED 2
int const LED3 = 2;    // White LED
int const potPin = 3;  // Pin to get reading from potentiometer.


void setup() { // Everyting in here will be run only once each time the microcontroller is powered on.

  pinMode(LED1, OUTPUT);   // Set pin the LED1 is connected to as an output.
  pinMode(LED2, OUTPUT);   // Set pin the LED2 is connected to as an output.
  pinMode(LED3, OUTPUT);   // Set pin the LED3 is connected to as an output.

  pinMode(potPin, INPUT);  // Set pin that the potentiometer is connected to as an input.

  // Brief initialization sequence.  Flash each LED to check for assembly errors.
  digitalWrite(LED1, HIGH);
  delay(500);
  digitalWrite(LED1, LOW);
  delay(500);
  digitalWrite(LED2, HIGH);
  delay(500);
  digitalWrite(LED2, LOW);
  delay(500);
  digitalWrite(LED3, HIGH);
  delay(500);
  digitalWrite(LED3, LOW);
  delay(500);
  digitalWrite(LED1, HIGH);
  digitalWrite(LED2, HIGH);
  digitalWrite(LED3, HIGH);
  delay(1000);
  digitalWrite(LED1, LOW);
  digitalWrite(LED2, LOW);
  digitalWrite(LED3, LOW);
} // END Setup


void loop() { // Everything in here will be run over and over once setup is complete.

 int potValue = (analogRead(potPin) / 4);      // Get value from potentiometer to determine what to do.

 if (potValue < 5) {                           // If potentiometer is turned all the way down:
   digitalWrite(LED3, LOW);                    // Turn off White LED.
   flickerLED();                               // Flicker the Yellow LEDs

 } else if (potValue > 5 && potValue < 250) {  // If potentiometer is somewhere in the middle:
     digitalWrite(LED3, LOW);                  // Turn off White LED.
     analogWrite(LED1, potValue);              // Set Yellow LED1 to brightness value read from potentiometer.
     analogWrite(LED2, potValue);              // Set Yellow LED2 to brightness value read from potentiometer.

 } else if (potValue > 250) {                  // If potentiometer is turned all the way up:
     digitalWrite(LED3, HIGH);                 // Turn on the white LED.
     digitalWrite(LED1, LOW);                  // Turn off Yellow LED1
     digitalWrite(LED2, LOW);                  // Turn off Yellow LED2
 }

} // END Loop


void flickerLED() { // Everytihng in here will be run once each time flickerLED() is called.
  analogWrite(LED1, random(120)+135);  // Set Yellow LED1 to a random brightness.
  analogWrite(LED2, random(120)+135);  // Set Yellow LED2 to a random brightness.
  delay(random(50));                   // Wait a random amount of time before returning to the loop and doing it again.

} // END flickerLED
