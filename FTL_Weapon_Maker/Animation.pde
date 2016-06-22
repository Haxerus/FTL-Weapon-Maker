class Animation extends AnimationSheet {

  XML anim;

  Animation(String name, String src, String w, String h, String fw, String fh, String t) {
    super(src, name, w, h, fw, fh);

    anim = parseXML("<anim name\""+animSheet.getString("name")+"></anim>");

    XML sheet = parseXML("<sheet>"+animSheet.getString("name")+"</sheet>");
    XML desc = parseXML("<desc length=\"" + (animSheet.getInt("w")/animSheet.getInt("fw")) + "\" x=\"0\" y=\"0\"");
    XML time = parseXML("<time>"+t+"</time>");

    anim.addChild(sheet);
    anim.addChild(desc);
    anim.addChild(time);
  }
}