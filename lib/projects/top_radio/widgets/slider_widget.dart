import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/projects/top_radio/models/live_banner_model.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final List<LiveBannerModel> _allBanners = [];
  int _sliderIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeMockData();
  }

  void _initializeMockData() {
    _allBanners.addAll([
      LiveBannerModel(
        id: "1",
        linkUrl: "https://www.google.co.th/",
        imageUrl: "assets/dummy/banner_mock_1.png",
      ),
      LiveBannerModel(
        id: "2",
        linkUrl: "https://www.google.co.th/",
        imageUrl: "assets/dummy/banner_mock_2.png",
      ),
      LiveBannerModel(
        id: "3",
        linkUrl: "https://www.google.co.th/",
        imageUrl: "assets/dummy/banner_mock_3.png",
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 1920 / 960,
              child: Builder(
                builder: (context) {
                  const double height = 200;
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: height,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 600,
                      ),
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _sliderIndex = index;
                        });
                      },
                    ),
                    items: List.generate(_allBanners.length, (index) {
                      final banner = _allBanners[index];
                      return SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          // onTap: () => openLink(banner.linkUrl),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                banner.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DotsIndicator(
                dotsCount: _allBanners.length,
                position: _sliderIndex,
                decorator: DotsDecorator(
                  color: greyLightColor.withValues(
                    alpha: 0.3,
                  ), // Inactive color
                  activeColor: primaryColor,
                ),
              ),
            ),
          ],
        ),

        const Gap(10),
      ],
    );
  }
}
