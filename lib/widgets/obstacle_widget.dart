import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        Positioned(
          left: obstacle.x,
          top: 0,
          child: Container(
            width: obstacle.width,
            height: obstacle.topHeight,
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              border: Border.all(color: Colors.green.shade900, width: 3),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
        ),
        Positioned(
          left: obstacle.x,
          top: obstacle.bottomY,
          child: Container(
            width: obstacle.width,
            height: screenHeight - obstacle.bottomY,
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              border: Border.all(color: Colors.green.shade900, width: 3),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
