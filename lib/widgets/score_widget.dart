import 'package:flutter/material.dart';

import 'package:sky_flyer/constants/index.dart';

class ScoreWidget extends StatelessWidget {
  final int score;

  const ScoreWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.blackWithAlpha(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.whiteWithAlpha(0.3),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: AppColors.amber, size: 24),
          const SizedBox(width: 8),
          Text(
            '$score',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
