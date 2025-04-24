import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/image_assets.dart';
import 'package:portfolio/projects/bringoo/widgets/faq_detail_page.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 60.0),
                    SvgPicture.asset(
                      ImageAssets.largeCall,
                      width: 72.0.sp,
                      height: 72.0.sp,
                    ),
                    const SizedBox(height: 24.0),
                    Text(
                      'Let us help you',
                      style: BringooTypoGraphy.subHeadingSemiBold(context),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: 280.0,
                      child: Text(
                        'Feel free to mail or call us if you have any problems after exploring all FAQs. We\'re all here for you.',
                        textAlign: TextAlign.center,
                        style: BringooTypoGraphy.paragraph01Regular(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          () => ModalUtils.showPhoneNumberCalling(context),
                      child: Text('Call Us'),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      // onPressed:
                      //     () => Get.snackbar(
                      //       'Portfolio Project',
                      //       'This is a demo - actual email functionality is not implemented',
                      //     ),
                      // onPressed:
                      //     () =>
                      //         ModalUtils.openEmailsWithComposeNewEmail(context),
                      child: Text('Send Email'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
