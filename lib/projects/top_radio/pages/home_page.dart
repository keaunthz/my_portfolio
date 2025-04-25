import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:portfolio/projects/top_radio/services/audio_service.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:portfolio/projects/top_radio/widgets/event_widget.dart';
import 'package:portfolio/projects/top_radio/widgets/header_widget.dart';
import 'package:portfolio/projects/top_radio/widgets/slider_widget.dart';
import 'package:portfolio/projects/top_radio/widgets/text_styles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePage extends StatefulWidget {
  final AudioService audioService;
  const HomePage({super.key, required this.audioService});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Color> colors = [
    const Color(0xFFD23B48),
    const Color(0xFF87288C),
    const Color(0xFF5451A8),
  ];

  Color getColor(int index, int total) {
    double fraction = index / (total - 1);
    int colorIndex = (fraction * (colors.length - 1)).floor();
    double blendFraction = (fraction * (colors.length - 1)) % 1;

    Color color1 = colors[colorIndex];
    Color color2 = colors[min(colorIndex + 1, colors.length - 1)];

    return Color.lerp(color1, color2, blendFraction)!;
  }

  double getHeightVisualizer(int index, int total) {
    int maxRandomHeight = 70;
    double midPoint = total / 2;
    final random = Random();

    if (index < midPoint) {
      return random.nextDouble() * (maxRandomHeight * (index / midPoint));
    } else {
      return random.nextDouble() *
          (maxRandomHeight * ((total - index) / midPoint));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFFF082), Color(0xFFBB50E2)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),

              Positioned(
                bottom: -125,
                left: 0,
                right: 0,
                child: Center(child: const HeaderWidget()),
              ),
            ],
          ),

          const SizedBox(height: 140),

          Container(
            color: Colors.white,
            child: Column(
              children: [
                const SliderWidget(),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyles.interTextWidget(
                        title: "Event & News ",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/events'),
                        child: TextStyles.interTextWidget(
                          title: "More",
                          fontSize: 14,
                          color: greyLightColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                const EventWidget(),
                const Gap(20),
                TextStyles.montserratTextWidget(
                  title: "Top Radio ",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                GradientText(
                  '9.21 K',
                  style: GoogleFonts.montserrat(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                  colors: const [Color(0xFF6F5DDD), Color(0xFF863488)],
                ),
                TextStyles.montserratTextWidget(
                  title: "Follow",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                const Gap(50),
                ValueListenableBuilder<bool>(
                  valueListenable: widget.audioService.isPlaying,
                  builder: (context, isPlaying, child) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        14,
                        (index) => MiniMusicVisualizer(
                          radius: 2,
                          color: getColor(index, 14),
                          width: 6,
                          height: getHeightVisualizer(index, 14),
                          animate: isPlaying,
                        ),
                      ),
                    );
                  },
                ),
                const Gap(40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
