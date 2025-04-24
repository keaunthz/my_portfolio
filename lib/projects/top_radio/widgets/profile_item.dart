import 'package:flutter/material.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart';

class ProfileItem extends StatelessWidget {
  final String content;
  final Function() tap;
  const ProfileItem(this.content, this.tap, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: greyLightColor.withValues(alpha: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextStyles.thaiTextWidget(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                title: content,
                color: whiteColor,
              ),
              const Icon(Icons.keyboard_arrow_right, color: whiteColor),
            ],
          ),
        ),
      ),
    );
  }
}
