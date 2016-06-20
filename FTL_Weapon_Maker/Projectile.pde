class Projectile {
  
  XML projectile;
  
  Projectile (Animation a, int i, boolean b) {
    projectile = parseXML("<projectile count=\""+i+"\" fake=\""+b+"\">"+a.animSheet.getString("name")+"</projectile>");
  }
}