import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/projects/bringoo/models/job_model.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class JobCardItem extends StatelessWidget {
  final JobModel job;
  const JobCardItem({super.key, required this.job});

  String getStringBadge(String status) {
    switch (status) {
      case "available":
        return "Available";
      case "inprogress":
        return "In Progress";
      case "done":
        return "Done";
      case "called":
        return "Cancelled";
      default:
        return "";
    }
  }

  Color getColorBadge(String status) {
    switch (status) {
      case "available":
        return BringooColors.primary.shade50;
      case "inprogress":
        return BringooColors.warning.shade50;
      case "done":
        return BringooColors.darkBlue.shade50;
      case "called":
        return BringooColors.error.shade50;
      default:
        return Colors.white;
    }
  }

  Color getColorText(String status) {
    switch (status) {
      case "available":
        return BringooColors.primary;
      case "inprogress":
        return BringooColors.warning;
      case "done":
        return BringooColors.darkBlue;
      case "called":
        return BringooColors.error;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      width: double.infinity,

      padding: EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          CircleAvatar(radius: 25, backgroundImage: NetworkImage(job.imageUrl)),
          SizedBox(width: 14),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: getColorBadge(job.status),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    getStringBadge(job.status),
                    style: BringooTypoGraphy.smallSemibold(
                      context,
                    ).copyWith(color: getColorText(job.status)),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  job.shopName,
                  style: BringooTypoGraphy.paragraph01SemiBold(
                    context,
                  ).copyWith(color: BringooColors.neutral.shade800),
                ),
                SizedBox(height: 6),
                Text(
                  job.jobId,
                  style: BringooTypoGraphy.smallSemibold(
                    context,
                  ).copyWith(color: BringooColors.neutral.shade500),
                ),
                Text(
                  DateFormat('d MMM y, h:mm a').format(job.date),
                  style: BringooTypoGraphy.smallSemibold(
                    context,
                  ).copyWith(color: BringooColors.neutral.shade500),
                ),
                SizedBox(height: 15),
                job.status == "available"
                    ? Row(
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
                    )
                    : Container(
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
                          "View Details",
                          style: BringooTypoGraphy.paragraph01SemiBold(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
