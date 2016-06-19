import controlP5.*;

PImage back, logo;
color fillcol, bordercol;

ControlP5 main, cp5;

Button addWep, applyXML;
DropdownList type, boost;
Textfield name, title, desc, tooltip, flavorType;
Textfield damage, ion, persDamage, sysDamage, stun, cooldown, missiles, shots, beamLength, speed, radius, red, green, blue, amount, count;
Slider sp, fireChance, breachChance, stunChance, power, rarity, chargeLevels;
CheckBox chex, boostEnable;
ColorPicker beamColor;
Textlabel wepMade;

Weapon wep;

void setup() {
  size(800, 600);

  surface.setTitle("FTL Weapon Maker");

  back = loadImage("background.png");
  logo = loadImage("logo-half.png");

  main = new ControlP5(this);
  cp5 = new ControlP5(this);

  fillcol = cp5.getColor().getBackground();
  bordercol = cp5.getColor().getForeground();

  addWep = main.addButton("New Weapon...").setPosition(20, 45).setSize(100, 30);
  applyXML = cp5.addButton("Apply").setPosition(width - 90, height - 60).setSize(50, 20);

  type = main.addDropdownList("TYPE").setPosition(140, 50).setSize(80, 120).setBarHeight(20).setItemHeight(20);
  type.addItem("LASER", 0);
  type.addItem("MISSILE", 1);
  type.addItem("BEAM", 2);
  type.addItem("BOMB", 3);
  type.addItem("BURST", 4);
  type.close();

  boost = cp5.addDropdownList("BOOST TYPE").setPosition(40, 310).setSize(80, 60).setBarHeight(20).setItemHeight(20);
  boost.addItem("damage", 0);
  boost.addItem("cooldown", 1);
  boost.close();

  name = main.addTextfield("NAME").setPosition(240, 50).setWidth(80).setAutoClear(false);
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
  amount = cp5.addTextfield("BOOST AMOUNT").setPosition(140, 310).setWidth(30).setAutoClear(false);
  count = cp5.addTextfield("MAX # OF BOOSTS").setPosition(200, 310).setWidth(30).setAutoClear(false);

  sp = cp5.addSlider("SHIELD PIERCING").setPosition(400, 340).setSize(100, 20).setRange(0, 5).setNumberOfTickMarks(6);
  fireChance = cp5.addSlider("FIRE CHANCE").setPosition(400, 380).setSize(100, 20).setRange(0, 10).setNumberOfTickMarks(11);
  breachChance = cp5.addSlider("BREACH CHANCE").setPosition(400, 420).setSize(100, 20).setRange(0, 10).setNumberOfTickMarks(11);
  stunChance = cp5.addSlider("STUN CHANCE").setPosition(400, 460).setSize(100, 20).setRange(0, 10).setNumberOfTickMarks(11);
  power = cp5.addSlider("POWER").setPosition(620, 340).setSize(50, 20).setRange(0, 4).setNumberOfTickMarks(5);
  rarity = cp5.addSlider("RARITY").setPosition(620, 380).setSize(50, 20).setRange(0, 5).setNumberOfTickMarks(6);
  chargeLevels = cp5.addSlider("# OF CHARGE LEVELS").setPosition(620, 420).setSize(50, 20).setRange(0, 5).setNumberOfTickMarks(6);

  chex = cp5.addCheckBox("chex").setPosition(400, 300).setSize(10, 10).setItemsPerRow(3).setSpacingColumn(90).setSpacingRow(10);
  chex.addItem("HULL BUSTER", 0);
  chex.addItem("DRONE TARGETABLE", 1);
  chex.addItem("CRYSTAL LOCKDOWN", 2);
  chex.addItem("BOOSTS PER SHOT", 3);
  chex.addItem("STORES CHARGES", 4);
  
  beamColor = cp5.addColorPicker("picker").setPosition(40, 380);
  beamColor.hide();
  cp5.addLabel("BEAM COLOR").setPosition(40, 440).hide();
  
  wepMade = cp5.addLabel("").setPosition(340, 55);

  cp5.setAutoDraw(false);

  setLock(addWep, true);
  setLock(beamLength, true);
  setLock(stun, true);
  setLock(radius, true);
  setLock(chargeLevels, true);
  setLock(boost, true);
  setLock(amount, true);
  setLock(count, true);
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
    beamColor.show();
    cp5.get("BEAM COLOR").show();
  } else {
    setLock(beamLength, true);
    beamColor.hide();
    cp5.get("BEAM COLOR").hide();
  }

  if (type.getLabel().equals("BURST")) {
    setLock(radius, false);
  } else {
    setLock(radius, true);
  }

  if (stunChance.getValue() > 0) {
    setLock(stun, false);
  } else {
    setLock(stun, true);
  }

  if (chex.getItem(3).getValue() == 1) {
    setLock(boost, false);
    setLock(amount, false);
    setLock(count, false);
  } else {
    setLock(boost, true);
    setLock(amount, true);
    setLock(count, true);
  }

  if (chex.getItem(4).getValue() == 1) {
    setLock(chargeLevels, false);
  } else {
    setLock(chargeLevels, true);
  }

  if (wep != null) {
    cp5.setAutoDraw(true);
    wep.printXML();
  }
}

void controlEvent(ControlEvent e) {
  if (e.isFrom(addWep)) {
    wep = new Weapon(name.getText(), type.getLabel());
    wepMade.setText("Successfully created " + name.getText());
  } else if (e.isFrom(applyXML)) {
    applyProperties();
  }
}

void applyProperties() {
}

void setLock(Controller c, boolean b) {
  c.setLock(b);
  if (b) {
    c.setColorBackground(color(100, 150));
    c.setColorForeground(color(50, 150));
  } else {
    c.setColorBackground(color(fillcol));
    c.setColorForeground(color(bordercol));
  }
}