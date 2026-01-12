import 'package:flutter/material.dart';

import '../constants/index.dart';
import '../models/index.dart';

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
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 3),
          ),
          child: const Icon(Icons.flight, color: Colors.blue, size: 30),
        ),
      ),
    );
  }
}
