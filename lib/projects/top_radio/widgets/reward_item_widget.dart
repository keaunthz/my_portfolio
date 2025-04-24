import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/projects/top_radio/constants/icon_constants.dart';
import 'package:portfolio/projects/top_radio/models/reward_model.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart'
    show TextStyles;

class RewardItemWidget extends StatelessWidget {
  const RewardItemWidget({
    super.key,
    required this.item,
    this.onItemTap,
    this.isAnnounced = false,
  });

  final RewardModel item;
  final Function()? onItemTap;
  final bool isAnnounced;
  String calculateTimeLeft(DateTime endDate) {
    DateTime currentDate = DateTime.now();

    Duration difference = endDate.difference(currentDate);

    if (difference.inDays == 0) {
      return "วันสุดท้าย";
    }

    int daysLeft = difference.inDays;
    return "เหลือเวลาอีก $daysLeft วัน";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTap?.call(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Container(
          color: whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1920 / 1080,
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Padding(
                        padding:
                            isAnnounced
                                ? const EdgeInsetsDirectional.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                )
                                : const EdgeInsets.all(8.0),
                        child: TextStyles.thaiTextWidget(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          title: isAnnounced ? "ผู้โชคดี" : item.endDate,
                          color: redColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyles.normalTextWidget(
                      title: item.title,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF34495E),
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        SvgPicture.asset(
                          IconConstants.clock,
                          width: 17,
                          height: 17,
                        ),
                        const Gap(10),
                        TextStyles.normalTextWidget(
                          title: "${item.startDate} - ${item.endDate}",
                          fontSize: 14,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
