import interfascia.*;

PImage back, logo, icon;
PGraphics iconImage;
ArrayList<Weapon> weapons;
ArrayList<IFButton> tabs;

GUIController c;
IFButton b1, b2;

void setup() {
  size(800, 600);

  icon = loadImage("icon.jpg");
  back = loadImage("background.png");
  logo = loadImage("logo-half.png");
  
  iconImage = createGraphics(16, 16, JAVA2D);
  
  iconImage.beginDraw();
  iconImage.image(icon, 0, 0, 16, 16);
  iconImage.endDraw();

  surface.setTitle("FTL Weapon Maker");
  frame.setIconImage(iconImage.image);

  c = new GUIController(this);
  weapons = new ArrayList<Weapon>();

  b1 = new IFButton("New Weapon...", 30, 30, 150, 20);
  b2 = new IFButton("Delete Weapon", 30, 70, 150, 20);

  b1.addActionListener(this);
  b2.addActionListener(this);

  c.add(b1);
  c.add(b2);
}

void draw() {
  background(back);
  image(logo, width - logo.width, 0);
  noStroke();
  fill(255, 100);
  rect(30, 150, 610, 420);
  
  
}

void actionPerformed(GUIEvent e) {
  if (e.getSource() == b1) {
    weapons.add(new Weapon("Apple"));
  } else if (e.getSource() == b2) {
    weapons.remove(weapons.size()-1);
  }
}

void keyPressed() {
}

void keyReleased() {
}

void mousePressed() {
}

void mouseReleased() {
}