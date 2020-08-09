class SizeScreenHelper {

  static double getWidthByWidthScreen(double size) {
    double width = 0;

    if (size > 400) {
      width = size * 0.19;
    } else {
      width = size * 0.16;
    }
    return width;
  }

  static double getHeightByHeightScreen(double size) {
    double height = 0;

    if (size > 540) {
      height = size * 0.15;
    } else {
      height = size * 0.12;
    }
    return height;
  }

}
