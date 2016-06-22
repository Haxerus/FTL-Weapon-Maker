class AnimationSheet {

  PImage strip, frame;
  PGraphics buffer;
  int i, last;

  XML animSheet;

  AnimationSheet(String src, String name, String w, String h, String fw, String fh) {
    animSheet = parseXML("<animSheet name=\""+name+"\" w=\""+w+"\" h=\""+h+"\" fw=\""+fw+"\" fh=\""+fh+"\">"+src+"</animSheet>");

    strip = loadImage(modDir + "/img/" + src);
    buffer = createGraphics(Integer.parseInt(fw), Integer.parseInt(fh));
  }

  void renderAnim() {
    buffer.beginDraw();
    if (millis() - last >= frameRate) {
      last = millis();
      if (i > 11) {
        i = 0;
      } else {
        frame = strip.get(i * animSheet.getInt("fw"), 0, animSheet.getInt("fw"), animSheet.getInt("fh"));
        i++;
      }
    }
    image(frame, width - 80, height - 200);
    buffer.endDraw();
  }
}