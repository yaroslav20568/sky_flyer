import 'package:flutter/material.dart';

import 'package:sky_flyer/constants/index.dart';
import 'package:sky_flyer/models/index.dart';

class ObstacleWidget extends StatelessWidget {
  final Obstacle obstacle;
  final double screenHeight;

  const ObstacleWidget({
    super.key,
    required this.obstacle,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (screenHeight <= 0 || obstacle.topHeight <= 0) {
      return const SizedBox.shrink();
    }

    final bottomHeight = screenHeight - obstacle.bottomY;
    if (bottomHeight <= 0) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        Positioned(
          left: obstacle.x,
          top: 0,
          child: Container(
            width: obstacle.width,
            height: obstacle.topHeight.clamp(0.0, screenHeight),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.obstacleGradientTop,
              ),
              border: Border.all(color: AppColors.greenDarker, width: 4),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackWithAlpha(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CustomPaint(painter: _CloudPainter()),
          ),
        ),
        Positioned(
          left: obstacle.x,
          top: obstacle.bottomY,
          child: Container(
            width: obstacle.width,
            height: bottomHeight.clamp(0.0, screenHeight),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.obstacleGradientBottom,
              ),
              border: Border.all(color: AppColors.greenDarker, width: 4),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackWithAlpha(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: CustomPaint(painter: _CloudPainter()),
          ),
        ),
      ],
    );
  }
}

class _CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.whiteWithAlpha(0.2)
      ..style = PaintingStyle.fill;

    final cloudCount = (size.width / 30).floor();
    for (int i = 0; i < cloudCount; i++) {
      final x = (i * 30.0) + 15.0;
      final y = size.height * 0.3 + (i % 3) * 20.0;
      canvas.drawCircle(Offset(x, y), 8, paint);
      canvas.drawCircle(Offset(x + 10, y), 10, paint);
      canvas.drawCircle(Offset(x - 10, y), 8, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
