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
        angle: airplane.rotation,
        child: Container(
          width: GameConstants.airplaneSize,
          height: GameConstants.airplaneSize,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
            ),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.flight, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
