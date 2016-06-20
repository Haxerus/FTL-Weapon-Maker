import controlP5.*;

PImage back, logo;
color fillcol, bordercol;
int currentIndex;

ControlP5 main, cp5;

Button addWep, delWep, applyXML, saveXML, addProj, inc, dec;
DropdownList type, boost, projectiles, wepList;
Textfield name, title, desc, tooltip, flavorType;
Textfield damage, ion, persDamage, sysDamage, stun, cooldown, missiles, shots, beamLength, speed, radius, amount, count, cost;
Slider sp, fireChance, breachChance, stunChance, power, rarity, chargeLevels, red, green, blue;
CheckBox chex;
Textlabel wepMade, index, currWep;
Tab images, sounds, output;

ArrayList<Weapon> weapons;

void setup() {
  size(800, 600);

  surface.setTitle("FTL Weapon Maker");

  back = loadImage("background.png");
  logo = loadImage("logo-half.png");

  currentIndex = 0;

  weapons = new ArrayList<Weapon>();

  cp5 = new ControlP5(this);

  fillcol = cp5.getColor().getBackground();
  bordercol = cp5.getColor().getForeground();

  addWep = cp5.addButton("New Weapon...").setPosition(20, 45).setSize(100, 30);
  delWep = cp5.addButton("Delete Weapon...").setPosition(20, 90).setSize(100, 30);
  applyXML = cp5.addButton("Apply").setPosition(width - 90, height - 60).setSize(50, 20);
  saveXML = cp5.addButton("Save XML File").setPosition(20, 45).setSize(100, 30);
  addProj = cp5.addButton("ADD PROJECTILE").setPosition(160, 480).setSize(65, 15);
  inc = cp5.addButton("+").setPosition(400, 50).setSize(20, 20);
  dec = cp5.addButton("-").setPosition(350, 50).setSize(20, 20);

  type = cp5.addDropdownList("TYPE").setPosition(140, 50).setSize(80, 120).setBarHeight(20).setItemHeight(20);
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

  projectiles = cp5.addDropdownList("PROJECTILES").setPosition(40, 480).setSize(100, 60).setBarHeight(15).setItemHeight(15);

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
  cost = cp5.addTextfield("COST").setPosition(640, 260).setWidth(30).setAutoClear(false);
  amount = cp5.addTextfield("BOOST AMOUNT").setPosition(140, 310).setWidth(30).setAutoClear(false);
  count = cp5.addTextfield("MAX # OF BOOSTS").setPosition(200, 310).setWidth(30).setAutoClear(false);

  sp = cp5.addSlider("SHIELD PIERCING").setPosition(400, 380).setSize(100, 20).setRange(0, 5).setNumberOfTickMarks(6);
  fireChance = cp5.addSlider("FIRE CHANCE").setPosition(400, 420).setSize(100, 20).setRange(0, 10).setNumberOfTickMarks(11);
  breachChance = cp5.addSlider("BREACH CHANCE").setPosition(400, 460).setSize(100, 20).setRange(0, 10).setNumberOfTickMarks(11);
  stunChance = cp5.addSlider("STUN CHANCE").setPosition(400, 500).setSize(100, 20).setRange(0, 10).setNumberOfTickMarks(11);
  power = cp5.addSlider("POWER").setPosition(620, 380).setSize(50, 20).setRange(0, 4).setNumberOfTickMarks(5);
  rarity = cp5.addSlider("RARITY").setPosition(620, 420).setSize(50, 20).setRange(0, 5).setNumberOfTickMarks(6);
  chargeLevels = cp5.addSlider("# OF CHARGE LEVELS").setPosition(620, 460).setSize(50, 20).setRange(0, 5).setNumberOfTickMarks(6);
  red = cp5.addSlider("RED").setPosition(40, 380).setSize(200, 15).setRange(0, 255).setNumberOfTickMarks(256);
  green = cp5.addSlider("GREEN").setPosition(40, 410).setSize(200, 15).setRange(0, 255).setNumberOfTickMarks(256);
  blue = cp5.addSlider("BLUE").setPosition(40, 440).setSize(200, 15).setRange(0, 255).setNumberOfTickMarks(256);

  chex = cp5.addCheckBox("chex").setPosition(400, 320).setSize(10, 10).setItemsPerRow(3).setSpacingColumn(90).setSpacingRow(10);
  chex.addItem("HULL BUSTER", 0);
  chex.addItem("DRONE TARGETABLE", 1);
  chex.addItem("CRYSTAL LOCKDOWN", 2);
  chex.addItem("BOOSTS PER SHOT", 3);
  chex.addItem("STORES CHARGES", 4);

  wepMade = cp5.addLabel("No weapons have been made").setPosition(width - 150, 140);
  index = cp5.addLabel(Integer.toString(currentIndex)).setPosition(379, 56);
  currWep = cp5.addLabel("No weapons").setPosition(450, 56);

  images = cp5.addTab("IMAGE PROPERTIES");
  sounds = cp5.addTab("SOUND PROPERTIES");
  output = cp5.addTab("OUTPUT SETTINGS");
  cp5.getTab("default").setLabel("WEAPON PROPERTIES");

  applyXML.moveTo("global");
  saveXML.moveTo(output);
  addProj.moveTo(images);
  projectiles.moveTo(images);

  setLock(addWep, true);
  setLock(delWep, true);
  setLock(beamLength, true);
  setLock(stun, true);
  setLock(radius, true);
  setLock(chargeLevels, true);
  setLock(boost, true);
  setLock(amount, true);
  setLock(count, true);
  setLock(red, true);
  setLock(green, true);
  setLock(blue, true);
}

void draw() {
  background(back);
  image(logo, width - logo.width, 0);
  //noStroke();
  fill(255, 120);
  rect(20, 160, width - 40, height - 180);

  if (!name.getText().equals("") && !type.getLabel().equals("TYPE")) {
    setLock(addWep, false);
  } else {
    setLock(addWep, true);
  }

  if (weapons.size() > 0) {
    weapons.get(currentIndex).printXML();
    index.setText(Integer.toString(currentIndex+1));
    String currName = weapons.get(currentIndex).weaponBlueprint.getString("name");
    String currType = weapons.get(currentIndex).weaponBlueprint.getChild("type").getContent();
    currWep.setText("Current Weapon: " + currName + "\n" + "Current Weapon Type: " + currType);

    setLock(delWep, false);

    if (weapons.get(currentIndex).weaponBlueprint.getChild("type").getContent().equals("BEAM")) {
      if (cp5.getTab("default").isActive()) {
        fill(red.getValue(), green.getValue(), blue.getValue());
        rect(280, 380, 10, 75);
      }
      setLock(delWep, false);
      setLock(shots, true);
      setLock(radius, true);
      setLock(projectiles, true);
      setLock(addProj, true);
      setLock(red, false);
      setLock(green, false);
      setLock(blue, false);
    } else if (weapons.get(currentIndex).weaponBlueprint.getChild("type").getContent().equals("BURST")) {
      setLock(shots, true);
      setLock(radius, false);
      setLock(projectiles, false);
      setLock(addProj, false);
      if (cp5.getTab("default").isActive()) {
        fill(100);
        rect(280, 380, 10, 75);
      }
    } else {
      if (cp5.getTab("default").isActive()) {
        fill(100);
        rect(280, 380, 10, 75);
      }
      setLock(shots, false);
      setLock(radius, true);
      setLock(projectiles, true);
      setLock(addProj, true);
      setLock(beamLength, true);
      setLock(red, true);
      setLock(green, true);
      setLock(blue, true);
    }

    if (stunChance.getValue() > 0) {
      setLock(stun, false);
    } else {
      setLock(stun, true);
    }

    if (chex.getState(3)) {
      setLock(boost, false);
      setLock(amount, false);
      setLock(count, false);
    } else {
      setLock(boost, true);
      setLock(amount, true);
      setLock(count, true);
    }

    if (chex.getState(4)) {
      setLock(chargeLevels, false);
    } else {
      setLock(chargeLevels, true);
    }
  } else {
    currWep.setText("No weapons");
  }
}

void controlEvent(ControlEvent e) {
  if (e.isFrom(addWep)) {
    weapons.add(new Weapon(name.getText(), type.getLabel()));
    wepMade.setText("Successfully created " + name.getText());
    if (weapons.size() > 1) {
      currentIndex++;
    }
  } else if (e.isFrom(delWep) && weapons.size() > 0) {
    weapons.remove(currentIndex);
    if (currentIndex != 0) {
      currentIndex--;
    }
  } else if (e.isFrom(applyXML)) {
    applyProperties();
  } else if (e.isFrom(saveXML) && weapons.size() > 0) {
    saveXML(weapons.get(currentIndex).weaponBlueprint, "blueprints.xml.append");
  } else if (e.isFrom(addProj)) {
    addProjectile();
  } else if (e.isFrom(dec) && currentIndex > 0) {
    currentIndex--;
  } else if (e.isFrom(inc) && currentIndex < (weapons.size()-1)) {
    currentIndex++;
  }
}

void addProjectile() {
}

void applyProperties() {
  if (weapons.size() > 0) {
    weapons.get(currentIndex).setTitle(title.getText());  
    weapons.get(currentIndex).setShort(split(title.getText(), " ")[0]);  
    weapons.get(currentIndex).setDesc(desc.getText());   
    weapons.get(currentIndex).setTooltip(tooltip.getText());

    if (!flavorType.getText().equals("")) {
      weapons.get(currentIndex).setFlavorType(flavorType.getText());
    }

    weapons.get(currentIndex).setDamage(damage.getText());
    weapons.get(currentIndex).setIon(ion.getText());
    weapons.get(currentIndex).setPersDamage(persDamage.getText());
    weapons.get(currentIndex).setSysDamage(sysDamage.getText());
    weapons.get(currentIndex).setMissiles(missiles.getText());

    if (stunChance.getValue() > 0) {
      weapons.get(currentIndex).setStun(stun.getText());
    }

    weapons.get(currentIndex).setCooldown(cooldown.getText());

    if (!weapons.get(currentIndex).weaponBlueprint.getChild("type").getContent().equals("BEAM")) {
      weapons.get(currentIndex).setLength(beamLength.getText());
      weapons.get(currentIndex).setColor((int)red.getValue(), (int)green.getValue(), (int)blue.getValue());
    } else if (weapons.get(currentIndex).weaponBlueprint.getChild("type").getContent().equals("BURST")) {
      weapons.get(currentIndex).setRadius(radius.getText());
      weapons.get(currentIndex).setShots("1");
    } else {
      weapons.get(currentIndex).setShots(shots.getText());
    }

    weapons.get(currentIndex).setSpeed(speed.getText());
    weapons.get(currentIndex).setCost(cost.getText());   

    weapons.get(currentIndex).setSP((int)sp.getValue());
    weapons.get(currentIndex).setFireChance(fireChance.getValue());
    weapons.get(currentIndex).setBreachChance(breachChance.getValue());
    weapons.get(currentIndex).setStunChance(stunChance.getValue());
    weapons.get(currentIndex).setPower((int)power.getValue());
    weapons.get(currentIndex).setRarity((int)rarity.getValue());
    if (chex.getState(4)) {
      weapons.get(currentIndex).setChargeLevels((int)chargeLevels.getValue());
    }

    weapons.get(currentIndex).setHullBust(chex.getState(0));
    weapons.get(currentIndex).setDroneTargetable(chex.getState(1));
    weapons.get(currentIndex).setLockdown(chex.getState(2));

    if (chex.getState(3) && !boost.getLabel().equals("BOOST TYPE")) {
      weapons.get(currentIndex).setBoost(boost.getLabel(), amount.getText(), count.getText());
    }
  }
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