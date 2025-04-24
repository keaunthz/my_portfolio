import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/constants/icon_assets.dart';
import 'package:portfolio/constants/image_assets.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({
    super.key,
    this.onEditProfilePressed,
    this.onUpdatePhonePressed,
  });

  final Function? onEditProfilePressed;
  final Function? onUpdatePhonePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BringooColors.primary[50],
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(ImageAssets.bringooPattern),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(ImageAssets.userPlaceholder),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Picker",
                            style: BringooTypoGraphy.paragraph01SemiBold(
                              context,
                            ).copyWith(color: BringooColors.primary),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  'John Doe',
                                  style: BringooTypoGraphy.headline04SemiBold(
                                    context,
                                  ).copyWith(color: BringooColors.neutral[800]),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'ID 5609812739',
                            style: BringooTypoGraphy.paragraph01SemiBold(
                              context,
                            ).copyWith(color: BringooColors.neutral[700]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                LabelWithVerifiedMark(
                  label: 'Email',
                  isVerified: true,
                  child: Wrap(
                    children: [
                      Text(
                        'p6892805@hotmail.com',
                        style: BringooTypoGraphy.paragraph01SemiBold(
                          context,
                        ).copyWith(color: BringooColors.neutral[800]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () => onEditProfilePressed?.call(),
                  child: Row(
                    children: [
                      Text(
                        "Edit Profile",
                        style: BringooTypoGraphy.paragraph01SemiBold(
                          context,
                        ).copyWith(color: BringooColors.primary),
                      ),
                      const SizedBox(width: 4.0),
                      SvgPicture.asset(IconAssets.chevronRight),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                PhoneNumberCard(
                  phoneNumber: "(+66) 1234567890",
                  isVerified: true,
                  onUpdatePhonePressed: () {
                    onUpdatePhonePressed?.call();
                  },
                ),
                const SizedBox(height: 12.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LabelWithVerifiedMark extends StatelessWidget {
  const LabelWithVerifiedMark({
    super.key,
    this.label,
    this.isVerified = false,
    this.child,
    this.topRightAction,
  });

  final String? label;
  final bool? isVerified;
  final Widget? child;
  final Widget? topRightAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  label ?? '',
                  style: BringooTypoGraphy.smallSemibold(
                    context,
                  ).copyWith(color: BringooColors.neutral),
                ),
                if (isVerified ?? false)
                  Row(
                    children: [
                      const SizedBox(width: 10.0),
                      SvgPicture.asset(IconAssets.verified),
                      const SizedBox(width: 4.0),
                      Text(
                        'Verified',
                        style: BringooTypoGraphy.smallRegular(
                          context,
                        ).copyWith(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
              ],
            ),
            topRightAction ?? Container(),
          ],
        ),
        SizedBox(height: child != null ? 4.0 : 0.0),
        child ?? Container(),
      ],
    );
  }
}

class PhoneNumberCard extends StatelessWidget {
  const PhoneNumberCard({
    super.key,
    this.phoneNumber,
    this.isVerified = false,
    this.onUpdatePhonePressed,
  });

  final String? phoneNumber;
  final bool? isVerified;
  final Function? onUpdatePhonePressed;

  void handleUpdatePhoneNumberPressed() {
    onUpdatePhonePressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE7FFED), Color(0xFFD3F5DB)],
        ),
        border: Border.all(color: BringooColors.primary.shade100),
      ),
      child: LabelWithVerifiedMark(
        label: 'Phone Number',
        isVerified: (phoneNumber?.isNotEmpty ?? false) && (isVerified ?? false),
        topRightAction: GestureDetector(
          onTap: () {},
          child:
              phoneNumber?.isNotEmpty ?? false
                  ? GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: handleUpdatePhoneNumberPressed,
                    child: Row(
                      children: [
                        Text(
                          'Update',
                          style: BringooTypoGraphy.smallSemibold(
                            context,
                          ).copyWith(color: BringooColors.primary),
                        ),
                        const SizedBox(width: 4.0),
                        SvgPicture.asset(IconAssets.chevronRight),
                      ],
                    ),
                  )
                  : Container(),
        ),
        child: Row(
          children: [
            phoneNumber?.isNotEmpty ?? false
                ? Text(
                  phoneNumber ?? '',
                  style: BringooTypoGraphy.paragraph01SemiBold(
                    context,
                  ).copyWith(color: BringooColors.neutral[800]),
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No phone number added',
                      style: BringooTypoGraphy.paragraph01SemiBold(
                        context,
                      ).copyWith(color: BringooColors.neutral[800]),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      height: 28.0.sp,
                      child: ElevatedButton(
                        onPressed: handleUpdatePhoneNumberPressed,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 16.0,
                          ),
                          textStyle: BringooTypoGraphy.smallSemibold(context),
                        ),
                        child: Text('Add Phone Number'),
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
