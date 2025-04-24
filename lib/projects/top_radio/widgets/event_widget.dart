import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            spreadRadius: 0,
            blurRadius: 3.3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 125,
              height: 143,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=600",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextStyles.interTextWidget(
                      textAlign: TextAlign.start,
                      title: "Music Festival 2023",
                      fontSize: 18,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    const Gap(5),
                    TextStyles.interTextWidget(
                      textAlign: TextAlign.start,
                      title: "เทศกาลดนตรีระดับนานาชาติกับศิลปินชื่อดัง",
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
