import controlP5.*;

PImage back, logo;
color fillcol, bordercol;
int currentIndex;
String modDir;

ControlP5 main, cp5;

Button addWep, delWep, applyXML, saveXML, inc, dec, folder, imgInc, imgDec;
DropdownList type, boost;
Textfield name, title, desc, tooltip, flavorType;
Textfield damage, ion, persDamage, sysDamage, stun, cooldown, missiles, shots, beamLength, speed, radius, amount, count, cost;
Textfield wepImgSrc, wepImgName, wepImgW, wepImgH, wepImgFW, wepImgFH, wepImgCF, wepImgFF, wepImgFirePoint, wepImgMountPoint, wepGlowSrc, explosionSrc, boostSrc;
Textfield expW, expH, expFW, expFH, boostW, boostH, boostFW, boostFH, expName, expTime, boostName, boostTime, bulletSrc, bulletName, bulletTime, bulletW, bulletH, bulletFW, bulletFH;
Slider sp, fireChance, breachChance, stunChance, power, rarity, chargeLevels, red, green, blue;
CheckBox chex, imgChex;
Textlabel index, currWep, currDir, projIndex;
Tab images, sounds, output;

ArrayList<Weapon> weapons;
ArrayList<Projectile> proj;

void setup() {
  size(800, 600);

  surface.setTitle("FTL Weapon Maker");

  back = loadImage("background.png");
  logo = loadImage("logo-half.png");

  PImage icon = loadImage("icon.png");
  surface.setIcon(icon);

  currentIndex = 0;

  weapons = new ArrayList<Weapon>();

  //selectFolder("Select your mod's directory...", "folderSelected");

  cp5 = new ControlP5(this);

  fillcol = cp5.getColor().getBackground();
  bordercol = cp5.getColor().getForeground();

  /**
   *  Tab init
   *
   */

  images = cp5.addTab("IMAGE PROPERTIES");
  sounds = cp5.addTab("SOUND PROPERTIES");
  output = cp5.addTab("OUTPUT SETTINGS");
  cp5.getTab("default").setLabel("WEAPON PROPERTIES");

  /**
   *  GUI Elements that are used GLOBALLY
   *
   */

  applyXML = cp5.addButton("Apply").setPosition(width - 90, height - 60).setSize(50, 20);
  inc = cp5.addButton("+").setPosition(400, 50).setSize(20, 20);
  dec = cp5.addButton("-").setPosition(350, 50).setSize(20, 20);
  index = cp5.addLabel(Integer.toString(currentIndex)).setPosition(379, 56);
  currWep = cp5.addLabel("No weapons").setPosition(355, 100);

  /**
   *  GUI Elements that are used in the WEAPON PROPERTIES TAB
   *
   */

  addWep = cp5.addButton("New Weapon...").setPosition(20, 45).setSize(100, 30);
  delWep = cp5.addButton("Delete Weapon...").setPosition(20, 90).setSize(100, 30);

  type = cp5.addDropdownList("TYPE").setPosition(140, 50).setSize(80, 120).setBarHeight(20).setItemHeight(20);
  type.addItem("LASER", 0);
  type.addItem("MISSILES", 1);
  type.addItem("BEAM", 2);
  type.addItem("BOMB", 3);
  type.addItem("BURST", 4);
  type.close();

  boost = cp5.addDropdownList("BOOST TYPE").setPosition(40, 310).setSize(80, 60).setBarHeight(20).setItemHeight(20);
  boost.addItem("damage", 0);
  boost.addItem("cooldown", 1);
  boost.close();

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
  chargeLevels = cp5.addSlider("# OF CHARGE LEVELS").setPosition(620, 460).setSize(50, 20).setRange(0, 4).setNumberOfTickMarks(5);
  red = cp5.addSlider("RED").setPosition(40, 380).setSize(200, 15).setRange(0, 255).setNumberOfTickMarks(256);
  green = cp5.addSlider("GREEN").setPosition(40, 410).setSize(200, 15).setRange(0, 255).setNumberOfTickMarks(256);
  blue = cp5.addSlider("BLUE").setPosition(40, 440).setSize(200, 15).setRange(0, 255).setNumberOfTickMarks(256);

  chex = cp5.addCheckBox("chex").setPosition(400, 320).setSize(10, 10).setItemsPerRow(3).setSpacingColumn(90).setSpacingRow(10);
  chex.addItem("HULL BUSTER", 0);
  chex.addItem("DRONE TARGETABLE", 1);
  chex.addItem("CRYSTAL LOCKDOWN", 2);
  chex.addItem("BOOSTS PER SHOT", 3);
  chex.addItem("STORES CHARGES", 4);

  /**
   *  GUI Elements that are used in the IMAGE PROPERTIES TAB
   *
   */

  wepImgName = cp5.addTextfield("WEAPON ANIMATION NAME").setPosition(40, 220).setWidth(100).setAutoClear(false);
  wepImgSrc = cp5.addTextfield("WEAPON IMAGE PATH").setPosition(40, 180).setWidth(220).setAutoClear(false);
  wepImgSrc.setText("Should look like \"weapons/example_image.png\"");
  wepImgW = cp5.addTextfield("WEAPON IMAGE WIDTH").setPosition(40, 260).setWidth(30).setAutoClear(false);
  wepImgH = cp5.addTextfield("WEAPON IMAGE HEIGHT").setPosition(40, 300).setWidth(30).setAutoClear(false);
  wepImgFW = cp5.addTextfield("WEAPON FRAME WIDTH").setPosition(40, 340).setWidth(30).setAutoClear(false);
  wepImgFH = cp5.addTextfield("WEAPON FRAME HEIGHT").setPosition(40, 380).setWidth(30).setAutoClear(false);
  wepImgCF = cp5.addTextfield("WEAPON CHARGED FRAME").setPosition(140, 260).setWidth(30).setAutoClear(false);
  wepImgFF = cp5.addTextfield("WEAPON FIRE FRAME").setPosition(140, 300).setWidth(30).setAutoClear(false);
  wepImgFirePoint = cp5.addTextfield("WEAPON FIRE POINT (X, Y)").setPosition(140, 340).setWidth(30).setAutoClear(false);
  wepImgMountPoint = cp5.addTextfield("WEAPON MOUNT POINT (X, Y)").setPosition(140, 380).setWidth(30).setAutoClear(false);
  wepGlowSrc = cp5.addTextfield("CHARGE GLOW IMAGE PATH").setPosition(40, 420).setWidth(220).setAutoClear(false);
  wepGlowSrc.setText("Should look like \"weapons/example_glow.png\"");
  explosionSrc = cp5.addTextfield("EXPLOSION IMAGE PATH").setPosition(290, 180).setWidth(220).setAutoClear(false);
  explosionSrc.setText("Should look like \"effects/example_explosion.png\"");
  boostSrc = cp5.addTextfield("BOOST IMAGE PATH").setPosition(540, 180).setWidth(220).setAutoClear(false);
  boostSrc.setText("Should look like \"weapons/example_boost.png\"");
  
  expName = cp5.addTextfield("EXPLOSION NAME").setPosition(290, 220).setWidth(100).setAutoClear(false);
  expTime = cp5.addTextfield("EXPLOSION TIME (SEC PER FRAME)").setPosition(400, 220).setWidth(30).setAutoClear(false);
  expW = cp5.addTextfield("EXPLOSION WIDTH").setPosition(290, 260).setWidth(30).setAutoClear(false);
  expH = cp5.addTextfield("EXPLOSION HEIGHT").setPosition(400, 260).setWidth(30).setAutoClear(false);
  expFW = cp5.addTextfield("EXPLOSION FRAME WIDTH").setPosition(290, 300).setWidth(30).setAutoClear(false);
  expFH = cp5.addTextfield("EXPLOSION FRAME HEIGHT").setPosition(400, 300).setWidth(30).setAutoClear(false);
  
  boostName = cp5.addTextfield("BOOST NAME").setPosition(540, 220).setWidth(100).setAutoClear(false);
  boostTime = cp5.addTextfield("BOOST TIME (SEC PER FRAME)").setPosition(650, 220).setWidth(30).setAutoClear(false);
  boostW = cp5.addTextfield("BOOST WIDTH").setPosition(540, 260).setWidth(30).setAutoClear(false);
  boostH = cp5.addTextfield("BOOST HEIGHT").setPosition(650, 260).setWidth(30).setAutoClear(false);
  boostFW = cp5.addTextfield("BOOST FRAME WIDTH").setPosition(540, 300).setWidth(30).setAutoClear(false);
  boostFH = cp5.addTextfield("BOOST FRAME HEIGHT").setPosition(650, 300).setWidth(30).setAutoClear(false);
  
  bulletSrc = cp5.addTextfield("PROJECTILE IMAGE PATH").setPosition(290, 380).setWidth(220).setAutoClear(false);
  bulletSrc.setText("Should look like \"weapons/example_bullet.png\"");
  bulletName = cp5.addTextfield("PROJECTILE NAME").setPosition(290, 420).setWidth(100).setAutoClear(false);
  bulletTime = cp5.addTextfield("PROJECTILE TIME (SEC PER FRAME)").setPosition(400, 420).setWidth(30).setAutoClear(false);
  bulletW = cp5.addTextfield("PROJECTILE WIDTH").setPosition(290, 460).setWidth(30).setAutoClear(false);
  bulletH = cp5.addTextfield("PROJECTILE HEIGHT").setPosition(400, 460).setWidth(30).setAutoClear(false);
  bulletFW = cp5.addTextfield("PROJECTILE FRAME WIDTH").setPosition(290, 500).setWidth(30).setAutoClear(false);
  bulletFH = cp5.addTextfield("PROJECTILE FRAME HEIGHT").setPosition(400, 500).setWidth(30).setAutoClear(false);
  

  imgChex = cp5.addCheckBox("image options").setPosition(40, 470).setSize(15, 15).setItemsPerRow(1).setSpacingColumn(90).setSpacingRow(10);
  imgChex.addItem("CHARGE GLOW IMAGE", 0);
  imgChex.addItem("BOOST IMAGE", 1);
  imgChex.addItem("CUSTOM EXPLOSION", 2);


  /**
   *  GUI Elements that are used in the SOUND PROPERTIES TAB
   *
   */

  // TODO Add Sound elements

  /**
   *  GUI Elements that are used in the OUTPUT PROPERTIES TAB
   *
   */

  saveXML = cp5.addButton("Save XML File").setPosition(20, 45).setSize(100, 30);
  folder = cp5.addButton("Select Mod Directory").setPosition(20, 90).setSize(100, 30);
  currDir = cp5.addLabel("No mod directory").setPosition(20, 130);

  /**
   *  Locking and Moving Elements
   *
   */

  applyXML.moveTo("global");
  inc.moveTo("global");
  dec.moveTo("global");
  index.moveTo("global");
  currWep.moveTo("global");

  folder.moveTo(output);
  saveXML.moveTo(output);
  currDir.moveTo(output);

  wepImgName.moveTo(images);
  wepImgSrc.moveTo(images);
  wepImgW.moveTo(images);
  wepImgH.moveTo(images);
  wepImgFW.moveTo(images);
  wepImgFH.moveTo(images);
  wepImgCF.moveTo(images);
  wepImgFF.moveTo(images);
  wepImgFirePoint.moveTo(images);
  wepImgMountPoint.moveTo(images);
  wepGlowSrc.moveTo(images);
  explosionSrc.moveTo(images);
  boostSrc.moveTo(images);
  imgChex.moveTo(images);
  expName.moveTo(images);
  expTime.moveTo(images);
  expW.moveTo(images);
  expH.moveTo(images);
  expFW.moveTo(images);
  expFH.moveTo(images);
  boostName.moveTo(images);
  boostTime.moveTo(images);
  boostW.moveTo(images);
  boostH.moveTo(images);
  boostFW.moveTo(images);
  boostFH.moveTo(images);
  bulletSrc.moveTo(images);
  bulletName.moveTo(images);
  bulletTime.moveTo(images);
  bulletW.moveTo(images);
  bulletH.moveTo(images);
  bulletFW.moveTo(images);
  bulletFH.moveTo(images);


  setLock(addWep, true);
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
  setLock(wepGlowSrc, true);
}

void draw() {
  background(back);
  image(logo, width - logo.width, 0);
  fill(255, 120);
  rect(20, 160, width - 40, height - 180);

  if (!name.getText().equals("") && !type.getLabel().equals("TYPE")) {
    setLock(addWep, false);
  } else {
    setLock(addWep, true);
  }

  if (modDir != null) {
    currDir.setText("Mod Directory: " + modDir);
  }

  if (weapons.size() > 0) {
    for (int i = 0; i < cp5.getAll().size(); i++) {
      cp5.getAll().get(i).show();
    }

    setLock(saveXML, false);

    weapons.get(currentIndex).printXML();
    index.setText(Integer.toString(currentIndex+1));
    String currName = weapons.get(currentIndex).weaponBlueprint.getString("name");
    String currType = weapons.get(currentIndex).weaponBlueprint.getChild("type").getContent();
    currWep.setText("Current Weapon Name: " + currName + "\n" + "Current Weapon Type: " + currType);

    if (weapons.get(currentIndex).weaponBlueprint.getChild("type").getContent().equals("BEAM")) {
      setLock(delWep, false);
      setLock(shots, true);
      setLock(radius, true);
      setLock(red, false);
      setLock(green, false);
      setLock(blue, false);

      setLock(chex.getItems().get(1), true);
      setLock(chex.getItems().get(2), true);
      setLock(chex.getItems().get(4), true);
      setLock(imgChex.getItems().get(2), true);

      if (cp5.getTab("default").isActive()) {
        fill(red.getValue(), green.getValue(), blue.getValue());
        rect(280, 380, 10, 75);
      }
    } else if (weapons.get(currentIndex).weaponBlueprint.getChild("type").getContent().equals("BURST")) {
      setLock(shots, true);
      setLock(radius, false);
      if (cp5.getTab("default").isActive()) {
        fill(100);
        rect(280, 380, 10, 75);
      }
      
      setLock(chex.getItems().get(1), false);
      setLock(chex.getItems().get(2), false);
      setLock(chex.getItems().get(4), true);
      setLock(imgChex.getItems().get(2), false);
    } else {
      setLock(shots, false);
      setLock(radius, true);
      setLock(beamLength, true);
      setLock(red, true);
      setLock(green, true);
      setLock(blue, true);
      if (cp5.getTab("default").isActive()) {
        fill(100);
        rect(280, 380, 10, 75);
      }
      
      setLock(imgChex.getItems().get(2), false);
      setLock(chex.getItems().get(1), false);
      setLock(chex.getItems().get(2), false);
      setLock(chex.getItems().get(4), false);
    }

    // Only enables stun duration field if stunChance > 1
    if (stunChance.getValue() > 0) {
      setLock(stun, false);
    } else {
      setLock(stun, true);
    }

    // Checks "Weapon Boost" checkbox to enable slider
    if (chex.getState(3)) {
      setLock(boost, false);
      setLock(amount, false);
      setLock(count, false);
    } else {
      setLock(boost, true);
      setLock(amount, true);
      setLock(count, true);
    }

    // Check if the "Charge Levels" check box is toggled to enable chargeLevels slider
    if (chex.getState(4)) {
      setLock(chargeLevels, false);
    } else {
      setLock(chargeLevels, true);
    }

    if (imgChex.getState(0)) {
      setLock(wepGlowSrc, false);
    } else {
      setLock(wepGlowSrc, true);
    }

    if (imgChex.getState(1)) {
      setLock(boostName, false);
      setLock(boostTime, false);
      setLock(boostSrc, false);
      setLock(boostW, false);
      setLock(boostH, false);
      setLock(boostFW, false);
      setLock(boostFH, false);
    } else {
      setLock(boostName, true);
      setLock(boostTime, true);
      setLock(boostSrc, true);
      setLock(boostW, true);
      setLock(boostH, true);
      setLock(boostFW, true);
      setLock(boostFH, true);
    }

    if (imgChex.getState(2) && !weapons.get(currentIndex).weaponBlueprint.getChild("type").getContent().equals("BEAM")) {
      setLock(expName, false);
      setLock(expTime, false);
      setLock(explosionSrc, false);
      setLock(expW, false);
      setLock(expH, false);
      setLock(expFW, false);
      setLock(expFH, false);
    } else {
      setLock(expName, true);
      setLock(expTime, true);
      setLock(explosionSrc, true);
      setLock(expW, true);
      setLock(expH, true);
      setLock(expFW, true);
      setLock(expFH, true);
    }
  } else {
    index.setText("0");
    currWep.setText("No weapons");
    setLock(saveXML, true);
    println("No weapons in register");

    for (int i = 0; i < cp5.getAll().size(); i++) {
      if (cp5.getAll().get(i) != addWep &&
        cp5.getAll().get(i) != type &&
        cp5.getAll().get(i) != name &&
        cp5.getAll().get(i) != currWep &&
        cp5.getAll().get(i) != dec &&
        cp5.getAll().get(i) != inc &&
        cp5.getAll().get(i) != index &&
        cp5.getAll().get(i) != folder &&
        cp5.getAll().get(i) != saveXML &&
        cp5.getAll().get(i) != currDir)
      {
        cp5.getAll().get(i).hide();
      }
    }
  }
}

void controlEvent(ControlEvent e) {
  if (e.isFrom(addWep)) {
    weapons.add(new Weapon(name.getText(), type.getLabel()));
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
  } else if (e.isFrom(dec) && currentIndex > 0) {
    currentIndex--;
  } else if (e.isFrom(inc) && currentIndex < (weapons.size()-1)) {
    currentIndex++;
  } else if (e.isFrom(folder)) {
    selectFolder("Select your mod's directory...", "folderSelected");
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

void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    selectFolder("Select your mod's directory:", "folderSelected");
  } else {
    println("User selected " + selection.getAbsolutePath());
    modDir = selection.getAbsolutePath();
  }
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

    if (weapons.get(currentIndex).weaponBlueprint.getChild("type").getContent().equals("BEAM")) {
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