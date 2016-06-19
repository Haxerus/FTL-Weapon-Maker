import controlP5.*;

PImage back, logo;
color fillcol, bordercol;

ControlP5 cp5;

Button addWep, applyXML;
DropdownList type;
Textfield name, title, desc, tooltip, flavorType;
Textfield damage, ion, persDamage, sysDamage, stun, cooldown, missiles, shots, beamLength, speed, radius, red, green, blue;

Weapon wep;

void setup() {
  size(800, 600);

  surface.setTitle("FTL Weapon Maker");

  back = loadImage("background.png");
  logo = loadImage("logo-half.png");

  fillcol = color(#002D5A);
  bordercol = color(#0074D9);

  cp5 = new ControlP5(this);

  addWep = cp5.addButton("New Weapon...").setPosition(20, 50).setSize(100, 30);
  applyXML = cp5.addButton("Apply").setPosition(width - 90, height - 60).setSize(50, 20);

  type = cp5.addDropdownList("TYPE").setPosition(140, 50).setSize(80, 120).setBarHeight(20).setItemHeight(20);
  type.addItem("LASER", 0);
  type.addItem("MISSILE", 1);
  type.addItem("BEAM", 2);
  type.addItem("BOMB", 3);
  type.addItem("BURST", 4);
  type.close();

  name = cp5.addTextfield("NAME").setPosition(240, 50).setWidth(80).setAutoClear(false);
  title = cp5.addTextfield("TITLE").setPosition(40, 180).setWidth(80).setAutoClear(false);
  desc = cp5.addTextfield("DESCRIPTION").setPosition(40, 220).setWidth(250).setAutoClear(false);
  tooltip = cp5.addTextfield("TOOLTIP").setPosition(40, 260).setWidth(250).setAutoClear(false);
  flavorType = cp5.addTextfield("FLAVOR TYPE").setPosition(160, 180).setWidth(80).setAutoClear(false);

  damage = cp5.addTextfield("DAMAGE").setPosition(400, 180).setWidth(30).setAutoClear(false);
  ion = cp5.addTextfield("ION DAMAGE").setPosition(400, 220).setWidth(30).setAutoClear(false);
  stun = cp5.addTextfield("STUN DURATION").setPosition(400, 260).setWidth(30).setAutoClear(false);
  persDamage = cp5.addTextfield("CREW DAMAGE").setPosition(480, 180).setWidth(30).setAutoClear(false);
  sysDamage = cp5.addTextfield("SYSTEM DAMAGE").setPosition(480, 220).setWidth(30).setAutoClear(false);
  missiles = cp5.addTextfield("MISSILE COST").setPosition(480, 260).setWidth(30).setAutoClear(false);
  cooldown = cp5.addTextfield("COOLDOWN").setPosition(560, 180).setWidth(30).setAutoClear(false);
  shots = cp5.addTextfield("# OF SHOTS").setPosition(560, 220).setWidth(30).setAutoClear(false);
  beamLength = cp5.addTextfield("BEAM LENGTH").setPosition(560, 260).setWidth(30).setAutoClear(false);
  speed  = cp5.addTextfield("PROJECTILE SPEED").setPosition(640, 180).setWidth(30).setAutoClear(false);
  radius = cp5.addTextfield("SPREAD RADIUS").setPosition(640, 220).setWidth(30).setAutoClear(false);

  setLock(addWep, true);
  setLock(beamLength, true);
  setLock(stun, true);
  setLock(radius, true);
}

void draw() {
  background(back);
  image(logo, width - logo.width, 0);
  noStroke();
  fill(255, 120);
  rect(20, 160, width - 40, height - 180);

  if (!type.getLabel().equals("TYPE") && !name.getText().equals("")) {
    setLock(addWep, false);
  } else {
    setLock(addWep, true);
  }

  if (type.getLabel().equals("BEAM")) {
    setLock(beamLength, false);
  } else {
    setLock(beamLength, true);
  }
  
  if (type.getLabel().equals("BURST")) {
    setLock(radius, false);
  } else {
    setLock(radius, true);
  }

  if (wep != null) {
    wep.printXML();
  }
}

void controlEvent(ControlEvent e) {
  if (e.isFrom(addWep) && wep == null) {
    wep = new Weapon(name.getText(), type.getLabel());
    cp5.addLabel("Successfully created " + name.getText()).setPosition(340, 55);
  } else if (e.isFrom(applyXML)) {
    applyProperties();
  }
}

void applyProperties() {
}

void setLock(Controller c, boolean b) {
  c.setLock(b);
  if (b) {
    c.setColorBackground(color(100, 100));
    c.setColorForeground(color(50, 100));
  } else {
    c.setColorBackground(color(fillcol));
    c.setColorForeground(color(bordercol));
  }
}