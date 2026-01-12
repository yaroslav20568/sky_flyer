import 'package:flutter/material.dart';

class AppColors {
  static const Color skyBlue = Color(0xFF87CEEB);
  static const Color lightSkyBlue = Color(0xFFE0F6FF);
  static const Color startScreenBlueTop = Color(0xFF42A5F5);
  static const Color startScreenBlueBottom = Color(0xFF81D4FA);

  static const Color airplaneBlueStart = Color(0xFF4A90E2);
  static const Color airplaneBlueEnd = Color(0xFF357ABD);

  static const Color greenDark = Color(0xFF2E7D32);
  static const Color greenMedium = Color(0xFF43A047);
  static const Color greenDarker = Color(0xFF1B5E20);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color black54 = Colors.black54;
  static const Color amber = Colors.amber;

  static Color whiteWithAlpha(double alpha) =>
      Colors.white.withValues(alpha: alpha);
  static Color blackWithAlpha(double alpha) =>
      Colors.black.withValues(alpha: alpha);

  static const List<Color> gameScreenGradient = [skyBlue, lightSkyBlue];
  static const List<Color> startScreenGradient = [
    startScreenBlueTop,
    startScreenBlueBottom,
  ];
  static const List<Color> airplaneGradient = [
    airplaneBlueStart,
    airplaneBlueEnd,
  ];
  static List<Color> obstacleGradientTop = [greenDark, greenMedium];
  static List<Color> obstacleGradientBottom = [greenMedium, greenDark];
}
