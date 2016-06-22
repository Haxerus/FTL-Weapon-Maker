class Projectile extends Animation {
  
  String count;
  boolean fake;

  Projectile(String name, String src, String w, String h, String fw, String fh, String t, String s, boolean b) {
    super(name, src, w, h, fw, fh, t);
    count = s;
    fake = b;
  }
}