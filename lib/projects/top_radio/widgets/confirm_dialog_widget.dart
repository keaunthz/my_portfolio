import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';

import 'text_styles.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onRightButtonClick;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.description,
    this.onRightButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: greenColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(20),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: TextStyles.thaiTextWidget(
              fontSize: 20,
              title: title,
              color: whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(10),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0XFFEDEDED).withValues(alpha: 0.5),
          ),
          const Gap(10),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: TextStyles.latoTextWidget(
              fontSize: 20.0,
              title: description,
              color: whiteColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
