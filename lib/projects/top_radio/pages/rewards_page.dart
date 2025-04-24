import 'package:flutter/material.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:portfolio/projects/top_radio/widgets/common_page_view.dart';
import 'package:portfolio/projects/top_radio/widgets/rewards_announce_view.dart';
import 'package:portfolio/projects/top_radio/widgets/rewards_pending_view.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({super.key});

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  final List<String> pageHeaderList = [
    "รางวัลที่รอประกาศ",
    "รางวัลที่ประกาศแล้ว",
  ];

  final List<Widget> listPageView = [
    const RewardsPendingView(),
    const RewardsAnnounceView(),
  ];

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextStyles.thaiTextWidget(
          title: "ลุ้นของรางวัล",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: whiteColor,
        ),
      ),
      body: CommonPageView(
        pageHeaderList: pageHeaderList,
        listPageView: listPageView,
        pageController: _pageController,
        currentIndex: _currentIndex,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
