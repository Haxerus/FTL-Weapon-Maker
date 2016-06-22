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

  void setDamage(String s) {
    if (weaponBlueprint.getChild("damage") != null) {
      weaponBlueprint.getChild("damage").setContent(s);
    } else {
      XML xml = parseXML("<damage>" + s + "</damage>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setIon(String s) {
    if (weaponBlueprint.getChild("ion") != null) {
      weaponBlueprint.getChild("ion").setContent(s);
    } else {
      XML xml = parseXML("<ion>" + s + "</ion>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setPersDamage(String s) {
    if (weaponBlueprint.getChild("persDamage") != null) {
      weaponBlueprint.getChild("persDamage").setContent(s);
    } else {
      XML xml = parseXML("<persDamage>" + s + "</persDamage>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setSysDamage(String s) {
    if (weaponBlueprint.getChild("sysDamage") != null) {
      weaponBlueprint.getChild("sysDamage").setContent(s);
    } else {
      XML xml = parseXML("<sysDamage>" + s + "</sysDamage>");
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

  void setStun(String s) {
    if (weaponBlueprint.getChild("stun") != null) {
      weaponBlueprint.getChild("stun").setContent(s);
    } else {
      XML xml = parseXML("<stun>" + s + "</stun>");
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

  void setShots(String s) {
    if (weaponBlueprint.getChild("shots") != null) {
      weaponBlueprint.getChild("shots").setContent(s);
    } else {
      XML xml = parseXML("<shots>" + s + "</shots>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setMissiles(String s) {
    if (weaponBlueprint.getChild("missiles") != null) {
      weaponBlueprint.getChild("missiles").setContent(s);
    } else {
      XML xml = parseXML("<missiles>" + s + "</missiles>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setCooldown(String s) {
    if (weaponBlueprint.getChild("cooldown") != null) {
      weaponBlueprint.getChild("cooldown").setContent(s);
    } else {
      XML xml = parseXML("<cooldown>" + s + "</cooldown>");
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

  void setLength(String s) {
    if (weaponBlueprint.getChild("length") != null) {
      weaponBlueprint.getChild("length").setContent(s);
    } else {
      XML xml = parseXML("<length>" + s + "</length>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setSpeed(String s) {
    if (weaponBlueprint.getChild("speed") != null) {
      weaponBlueprint.getChild("speed").setContent(s);
    } else {
      XML xml = parseXML("<speed>" + s + "</speed>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setRadius(String s) {
    if (weaponBlueprint.getChild("radius") != null) {
      weaponBlueprint.getChild("radius").setContent(s);
    } else {
      XML xml = parseXML("<radius>" + s + "</radius>");
      weaponBlueprint.addChild(xml);
    }
  }

  void setCost(String s) {
    if (weaponBlueprint.getChild("cost") != null) {
      weaponBlueprint.getChild("cost").setContent(s);
    } else {
      XML xml = parseXML("<cost>" + s + "</cost>");
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

  void setBoost(String t, String a, String c) {
    if (weaponBlueprint.getChild("boost") != null) {
      weaponBlueprint.getChild("boost").getChild("type").setContent(t);
      weaponBlueprint.getChild("boost").getChild("amount").setContent(a);
      weaponBlueprint.getChild("boost").getChild("count").setContent(c);
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
  
  void setProjectiles(Projectile[] ps) {
    XML projectiles = parseXML("<projectiles></projectile>");
    
    for (Projectile p : ps) {
    }
  }
}