class Obstacle {
  double x;
  double topHeight;
  double gap;
  double width;
  bool isPassed;

  Obstacle({
    required this.x,
    required this.topHeight,
    required this.gap,
    required this.width,
    this.isPassed = false,
  });

  double get bottomY => topHeight + gap;

  bool isOffScreen(double screenWidth) {
    return x + width < 0;
  }

  bool checkCollision(double airplaneX, double airplaneY, double airplaneSize) {
    if (airplaneX + airplaneSize < x || airplaneX > x + width) {
      return false;
    }

    if (airplaneY < topHeight || airplaneY + airplaneSize > bottomY) {
      return true;
    }

    return false;
  }

  bool checkPassed(double airplaneX) {
    if (!isPassed && airplaneX > x + width) {
      isPassed = true;
      return true;
    }
    return false;
  }

  Obstacle copyWith({
    double? x,
    double? topHeight,
    double? gap,
    double? width,
    bool? isPassed,
  }) {
    return Obstacle(
      x: x ?? this.x,
      topHeight: topHeight ?? this.topHeight,
      gap: gap ?? this.gap,
      width: width ?? this.width,
      isPassed: isPassed ?? this.isPassed,
    );
  }
}
