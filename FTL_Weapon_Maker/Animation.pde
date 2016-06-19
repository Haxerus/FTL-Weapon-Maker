class Animation {

  XML animSheet, weaponAnim, anim;

  Animation(String name, String src, int w, int h, int fw, int fh) {
    animSheet = parseXML("<animSheet name=\""+name+"\" w=\""+w+"\" h=\""+h+"\" fw=\""+fw+"\" fh=\""+fh+"\">"+src+"</animSheet>");
  }

  void setWeaponAnim(int cf, int ff, int fX, int fY, int mX, int mY) {
    weaponAnim = parseXML("<weaponAnim name\""+animSheet.getString("name")+"></weaponAnim>");

    XML sheet = parseXML("<sheet>"+animSheet.getString("name")+"</sheet>");
    XML desc = parseXML("<desc length=\"" + (animSheet.getInt("w")/animSheet.getInt("fw")) + "\" x=\"0\" y=\"0\" />");
    XML chargedFrame = parseXML("<chargedFrame>"+cf+"</chargedFrame>");
    XML fireFrame = parseXML("<fireFrame>"+ff+"</fireFrame>");
    XML firePoint  = parseXML("<firePoint x=\""+fX+"\" y=\""+fY+"\"/>");
    XML mountPoint  = parseXML("<mountPoint x=\""+mX+"\" y=\""+mY+"\"/>");
    
    weaponAnim.addChild(sheet);
    weaponAnim.addChild(desc);
    weaponAnim.addChild(chargedFrame);
    weaponAnim.addChild(fireFrame);
    weaponAnim.addChild(firePoint);
    weaponAnim.addChild(mountPoint);
  }

  void setWeaponAnim(int cf, int ff, int fX, int fY, int mX, int mY, String glowImage) {
    weaponAnim = parseXML("<weaponAnim name\""+animSheet.getString("name")+"></weaponAnim>");

    XML sheet = parseXML("<sheet>"+animSheet.getString("name")+"</sheet>");
    XML desc = parseXML("<desc length=\"" + (animSheet.getInt("w")/animSheet.getInt("fw")) + "\" x=\"0\" y=\"0\"");
    XML chargedFrame = parseXML("<chargedFrame>"+cf+"</chargedFrame>");
    XML fireFrame = parseXML("<fireFrame>"+ff+"</fireFrame>");
    XML firePoint  = parseXML("<firePoint x=\""+fX+"\" y=\""+fY+"\"/>");
    XML mountPoint  = parseXML("<mountPoint x=\""+mX+"\" y=\""+mY+"\"/>");
    XML chargeImage = parseXML("<chargeImage>"+glowImage+"</chargeImage>");
    
    weaponAnim.addChild(sheet);
    weaponAnim.addChild(desc);
    weaponAnim.addChild(chargedFrame);
    weaponAnim.addChild(fireFrame);
    weaponAnim.addChild(firePoint);
    weaponAnim.addChild(mountPoint);
    weaponAnim.addChild(chargeImage);
  }

  void setWeaponAnim(int cf, int ff, int fX, int fY, int mX, int mY, Animation boostAnim) {
    weaponAnim = parseXML("<weaponAnim name\""+animSheet.getString("name")+"></weaponAnim>");

    XML sheet = parseXML("<sheet>"+animSheet.getString("name")+"</sheet>");
    XML desc = parseXML("<desc length=\"" + (animSheet.getInt("w")/animSheet.getInt("fw")) + "\" x=\"0\" y=\"0\"");
    XML chargedFrame = parseXML("<chargedFrame>"+cf+"</chargedFrame>");
    XML fireFrame = parseXML("<fireFrame>"+ff+"</fireFrame>");
    XML firePoint  = parseXML("<firePoint x=\""+fX+"\" y=\""+fY+"\"/>");
    XML mountPoint  = parseXML("<mountPoint x=\""+mX+"\" y=\""+mY+"\"/>");
    XML boost = parseXML("<sheet>"+boostAnim.animSheet.getString("name")+"</sheet>");
    
    weaponAnim.addChild(sheet);
    weaponAnim.addChild(desc);
    weaponAnim.addChild(chargedFrame);
    weaponAnim.addChild(fireFrame);
    weaponAnim.addChild(firePoint);
    weaponAnim.addChild(mountPoint);
    weaponAnim.addChild(boost);
  } 

  void setWeaponAnim(int cf, int ff, int fX, int fY, int mX, int mY, String glowImage, Animation boostAnim) {
    weaponAnim = parseXML("<weaponAnim name\""+animSheet.getString("name")+"></weaponAnim>");

    XML sheet = parseXML("<sheet>"+animSheet.getString("name")+"</sheet>");
    XML desc = parseXML("<desc length=\"" + (animSheet.getInt("w")/animSheet.getInt("fw")) + "\" x=\"0\" y=\"0\"");
    XML chargedFrame = parseXML("<chargedFrame>"+cf+"</chargedFrame>");
    XML fireFrame = parseXML("<fireFrame>"+ff+"</fireFrame>");
    XML firePoint  = parseXML("<firePoint x=\""+fX+"\" y=\""+fY+"\"/>");
    XML mountPoint  = parseXML("<mountPoint x=\""+mX+"\" y=\""+mY+"\"/>");
    XML chargeImage = parseXML("<chargeImage>"+glowImage+"</chargeImage>");
    XML boost = parseXML("<sheet>"+boostAnim.animSheet.getString("name")+"</sheet>");
    
    weaponAnim.addChild(sheet);
    weaponAnim.addChild(desc);
    weaponAnim.addChild(chargedFrame);
    weaponAnim.addChild(fireFrame);
    weaponAnim.addChild(firePoint);
    weaponAnim.addChild(mountPoint);
    weaponAnim.addChild(chargeImage);
    weaponAnim.addChild(boost);
  } 

  void setAnim(float t) {
    anim = parseXML("<anim name\""+animSheet.getString("name")+"></anim>");
    
    XML sheet = parseXML("<sheet>"+animSheet.getString("name")+"</sheet>");
    XML desc = parseXML("<desc length=\"" + (animSheet.getInt("w")/animSheet.getInt("fw")) + "\" x=\"0\" y=\"0\"");
    XML time = parseXML("<time>"+t+"</time>");
    
    anim.addChild(sheet);
    anim.addChild(desc);
    anim.addChild(time);
  }
}