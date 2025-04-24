import 'package:flutter/material.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class RowBetweenLabel extends StatelessWidget {
  const RowBetweenLabel({super.key, this.label, this.value});

  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label ?? '',
          style: BringooTypoGraphy.paragraph01SemiBold(context),
        ),
        Text(
          value ?? '',
          style: BringooTypoGraphy.paragraph01SemiBold(context),
        ),
      ],
    );
  }
}
