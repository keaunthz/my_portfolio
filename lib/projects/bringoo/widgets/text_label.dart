import 'package:flutter/material.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class TextLabel extends StatelessWidget {
  const TextLabel({super.key, this.text = '', this.required = false});

  final String text;
  final bool? required;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: BringooTypoGraphy.paragraph01Regular(context)),
        if (required ?? false)
          Text(
            '*',
            style: BringooTypoGraphy.paragraph01Regular(
              context,
            ).copyWith(color: BringooColors.error),
          ),
      ],
    );
  }
}
