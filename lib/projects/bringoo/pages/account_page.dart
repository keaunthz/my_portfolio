import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/icon_assets.dart';
import 'package:portfolio/projects/bringoo/widgets/change_password.dart';
import 'package:portfolio/projects/bringoo/widgets/edit_phone_number_page.dart';
import 'package:portfolio/projects/bringoo/widgets/edit_user_profile.dart';
import 'package:portfolio/projects/bringoo/widgets/faq_page.dart';
import 'package:portfolio/projects/bringoo/widgets/user_info_section.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void onLogOutPressed() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Log out?"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            CupertinoDialogAction(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              textStyle: const TextStyle(color: BringooColors.error),
              child: Text("Logout"),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.of(context).pop();
                // _authProvider
                //     .requestSignOut()
                //     .catchError((error) {
                //       debugPrint('error handle');
                //     })
                //     .whenComplete(() {
                //       _authManager.logout();
                //       removeUserProfile();
                //       Get.offAll(() => OnBoard());
                //     });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final userProfile = getUserProfile();
    return Container(
      color: BringooColors.primary[50],
      child: SafeArea(
        child: Container(
          color: BringooColors.neutral[50],
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              UserInfoSection(
                onEditProfilePressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditUserProfile(),
                      ),
                    ).then((value) {
                      setState(() {});
                    }),
                onUpdatePhonePressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPhoneNumberPage(),
                      ),
                    ).then((value) {
                      setState(() {});
                    }),
              ),
              _buildSection(
                headerText: 'Settings',
                child: Column(
                  children: [
                    _buildSectionItem(
                      icon: IconAssets.locked,
                      label: 'Change Password',
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(),
                            ),
                          ).then((value) {
                            setState(() {});
                          }),
                    ),
                    _buildSectionItem(
                      icon: IconAssets.world,
                      rightText: "English",
                      label: 'Languages',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              _buildSection(
                headerText: 'Support',
                child: Column(
                  children: [
                    _buildSectionItem(
                      icon: IconAssets.balloonMessage,
                      label: 'FAQs',
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FAQPage()),
                          ),
                    ),
                    _buildSectionItem(
                      icon: IconAssets.call,
                      label: 'Contact Us',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                width: double.infinity,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    children: [
                      SvgPicture.asset(IconAssets.logout),
                      const SizedBox(width: 8.0),
                      Text(
                        'Log out',
                        style: BringooTypoGraphy.paragraph01SemiBold(
                          context,
                        ).copyWith(color: BringooColors.error),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String headerText, Widget? child}) {
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
          child ?? Container(),
        ],
      ),
    );
  }

  Widget _buildSectionItem({
    required String icon,
    required String label,
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
            Row(
              children: [
                SvgPicture.asset(icon, width: 16.0, height: 16.0),
                const SizedBox(width: 8.0),
                Text(
                  label,
                  style: BringooTypoGraphy.paragraph01Regular(
                    context,
                  ).copyWith(color: BringooColors.neutral[800]),
                ),
              ],
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
