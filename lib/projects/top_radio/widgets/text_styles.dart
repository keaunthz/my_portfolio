import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:readmore/readmore.dart';

class TextStyles {
  static Widget normalTextWidget({
    BuildContext? context,
    required String title,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    int? maxLines,
    TextAlign? textAlign,
  }) {
    return Text(
      textAlign: textAlign,
      title,
      maxLines: maxLines,
      style: GoogleFonts.prompt(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget normalTextCenterWidget({
    BuildContext? context,
    required String title,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.prompt(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget overflowTextWidget({
    BuildContext? context,
    required String title,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    int? maxLines,
  }) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: GoogleFonts.prompt(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget readMoreTextWidget({
    BuildContext? context,
    required String title,
    double? fontSize,
    int? lineNum,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return ReadMoreText(
      title,
      style: GoogleFonts.prompt(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
      trimLines: lineNum ?? 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: '    Show less',
      lessStyle: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: greyColor.withValues(alpha: 0.5),
      ),
      moreStyle: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: greyColor.withValues(alpha: 0.5),
      ),
    );
  }

  static Widget interTextWidget({
    BuildContext? context,
    required String title,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    bool? textUnderLine,
    Color? color,
  }) {
    return Text(
      textAlign: textAlign ?? TextAlign.center,
      title,
      style: GoogleFonts.inter(
        decoration: textUnderLine == true ? TextDecoration.underline : null,
        decorationStyle:
            textUnderLine == true ? TextDecorationStyle.solid : null,
        decorationColor: textUnderLine == true ? const Color(0XFF007AFF) : null,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget montserratTextWidget({
    BuildContext? context,
    required String title,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? color,
    bool underline = false,
  }) {
    return Text(
      textAlign: textAlign ?? TextAlign.center,
      title,
      style: GoogleFonts.montserrat(
        decoration: underline ? TextDecoration.underline : null,
        decorationColor: underline ? color : null,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget latoTextWidget({
    BuildContext? context,
    required String title,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? color,
  }) {
    return Text(
      textAlign: textAlign ?? TextAlign.center,
      title,
      style: GoogleFonts.lato(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget thaiTextWidget({
    BuildContext? context,
    required String title,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? color,
  }) {
    return Text(
      textAlign: textAlign ?? TextAlign.center,
      title,
      style: GoogleFonts.kanit(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }
}
