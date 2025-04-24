import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/icon_assets.dart';
import 'package:portfolio/portfolio/data/portfolio.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class ProjectDetailWidget extends StatelessWidget {
  final Project project;
  const ProjectDetailWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              project.icon,
              width: 40,
              color: BringooColors.oceanTeal,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                project.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: BringooColors.oceanTeal.shade800,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          project.description,
          style: BringooTypoGraphy.paragraph02Regular(
            context,
          ).copyWith(color: BringooColors.neutral.shade600),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Key Features',
                style: BringooTypoGraphy.headline02Semibold(
                  context,
                ).copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...project.features.map((feature) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: BringooColors.oceanTeal.shade100,
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(6),
                      child: Center(
                        child: SvgPicture.asset(
                          feature.icon,
                          width: 30,
                          color: BringooColors.oceanTeal,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            feature.title,
                            style: BringooTypoGraphy.paragraph01SemiBold(
                              context,
                            ).copyWith(fontSize: 16),
                          ),
                          Text(
                            feature.description,
                            style: BringooTypoGraphy.paragraph01Regular(
                              context,
                            ).copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,

            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tech Stack',
                style: BringooTypoGraphy.headline02Semibold(
                  context,
                ).copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children:
                    project.technologies.map((tech) {
                      return Chip(
                        label: Text(
                          tech,
                          style: BringooTypoGraphy.captionRegular(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                        backgroundColor: BringooColors.darkBlue.shade600,
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: BringooColors.oceanTeal.shade100,
            border: Border.all(color: BringooColors.oceanTeal, width: 1),
          ),
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                IconAssets.warningIcon,
                width: 20,
                color: BringooColors.oceanTeal.shade800,
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  "Try the interactive preview to explore some of the app's features! Please note that this is a demo version created solely for portfolio purposes.The live preview showcases only a selection of UI components and does not represent the full functionality of the actual application.",
                  style: BringooTypoGraphy.paragraph01SemiBold(
                    context,
                  ).copyWith(color: BringooColors.oceanTeal.shade800),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
