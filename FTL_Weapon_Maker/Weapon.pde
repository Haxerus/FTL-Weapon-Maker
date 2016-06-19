class Weapon {

  XML weaponBlueprint; // Main blueprint tag

  Weapon(String name, String type) {
    weaponBlueprint = parseXML("<weaponBlueprint name=\"" + name + "\"></weaponBlueprint>" );

    setType(type);

    println("Successfully created " + name + " weapon");
  }

  void printXML() {
    println(weaponBlueprint);
  }

  void setType(String s) {
    if (weaponBlueprint.getChild("type") != null) {
      weaponBlueprint.getChild("type").setContent(s);
    } else {
      XML xml = parseXML("<type>" + s + "</type>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setTitle(String s) {
    if (weaponBlueprint.getChild("title") != null) {
      weaponBlueprint.getChild("title").setContent(s);
    } else {
      XML xml = parseXML("<title>" + s + "</title>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setShort(String s) {
    if (weaponBlueprint.getChild("short") != null) {
      weaponBlueprint.getChild("short").setContent(s);
    } else {
      XML xml = parseXML("<short>" + s + "</short>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setDesc(String s) {
    if (weaponBlueprint.getChild("desc") != null) {
      weaponBlueprint.getChild("desc").setContent(s);
    } else {
      XML xml = parseXML("<desc>" + s + "</desc>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setTooltip(String s) {
    if (weaponBlueprint.getChild("tooltip") != null) {
      weaponBlueprint.getChild("tooltip").setContent(s);
    } else {
      XML xml = parseXML("<tooltip>" + s + "</tooltip>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setFlavorType(String s) {
    if (weaponBlueprint.getChild("flavorType") != null) {
      weaponBlueprint.getChild("flavorType").setContent(s);
    } else {
      XML xml = parseXML("<flavorType>" + s + "</flavorType>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setDamage(int i) {
    if (weaponBlueprint.getChild("damage") != null) {
      weaponBlueprint.getChild("damage").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<damage>" + i + "</damage>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setIon(int i) {
    if (weaponBlueprint.getChild("ion") != null) {
      weaponBlueprint.getChild("ion").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<ion>" + i + "</ion>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setPersDamage(int i) {
    if (weaponBlueprint.getChild("persDamage") != null) {
      weaponBlueprint.getChild("persDamage").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<persDamage>" + i + "</persDamage>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setSysDamage(int i) {
    if (weaponBlueprint.getChild("sysDamage") != null) {
      weaponBlueprint.getChild("sysDamage").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<sysDamage>" + i + "</sysDamage>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setSP(int i) {
    if (weaponBlueprint.getChild("sp") != null) {
      weaponBlueprint.getChild("sp").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<sp>" + i + "</sp>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setFireChance(float f) {
    if (weaponBlueprint.getChild("fireChance") != null) {
      weaponBlueprint.getChild("fireChance").setContent(String.valueOf(f));
    } else {
      XML xml = parseXML("<fireChance>" + f + "</fireChance>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setBreachChance(float f) {
    if (weaponBlueprint.getChild("breachChance") != null) {
      weaponBlueprint.getChild("breachChance").setContent(String.valueOf(f));
    } else {
      XML xml = parseXML("<breachChance>" + f + "</breachChance>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setStunChance(float f) {
    if (weaponBlueprint.getChild("stunChance") != null) {
      weaponBlueprint.getChild("stunChance").setContent(String.valueOf(f));
    } else {
      XML xml = parseXML("<stunChance>" + f + "</stunChance>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setStun(float f) {
    if (weaponBlueprint.getChild("stun") != null) {
      weaponBlueprint.getChild("stun").setContent(String.valueOf(f));
    } else {
      XML xml = parseXML("<stun>" + f + "</stun>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setHullBust(boolean b) {
    if (weaponBlueprint.getChild("hullBust") != null) {
      if (b) {
        weaponBlueprint.getChild("hullBust").setContent(String.valueOf(1));
      } else {
        weaponBlueprint.getChild("hullBust").setContent(String.valueOf(0));
      }
    } else {
      if (b) {
        XML xml = parseXML("<hullBust>1</hullBust>");
        weaponBlueprint.addChild(xml);
      } else {
        XML xml = parseXML("<hullBust>0</hullBust>");
        weaponBlueprint.addChild(xml);
      }
    }
  }

  void setDroneTargetable(boolean b) {
    if (weaponBlueprint.getChild("drone_targetable") != null) {
      if (b) {
        weaponBlueprint.getChild("drone_targetable").setContent(String.valueOf(1));
      } else {
        weaponBlueprint.getChild("drone_targetable").setContent(String.valueOf(0));
      }
    } else {
      if (b) {
        XML xml = parseXML("<drone_targetable>1</drone_targetable>");
        weaponBlueprint.addChild(xml);
      } else {
        XML xml = parseXML("<drone_targetable>0</drone_targetable>");
        weaponBlueprint.addChild(xml);
      }
    }
  }

  void setLockdown(boolean b) {
    if (weaponBlueprint.getChild("lockdown") != null) {
      if (b) {
        weaponBlueprint.getChild("lockdown").setContent(String.valueOf(1));
      } else {
        weaponBlueprint.getChild("lockdown").setContent(String.valueOf(0));
      }
    } else {
      if (b) {
        XML xml = parseXML("<lockdown>1</lockdown>");
        weaponBlueprint.addChild(xml);
      } else {
        XML xml = parseXML("<lockdown>0</lockdown>");
        weaponBlueprint.addChild(xml);
      }
    }
  }

  void setShots(int i) {
    if (weaponBlueprint.getChild("shots") != null) {
      weaponBlueprint.getChild("shots").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<shots>" + i + "</shots>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setMissiles(int i) {
    if (weaponBlueprint.getChild("missiles") != null) {
      weaponBlueprint.getChild("missiles").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<missiles>" + i + "</missiles>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setCooldown(float f) {
    if (weaponBlueprint.getChild("cooldown") != null) {
      weaponBlueprint.getChild("cooldown").setContent(String.valueOf(f));
    } else {
      XML xml = parseXML("<cooldown>" + f + "</cooldown>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setPower(int i) {
    if (weaponBlueprint.getChild("power") != null) {
      weaponBlueprint.getChild("power").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<power>" + i + "</power>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setLength(int i) {
    if (weaponBlueprint.getChild("length") != null) {
      weaponBlueprint.getChild("length").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<length>" + i + "</length>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setSpeed(int i) {
    if (weaponBlueprint.getChild("speed") != null) {
      weaponBlueprint.getChild("speed").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<speed>" + i + "</speed>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setRadius(int i) {
    if (weaponBlueprint.getChild("radius") != null) {
      weaponBlueprint.getChild("radius").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<radius>" + i + "</radius>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setCost(int i) {
    if (weaponBlueprint.getChild("cost") != null) {
      weaponBlueprint.getChild("cost").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<cost>" + i + "</cost>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setRarity(int i) {
    if (weaponBlueprint.getChild("rarity") != null) {
      weaponBlueprint.getChild("rarity").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<rarity>" + i + "</rarity>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setColor(int r, int g, int b) {
    if (weaponBlueprint.getChild("color") != null) {
      weaponBlueprint.getChild("color").getChild("r").setContent(String.valueOf(r));
      weaponBlueprint.getChild("color").getChild("g").setContent(String.valueOf(g));
      weaponBlueprint.getChild("color").getChild("b").setContent(String.valueOf(b));
    } else {
      XML col = parseXML("<color></color>");

      XML red = parseXML("<r>" + r + "</r>");
      XML green = parseXML("<g>" + g + "</g>");
      XML blue = parseXML("<b>" + b + "</b>");

      col.addChild(red);
      col.addChild(green);
      col.addChild(blue);

      weaponBlueprint.addChild(col);
    }
  }

  void setBoost(String t, int a, int c) {
    if (weaponBlueprint.getChild("boost") != null) {
      weaponBlueprint.getChild("boost").getChild("type").setContent(t);
      weaponBlueprint.getChild("boost").getChild("amount").setContent(String.valueOf(a));
      weaponBlueprint.getChild("boost").getChild("count").setContent(String.valueOf(c));
    } else {
      XML boost = parseXML("<boost></boost>");

      XML type = parseXML("<type>" + t + "</type>");
      XML amount = parseXML("<amount>" + a + "</amount>");
      XML count = parseXML("<count>" + c + "</count>");

      boost.addChild(type);
      boost.addChild(amount);
      boost.addChild(count);

      weaponBlueprint.addChild(boost);
    }
  }

  void setChargeLevels(int i) {
    if (weaponBlueprint.getChild("chargeLevels") != null) {
      weaponBlueprint.getChild("chargeLevels").setContent(String.valueOf(i));
    } else {
      XML xml = parseXML("<chargeLevels>" + i + "</chargeLevels>");
      weaponBlueprint.addChild(xml);
    }
  }
}