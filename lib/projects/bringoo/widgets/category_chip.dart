import 'package:flutter/material.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    this.label = '',
    this.backgroundColor = Colors.white,
    this.borderColor = BringooColors.primary,
  });

  final String label;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: backgroundColor,
      label: Text(
        label,
        style: BringooTypoGraphy.captionRegular(
          context,
        ).copyWith(color: BringooColors.primary),
      ),
      shape: StadiumBorder(side: BorderSide(width: 1, color: borderColor)),
    );
  }
}
