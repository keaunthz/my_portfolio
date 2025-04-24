import 'package:flutter/material.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class UserProfileInfoCard extends StatelessWidget {
  const UserProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: BringooTypoGraphy.subHeadingSemiBold(
                        context,
                      ).copyWith(color: BringooColors.neutral.shade800),
                    ),
                    Text(
                      "John Doe",
                      overflow: TextOverflow.ellipsis,
                      style: BringooTypoGraphy.subHeadingSemiBold(
                        context,
                      ).copyWith(color: BringooColors.neutral.shade800),
                    ),
                  ],
                ),
              ),
              Text(
                "Picker",
                style: BringooTypoGraphy.paragraph02SemiBold(
                  context,
                ).copyWith(color: BringooColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "p6892805@hotmail.com",
                  overflow: TextOverflow.ellipsis,
                  style: BringooTypoGraphy.paragraph01Regular(
                    context,
                  ).copyWith(color: BringooColors.neutral.shade400),
                ),
              ),
              Text(
                '5609812739',
                overflow: TextOverflow.ellipsis,
                style: BringooTypoGraphy.paragraph01Regular(
                  context,
                ).copyWith(color: BringooColors.neutral.shade400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
