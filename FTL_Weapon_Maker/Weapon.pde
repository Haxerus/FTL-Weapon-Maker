class Weapon {
  
  XML weaponBlueprint; // Main blueprint tag

  Weapon(String name) {
    weaponBlueprint = parseXML("<weaponBlueprint name=\"" + name + "\"></weaponBlueprint>" );
    
    println("Successfully created " + name + " weapon");
  }

  void printXML() {
    println(weaponBlueprint);
  }
}