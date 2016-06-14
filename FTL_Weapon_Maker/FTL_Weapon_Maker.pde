Display currentDisplay;

void setup() {
  size(800, 600);

  currentDisplay = new MainDisplay();
}

void draw() {
  background(0);

  currentDisplay.update();
  currentDisplay.render();
}

void keyPressed() {
  currentDisplay.keyPressed();
}

void keyReleased() {
  currentDisplay.keyReleased();
}

void mousePressed() {
  currentDisplay.mousePressed();
}

void mouseReleased() {
  currentDisplay.mouseReleased();
}