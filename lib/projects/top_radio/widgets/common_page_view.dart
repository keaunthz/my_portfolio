import 'package:flutter/material.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';

class CommonPageView extends StatefulWidget {
  final List<String> pageHeaderList;
  final List<Widget> listPageView;
  final PageController pageController;
  final int currentIndex;
  final ValueChanged<int>? onPageChanged;

  const CommonPageView({
    super.key,
    required this.pageHeaderList,
    required this.listPageView,
    required this.pageController,
    required this.currentIndex,
    this.onPageChanged,
  });

  @override
  State<CommonPageView> createState() => _CommonPageViewState();
}

class _CommonPageViewState extends State<CommonPageView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Row(
            children: List.generate(
              widget.pageHeaderList.length,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      widget.pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      if (widget.onPageChanged != null) {
                        widget.onPageChanged!(index);
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: Center(
                            child: TextStyles.normalTextWidget(
                              textAlign: TextAlign.center,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color:
                                  widget.currentIndex == index
                                      ? primaryColor
                                      : greyColor,
                              title: widget.pageHeaderList[index],
                            ),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: widget.currentIndex == index ? 60 : 0,
                          decoration: BoxDecoration(
                            color:
                                widget.currentIndex == index
                                    ? primaryColor
                                    : greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: PageView(
            controller: widget.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: widget.onPageChanged,
            children: widget.listPageView,
          ),
        ),
      ],
    );
  }
}
