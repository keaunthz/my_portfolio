import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/image_assets.dart';
import 'package:portfolio/projects/bringoo/models/faq_topic.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class FaqDetailPage extends StatelessWidget {
  const FaqDetailPage({
    super.key,
    required this.parentGroupName,
    required this.faqTopicItem,
  });

  final String parentGroupName;
  final FaqTopicItem faqTopicItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAQs')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: BringooColors.primary[50],
                      child: Stack(
                        children: [
                          Positioned(
                            top: -30,
                            left: 0,
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: SvgPicture.asset(
                                ImageAssets.bringooPattern,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -30,
                            right: 0,
                            child: SvgPicture.asset(ImageAssets.bringooPattern),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              top: 22.0,
                              right: 16.0,
                              bottom: 18.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  parentGroupName,
                                  style: BringooTypoGraphy.paragraph02SemiBold(
                                    context,
                                  ).copyWith(color: BringooColors.neutral),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  faqTopicItem.name ?? '',
                                  style: BringooTypoGraphy.paragraph03SemiBold(
                                    context,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        faqTopicItem.description ?? '',
                        style: BringooTypoGraphy.paragraph01Regular(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 18.0,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: BringooColors.neutral.shade100,
                    width: 1.0,
                  ),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // ModalUtils.showPhoneNumberCalling(context);
                },
                child: Text('Contact Us'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModalUtils {
  static void showPhoneNumberCalling(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder:
          (BuildContext context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                child: Text(
                  'Call (66) 85-5988344',
                  style: const TextStyle(color: Color(0xFF007AFF)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // launchUrl(
                  //   Uri(scheme: 'tel', path: BringooAsset.telephoneNumber),
                  // );
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: const TextStyle(color: BringooColors.error),
              ),
            ),
          ),
    );
  }
}
