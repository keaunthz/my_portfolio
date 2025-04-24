import 'package:flutter/material.dart';
import 'package:portfolio/projects/bringoo/widgets/available_job_item.dart';
import 'package:portfolio/projects/bringoo/widgets/user_profile_info_card.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BringooColors.neutral.shade50,
      child: SafeArea(
        child: Column(
          children: [
            UserProfileInfoCard(),
            // Expanded(child: _buildEmptyLocation()),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildSelectAreaSection(context),
                      SizedBox(height: 25),
                      _buildAvailableJobsSection(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectAreaSection(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Selected Areas',
              style: BringooTypoGraphy.paragraph03Regular(
                context,
              ).copyWith(color: BringooColors.neutral.shade800),
            ),
            Text(
              "Manage Areas",
              style: BringooTypoGraphy.paragraph02SemiBold(
                context,
              ).copyWith(color: BringooColors.primary),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          width: double.infinity,

          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAreaSection(
                label: "Lidl",
                text: "3.2km · Leipziger Str. 42, 10117 Berlin, Germany",
                context: context,
              ),
              SizedBox(height: 18),
              _buildAreaSection(
                label: "REWE City",
                text: "3km · Friedrichstraße 67-70, 10117 Berlin, Germany",
                context: context,
              ),
              SizedBox(height: 18),
              _buildAreaSection(
                label: "Store A",
                text: "4km · Krausenstraße, 10117 Berlin, Germany",
                context: context,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAreaSection({
    required String label,
    required String text,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: BringooTypoGraphy.headline06SemiBold(
            context,
          ).copyWith(color: BringooColors.primary),
        ),
        Text(
          text,
          style: BringooTypoGraphy.captionRegular(
            context,
          ).copyWith(color: BringooColors.neutral.shade600),
        ),
      ],
    );
  }

  Widget _buildAvailableJobsSection(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Available Jobs',
              style: BringooTypoGraphy.paragraph03Regular(
                context,
              ).copyWith(color: BringooColors.neutral.shade800),
            ),
            Text(
              "See Job List",
              style: BringooTypoGraphy.paragraph02SemiBold(
                context,
              ).copyWith(color: BringooColors.primary),
            ),
          ],
        ),
        SizedBox(height: 16),
        AvailableJobItem(),
      ],
    );
  }
}
