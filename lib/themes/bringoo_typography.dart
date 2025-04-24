import 'package:flutter/material.dart';
import 'package:portfolio/themes/bringoo_colors.dart';

class BringooTypoGraphy {
  static TextStyle headline01Regular(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall!.copyWith(
      color: BringooColors.neutral.shade900,
      fontSize: 34.0,
    );
  }

  static TextStyle headline01Semibold(BuildContext context) {
    return BringooTypoGraphy.headline01Regular(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle headline01Bold(BuildContext context) {
    return BringooTypoGraphy.headline01Regular(
      context,
    ).copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle headline02Regular(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
      color: BringooColors.neutral.shade900,
      fontSize: 33.0,
    );
  }

  static TextStyle headline02Semibold(BuildContext context) {
    return BringooTypoGraphy.headline02Regular(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle headline02Bold(BuildContext context) {
    return BringooTypoGraphy.headline02Regular(
      context,
    ).copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle headline03Regular(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
      color: BringooColors.neutral.shade900,
      fontSize: 28.0,
    );
  }

  static TextStyle headline03SemiBold(BuildContext context) {
    return BringooTypoGraphy.headline03Regular(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle headline03Bold(BuildContext context) {
    return BringooTypoGraphy.headline03Regular(
      context,
    ).copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle headline04Light(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
      color: BringooColors.neutral.shade900,
      fontSize: 23.0,
    );
  }

  static TextStyle headline04SemiBold(BuildContext context) {
    return BringooTypoGraphy.headline04Light(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle headline04Bold(BuildContext context) {
    return BringooTypoGraphy.headline04Light(
      context,
    ).copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle headline05Light(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
      color: BringooColors.neutral.shade900,
      fontSize: 19.0,
    );
  }

  static TextStyle headline05SemiBold(BuildContext context) {
    return BringooTypoGraphy.headline05Light(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle headline05Bold(BuildContext context) {
    return BringooTypoGraphy.headline05Light(
      context,
    ).copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle headline06Light(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
      color: BringooColors.neutral.shade900,
      fontSize: 16.0,
    );
  }

  static TextStyle headline06SemiBold(BuildContext context) {
    return BringooTypoGraphy.headline06Light(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle headline06Bold(BuildContext context) {
    return BringooTypoGraphy.headline06Light(
      context,
    ).copyWith(fontWeight: FontWeight.w700);
  }

  static TextStyle subHeadingRegular(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
      color: BringooColors.neutral.shade800,
      fontSize: 20.0,
    );
  }

  static TextStyle subHeadingSemiBold(BuildContext context) {
    return BringooTypoGraphy.subHeadingRegular(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle subHeadingUnderline(BuildContext context) {
    return BringooTypoGraphy.subHeadingRegular(
      context,
    ).copyWith(decoration: TextDecoration.underline);
  }

  static TextStyle paragraph01Regular(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: BringooColors.neutral.shade900,
      fontSize: 14.0,
    );
  }

  static TextStyle paragraph01SemiBold(BuildContext context) {
    return BringooTypoGraphy.paragraph01Regular(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle paragraph01Underline(BuildContext context) {
    return BringooTypoGraphy.paragraph01Regular(
      context,
    ).copyWith(decoration: TextDecoration.underline);
  }

  static TextStyle paragraph02Regular(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: BringooColors.neutral.shade800,
      fontSize: 16.0,
    );
  }

  static TextStyle paragraph02SemiBold(BuildContext context) {
    return BringooTypoGraphy.paragraph02Regular(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle paragraph02Underline(BuildContext context) {
    return BringooTypoGraphy.paragraph02Regular(
      context,
    ).copyWith(decoration: TextDecoration.underline);
  }

  static TextStyle paragraph03Regular(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: BringooColors.neutral.shade900,
      fontSize: 18.0,
    );
  }

  static TextStyle paragraph03SemiBold(BuildContext context) {
    return BringooTypoGraphy.paragraph03Regular(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle paragraph03Underline(BuildContext context) {
    return BringooTypoGraphy.paragraph03Regular(
      context,
    ).copyWith(decoration: TextDecoration.underline);
  }

  static TextStyle captionRegular(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
      color: BringooColors.neutral,
      fontSize: 12.0,
    );
  }

  static TextStyle captionSemiBold(BuildContext context) {
    return BringooTypoGraphy.captionRegular(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }

  static TextStyle captionLight(BuildContext context) {
    return BringooTypoGraphy.captionRegular(
      context,
    ).copyWith(fontWeight: FontWeight.w300);
  }

  static TextStyle smallLight(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
      color: BringooColors.neutral.shade900,
      fontSize: 10.0,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle smallRegular(BuildContext context) {
    return BringooTypoGraphy.smallLight(
      context,
    ).copyWith(fontWeight: FontWeight.w400);
  }

  static TextStyle smallSemibold(BuildContext context) {
    return BringooTypoGraphy.smallLight(
      context,
    ).copyWith(fontWeight: FontWeight.w600);
  }
}
