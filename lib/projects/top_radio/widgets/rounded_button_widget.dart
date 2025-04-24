import 'package:flutter/material.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';

import 'text_styles.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String content;
  final Function() onTapFunction;
  final Color backgroundColor;
  final double? borderRadius;
  final Color? textColor;
  final double? fontSize;
  final double? width;
  const RoundedButtonWidget({
    super.key,
    required this.content,
    required this.onTapFunction,
    required this.backgroundColor,
    this.borderRadius,
    this.textColor,
    this.fontSize,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextStyles.thaiTextWidget(
            title: content,
            color: textColor ?? whiteColor,
            fontSize: fontSize ?? 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
