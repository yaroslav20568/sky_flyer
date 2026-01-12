import 'package:flutter/material.dart';

import 'package:sky_flyer/constants/index.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.startScreenGradient,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.whiteWithAlpha(0.2),
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 3),
              ),
              child: Transform.rotate(
                angle: 1.5708,
                child: const Icon(
                  Icons.flight,
                  size: 80,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'SKY FLYER',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                letterSpacing: 4,
                shadows: [
                  Shadow(
                    offset: Offset(3, 3),
                    blurRadius: 8,
                    color: AppColors.black54,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                color: AppColors.whiteWithAlpha(0.2),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.white, width: 2),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.touch_app, color: AppColors.white, size: 28),
                  SizedBox(width: 12),
                  Text(
                    'Tap to Start',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
