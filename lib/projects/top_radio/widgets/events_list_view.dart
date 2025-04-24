import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/projects/top_radio/constants/icon_constants.dart';
import 'package:portfolio/projects/top_radio/models/post_model.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:portfolio/projects/top_radio/utils/enum.dart';
import 'package:portfolio/projects/top_radio/widgets/event_detail_page.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart';

class EventsListView extends StatelessWidget {
  final List<PostModel> value;
  final Function(String?)? onTapFavorite;
  const EventsListView({super.key, this.onTapFavorite, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: value.length,
      itemBuilder: (ctx, index) {
        final item = value[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailPage(event: item),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                color: whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AspectRatio(
                      aspectRatio: 1920 / 1280,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl: value[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 14,
                            bottom: 14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    onTapFavorite?.call(value[index].id);
                                  },
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                        color: whiteColor,
                                        width: 2,
                                      ),
                                      color: Colors.transparent,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: whiteColor,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                InkWell(
                                  onTap: () {
                                    // Share.share(
                                    //   value[index].placeLink,
                                    // );
                                  },
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      IconConstants.paperPlane,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextStyles.normalTextWidget(
                            title: value[index].title,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF34495E),
                          ),
                          const Gap(12),
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconConstants.calendar,
                                width: 17,
                                height: 17,
                              ),
                              const Gap(10),
                              TextStyles.normalTextWidget(
                                title: "17 เม.ย - 20. เม.ย 2567",
                                fontSize: 14,
                                color: blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          const Gap(10),
                          Visibility(
                            visible:
                                value[index].postType == PostTypeEnum.event,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      IconConstants.clock,
                                      width: 17,
                                      height: 17,
                                    ),
                                    const Gap(10),
                                    TextStyles.normalTextWidget(
                                      title: value[index].durationTime,
                                      fontSize: 14,
                                      color: blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                const Gap(10),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      IconConstants.pin,
                                      width: 17,
                                      height: 17,
                                    ),
                                    const Gap(10),
                                    TextStyles.normalTextWidget(
                                      title: value[index].place,
                                      fontSize: 14,
                                      color: blackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
