import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/projects/top_radio/models/post_model.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:portfolio/projects/top_radio/utils/enum.dart';
import 'package:portfolio/projects/top_radio/widgets/confirm_dialog_widget.dart';
import 'package:portfolio/projects/top_radio/widgets/rounded_button_widget.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required this.event});
  final PostModel event;
  @override
  Widget build(BuildContext context) {
    bool isTypeEvent = event.postType == PostTypeEnum.event;
    return Scaffold(
      backgroundColor: blackColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1920 / 1280,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(event.imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SafeArea(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isTypeEvent
                          ? Container(
                            decoration: BoxDecoration(
                              color: redAccColor,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16,
                              ),
                              child: TextStyles.thaiTextWidget(
                                title:
                                    "ผู้เข้าร่วม ${formatNumber(event.totalParticipants.length.toString())}",
                                color: whiteColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                              ),
                            ),
                          )
                          : Container(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // ref
                              //     .read(postProvider.notifier)
                              //     .toggleFavoriteEvent(eventId);
                            },
                            child: Icon(
                              Icons.favorite,
                              color: whiteColor,
                              size: 30,
                            ),
                          ),
                          const Gap(4),
                          TextStyles.normalTextWidget(
                            title: event.userFavorites.length.toString(),
                            color: whiteColor,
                          ),
                          const Gap(4),
                          InkWell(
                            onTap: () {
                              // Share.share(event.placeLink);
                            },
                            child: Image.asset(
                              'assets/images/share_icon.png',
                              height: 30,
                              width: 30,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextStyles.latoTextWidget(
                    textAlign: TextAlign.start,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    title: event.title,
                    color: whiteColor,
                  ),
                ),
                Visibility(
                  visible: !isTypeEvent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: TextStyles.latoTextWidget(
                      textAlign: TextAlign.start,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      title: event.startDate,
                      color: whiteColor,
                    ),
                  ),
                ),
                Visibility(
                  visible: isTypeEvent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 10.0,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: RoundedButtonWidget(
                            borderRadius: 30,
                            content: "เข้าร่วม",
                            fontSize: 16.0,
                            onTapFunction: () async {
                              if (context.mounted) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context) {
                                    return ConfirmDialog(
                                      title: 'โทรหาแอดมิน',
                                      description: 'LINE',
                                      onRightButtonClick: () {
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('Action Confirmed'),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            backgroundColor: greenColor,
                          ),
                        ),
                        const Gap(10),
                        SizedBox(
                          width: 110,
                          child: RoundedButtonWidget(
                            borderRadius: 30,
                            fontSize: 16.0,
                            content: "ไม่สนใจ",
                            onTapFunction: () {
                              Navigator.of(context).pop();
                            },
                            backgroundColor: redColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: whiteColor.withValues(alpha: 0.2),
                  ),
                ),
                Visibility(
                  visible: isTypeEvent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextStyles.interTextWidget(
                          textAlign: TextAlign.start,
                          title: event.description,
                          color: whiteColor,
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            buildEventDetails(
                              icon: 'assets/images/calendar_icon.png',
                              detail: event.startDate,
                              height: 15,
                              width: 15,
                            ),
                            const Gap(10),
                            buildEventDetails(
                              icon: 'assets/images/pin_location_icon.png',
                              detail: event.place,
                            ),
                            const Gap(10),
                            buildEventDetails(
                              icon: 'assets/images/time_icon.png',
                              detail: event.durationTime,
                            ),
                            const Gap(5),
                            buildEventDetails(
                              icon: 'assets/images/thai_currency_icon.png',
                              detail: "${event.price.toInt()} บาท",
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: whiteColor.withValues(alpha: 0.2),
                        ),
                      ),
                      const Gap(10),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyles.thaiTextWidget(
                        title: "รายละเอียด",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: yellowColor),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/tag_fill_icon.png',
                                height: 21,
                                width: 21,
                              ),
                              const Gap(10),
                              TextStyles.thaiTextWidget(
                                title: event.tag.name,
                                fontWeight: FontWeight.w500,
                                color: yellowColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextStyles.interTextWidget(
                    textAlign: TextAlign.start,
                    color: whiteColor,
                    title: event.description,
                  ),
                ),
                const Gap(20),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: whiteColor.withValues(alpha: 0.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyles.thaiTextWidget(
                        color: whiteColor,
                        title: isTypeEvent ? "สถานที่" : "อ้างอิง",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      Visibility(
                        visible: isTypeEvent,
                        child: GestureDetector(
                          onTap: () {
                            // Share.share(event.placeLink);
                          },
                          child: TextStyles.montserratTextWidget(
                            underline: true,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            title: "Map",
                            color: redAccColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child:
                      isTypeEvent
                          ? TextStyles.interTextWidget(
                            textAlign: TextAlign.start,
                            color: whiteColor,
                            title: event.placeDescription,
                          )
                          : TextStyles.interTextWidget(
                            textAlign: TextAlign.start,
                            color: const Color(0XFF007AFF),
                            title: event.placeLink,
                            textUnderLine: true,
                          ),
                ),
                const Gap(200),
              ],
            ),
          ),
          // const LiveAudioWidget(),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBarWidget(
      //   callback: () => Navigator.pop(context),
      // ),
    );
  }

  String formatNumber(String? number) {
    int? numberFormat = int.tryParse(number ?? '');
    if (numberFormat != null) {
      return NumberFormat('#,##0').format(numberFormat);
    } else {
      return 'Invalid number';
    }
  }

  Row buildEventDetails({
    required String icon,
    required String detail,
    double? height = 17,
    double? width = 17,
  }) {
    return Row(
      children: <Widget>[
        Image.asset(icon, height: height, width: width, color: whiteColor),
        const Gap(10),
        TextStyles.thaiTextWidget(
          title: detail,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: whiteColor,
        ),
      ],
    );
  }
}
