import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController inputController;
  final String labelName;
  final String hintText;
  final String validationErrorMsg;
  final int? maxLine;
  final Widget? left;
  final String? headerText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Widget? right;
  const TextInputWidget({
    super.key,
    required this.inputController,
    required this.labelName,
    required this.hintText,
    required this.validationErrorMsg,
    this.maxLine,
    this.left,
    this.headerText,
    this.hintStyle,
    this.labelStyle,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (headerText != null)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 18,
                ),
                child: TextStyles.thaiTextWidget(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  title: headerText ?? "",
                  color: blackColor,
                ),
              ),
            ],
          ),
        Padding(
          padding:
              headerText != null
                  ? const EdgeInsets.symmetric(horizontal: 16.0)
                  : EdgeInsets.zero,
          child: TextFormField(
            style: GoogleFonts.kanit(
              fontSize: 16,
              color: const Color(0XFF2E2525),
            ),
            controller: inputController,
            maxLines: maxLine ?? 1,
            cursorColor: greyColor,
            validator: (value) {
              if (value == null || value.toString().trim().isEmpty) {
                return validationErrorMsg;
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              prefixIcon: left,
              suffixIcon: right,
              alignLabelWithHint: true,
              hintText: hintText,
              labelStyle:
                  labelStyle ??
                  GoogleFonts.kanit(
                    fontSize: 16,
                    color: const Color(0XFF2E2525),
                  ),
              hintStyle:
                  hintStyle ??
                  GoogleFonts.kanit(
                    fontSize: 16,
                    color: const Color(0XFF2E2525),
                  ),
              errorStyle: GoogleFonts.kanit(
                fontSize: 12,
                color: Theme.of(context).colorScheme.error,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  headerText != null ? 6.0 : 10.0,
                ),
                borderSide:
                    headerText != null
                        ? const BorderSide(color: Color(0XFF787878), width: 1.0)
                        : BorderSide.none, // Hide the border
              ),
              filled: true,
              fillColor: whiteColor, // Background color
            ),
          ),
        ),
      ],
    );
  }
}
