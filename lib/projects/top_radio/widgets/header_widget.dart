import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  "assets/dummy/home_dummy_img.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: InkWell(
                onTap: () {
                  // Share.share('check out my website https://example.com');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: primaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      EvilIcons.sc_telegram,
                      color: whiteColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Transform.translate(
                offset: const Offset(0, 25),
                child: Image.asset("assets/icons/live_radio.gif", height: 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
