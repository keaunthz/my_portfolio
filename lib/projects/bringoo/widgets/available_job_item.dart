import 'package:flutter/material.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class AvailableJobItem extends StatelessWidget {
  const AvailableJobItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      width: double.infinity,

      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=80",
            ),
          ),
          SizedBox(width: 14),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: BringooColors.primary.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Available",
                    style: BringooTypoGraphy.smallSemibold(
                      context,
                    ).copyWith(color: BringooColors.primary),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "GP Niendorfer Getrankemarkt Kieler StraBe",
                  style: BringooTypoGraphy.paragraph01SemiBold(
                    context,
                  ).copyWith(color: BringooColors.neutral.shade800),
                ),
                SizedBox(height: 6),
                Text(
                  "3588839",
                  style: BringooTypoGraphy.smallSemibold(
                    context,
                  ).copyWith(color: BringooColors.neutral.shade500),
                ),
                Text(
                  "8 Mar 2022, 4.20PM",
                  style: BringooTypoGraphy.smallSemibold(
                    context,
                  ).copyWith(color: BringooColors.neutral.shade500),
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: BringooColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Accept Picker",
                            style: BringooTypoGraphy.paragraph01SemiBold(
                              context,
                            ).copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: BringooColors.primary),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: BringooTypoGraphy.paragraph01SemiBold(
                              context,
                            ).copyWith(color: BringooColors.primary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
