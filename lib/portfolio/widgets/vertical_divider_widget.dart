import 'package:flutter/material.dart';
import 'package:portfolio/themes/bringoo_colors.dart';

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            BringooColors.oceanTeal.withValues(alpha: 0.6),
            BringooColors.oceanTeal.withValues(alpha: 0.8),
            BringooColors.oceanTeal,
            BringooColors.oceanTeal.withValues(alpha: 0.8),
            BringooColors.oceanTeal.withValues(alpha: 0.6),
            Colors.transparent,
          ],
          stops: [0.0, 0.2, 0.4, 0.5, 0.6, 0.8, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: BringooColors.oceanTeal.withValues(alpha: 0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
