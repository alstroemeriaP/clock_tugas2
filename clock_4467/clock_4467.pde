/**
 * Clock. 
 * 
 * The current time can be read with the second(), minute(), 
 * and hour() functions. In this example, sin() and cos() values
 * are used to set the position of the hands.
 */
void setup() {
  size(400, 400);
  noStroke();
  frameRate(1);
}

void draw() {
  background(200);
  translate(width / 2, height / 2);
  float secondsAngle = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float minutesAngle = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float hoursAngle = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;

  // face
  fill(0);
  ellipse(0, 0, 600, 600);

  // hour numbers
  for (int i = 0; i < 12; i++) {
    float angle = map(i, 0, 12, 0, TWO_PI) - HALF_PI;
    float x = cos(angle) * 140;
    float y = sin(angle) * 150;
    
    //Display the numeral (2 digits)
    textSize(32);
    fill(#F5F2F2);
    textAlign(CENTER, CENTER);
    text(nf(i + 1, 2), x, y);  
  }

  // Draw clock hands
  strokeWeight(12);
  stroke(255, 0, 0);  // hour
  line(0, 0, cos(hoursAngle) * 80, sin(hoursAngle) * 80);
  
  strokeWeight(6);
  stroke(0, 0, 255);  // minute
  line(0, 0, cos(minutesAngle) * 100, sin(minutesAngle) * 100);
  
  strokeWeight(4);
  stroke(0, 255, 0);  //second
  line(0, 0, cos(secondsAngle) * 120, sin(secondsAngle) * 120);
}
