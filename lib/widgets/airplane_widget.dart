import 'package:flutter/material.dart';

import 'package:sky_flyer/constants/index.dart';
import 'package:sky_flyer/models/index.dart';

class AirplaneWidget extends StatelessWidget {
  final Airplane airplane;

  const AirplaneWidget({super.key, required this.airplane});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: airplane.x,
      top: airplane.y,
      child: Transform.rotate(
        angle: 1.5708 + airplane.rotation,
        child: Container(
          width: GameConstants.airplaneSize,
          height: GameConstants.airplaneSize,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.airplaneGradient,
            ),
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackWithAlpha(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.flight, color: AppColors.white, size: 30),
        ),
      ),
    );
  }
}
