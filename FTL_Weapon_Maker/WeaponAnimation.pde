class WeaponAnimation extends AnimationSheet {

  XML weaponAnim;
  Animation glowAnim, boostAnim;

  WeaponAnimation(String name, String src, String w, String h, String fw, String fh, int cf, int ff, int fX, int fY, int mX, int mY) {
    super(src, name, w, h, fw, fh);

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

  WeaponAnimation(String name, String src, String glowSrc, String w, String h, String fw, String fh, int cf, int ff, int fX, int fY, int mX, int mY) {
    super(src, name, w, h, fw, fh);

    weaponAnim = parseXML("<weaponAnim name\""+animSheet.getString("name")+"></weaponAnim>");

    XML sheet = parseXML("<sheet>"+animSheet.getString("name")+"</sheet>");
    XML desc = parseXML("<desc length=\"" + (animSheet.getInt("w")/animSheet.getInt("fw")) + "\" x=\"0\" y=\"0\" />");
    XML chargedFrame = parseXML("<chargedFrame>"+cf+"</chargedFrame>");
    XML fireFrame = parseXML("<fireFrame>"+ff+"</fireFrame>");
    XML firePoint  = parseXML("<firePoint x=\""+fX+"\" y=\""+fY+"\"/>");
    XML mountPoint  = parseXML("<mountPoint x=\""+mX+"\" y=\""+mY+"\"/>");
    XML chargeImage = parseXML("<chargeImage>"+glowSrc+"</chargeImage>");

    weaponAnim.addChild(sheet);
    weaponAnim.addChild(desc);
    weaponAnim.addChild(chargedFrame);
    weaponAnim.addChild(fireFrame);
    weaponAnim.addChild(firePoint);
    weaponAnim.addChild(mountPoint);
    weaponAnim.addChild(chargeImage);
  }

  WeaponAnimation(String name, String src, String w, String h, String fw, String fh, int cf, int ff, int fX, int fY, int mX, int mY, Animation a) {
    super(name, src, w, h, fw, fh);

    boostAnim = a;

    weaponAnim = parseXML("<weaponAnim name\""+animSheet.getString("name")+"></weaponAnim>");

    XML sheet = parseXML("<sheet>"+animSheet.getString("name")+"</sheet>");
    XML desc = parseXML("<desc length=\"" + (animSheet.getInt("w")/animSheet.getInt("fw")) + "\" x=\"0\" y=\"0\" />");
    XML chargedFrame = parseXML("<chargedFrame>"+cf+"</chargedFrame>");
    XML fireFrame = parseXML("<fireFrame>"+ff+"</fireFrame>");
    XML firePoint  = parseXML("<firePoint x=\""+fX+"\" y=\""+fY+"\"/>");
    XML mountPoint  = parseXML("<mountPoint x=\""+mX+"\" y=\""+mY+"\"/>");
    XML boost = parseXML("<boost>"+a.animSheet.getString("name")+"</boost>");

    weaponAnim.addChild(sheet);
    weaponAnim.addChild(desc);
    weaponAnim.addChild(chargedFrame);
    weaponAnim.addChild(fireFrame);
    weaponAnim.addChild(firePoint);
    weaponAnim.addChild(mountPoint);
    weaponAnim.addChild(boost);
  }

  WeaponAnimation(String name, String src, String glowSrc, String w, String h, String fw, String fh, int cf, int ff, int fX, int fY, int mX, int mY, Animation a) {
    super(src, name, w, h, fw, fh);
    
    boostAnim = a;

    weaponAnim = parseXML("<weaponAnim name\""+animSheet.getString("name")+"></weaponAnim>");

    XML sheet = parseXML("<sheet>"+animSheet.getString("name")+"</sheet>");
    XML desc = parseXML("<desc length=\"" + (animSheet.getInt("w")/animSheet.getInt("fw")) + "\" x=\"0\" y=\"0\" />");
    XML chargedFrame = parseXML("<chargedFrame>"+cf+"</chargedFrame>");
    XML fireFrame = parseXML("<fireFrame>"+ff+"</fireFrame>");
    XML firePoint  = parseXML("<firePoint x=\""+fX+"\" y=\""+fY+"\"/>");
    XML mountPoint  = parseXML("<mountPoint x=\""+mX+"\" y=\""+mY+"\"/>");
    XML chargeImage = parseXML("<chargeImage>"+glowSrc+"</chargeImage>");
    XML boost = parseXML("<boost>"+a.animSheet.getString("name")+"</boost>");

    weaponAnim.addChild(sheet);
    weaponAnim.addChild(desc);
    weaponAnim.addChild(chargedFrame);
    weaponAnim.addChild(fireFrame);
    weaponAnim.addChild(firePoint);
    weaponAnim.addChild(mountPoint);
    weaponAnim.addChild(chargeImage);
    weaponAnim.addChild(boost);
  }
}