import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/icon_assets.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class MenuSectionModel {
  String? label;
  String? rightText;
  Widget? icon;
  Function? onTap;

  MenuSectionModel({this.label, this.rightText, this.icon, this.onTap});
}

class MenuSections extends StatelessWidget {
  const MenuSections({
    super.key,
    required this.headerText,
    required this.sections,
  });

  final String headerText;
  final List<MenuSectionModel> sections;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 16.0,
        right: 16.0,
        bottom: 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerText,
            style: BringooTypoGraphy.paragraph02SemiBold(
              context,
            ).copyWith(color: BringooColors.neutral[800]),
          ),
          const SizedBox(height: 8.0),
          for (final section in sections)
            _buildSectionItem(
              context: context,
              label: section.label ?? '',
              icon: section.icon,
              rightText: section.rightText ?? '',
              onTap: section.onTap,
            ),
        ],
      ),
    );
  }

  Widget _buildSectionItem({
    required BuildContext context,
    required String label,
    Widget? icon,
    String? rightText,
    Function? onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: BringooColors.neutral.shade100),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  if (icon != null)
                    Column(children: [icon, const SizedBox(width: 8.0)]),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        label,
                        style: BringooTypoGraphy.paragraph01Regular(
                          context,
                        ).copyWith(color: BringooColors.neutral[800]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                if (rightText != null)
                  Row(
                    children: [
                      Text(
                        rightText,
                        style: BringooTypoGraphy.paragraph01Regular(
                          context,
                        ).copyWith(color: BringooColors.neutral),
                      ),
                      const SizedBox(width: 8.0),
                    ],
                  ),
                SvgPicture.asset(
                  IconAssets.chevronRight,
                  color: BringooColors.neutral[800],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
