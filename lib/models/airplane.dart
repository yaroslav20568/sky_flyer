class Airplane {
  double x;
  double y;
  double velocity;
  double rotation;

  Airplane({
    required this.x,
    required this.y,
    this.velocity = 0.0,
    this.rotation = 0.0,
  });

  void update(double gravity) {
    velocity += gravity;
    y += velocity;

    if (velocity < 0) {
      rotation = -0.3;
    } else if (velocity > 0) {
      rotation = 0.3;
    } else {
      rotation = 0.0;
    }
  }

  void jump(double jumpVelocity) {
    velocity = jumpVelocity;
  }

  Airplane copyWith({
    double? x,
    double? y,
    double? velocity,
    double? rotation,
  }) {
    return Airplane(
      x: x ?? this.x,
      y: y ?? this.y,
      velocity: velocity ?? this.velocity,
      rotation: rotation ?? this.rotation,
    );
  }
}
