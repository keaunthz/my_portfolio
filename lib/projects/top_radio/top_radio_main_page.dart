import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio/projects/top_radio/pages/event_page.dart';
import 'package:portfolio/projects/top_radio/pages/home_page.dart';
import 'package:portfolio/projects/top_radio/pages/profile_page.dart';
import 'package:portfolio/projects/top_radio/pages/rewards_page.dart';
import 'package:portfolio/projects/top_radio/services/audio_service.dart';
import 'package:portfolio/projects/top_radio/widgets/bottom_navigation_bar_widget.dart';
import 'package:portfolio/projects/top_radio/widgets/live_audio_widget.dart';

class TopRadioMainPage extends StatefulWidget {
  final AudioService audioService;
  const TopRadioMainPage({super.key, required this.audioService});

  @override
  State<TopRadioMainPage> createState() => _TopRadioMainPageState();
}

class _TopRadioMainPageState extends State<TopRadioMainPage> {
  int currentIndex = 0;
  final pageStorageBucket = PageStorageBucket();
  late final List<Widget> pages;

  @override
  void initState() {
    _initAudio();
    pages = [
      HomePage(audioService: widget.audioService),
      EventPage(),
      RewardsPage(),
      ProfilePage(),
    ];
    super.initState();
  }

  Future<void> _initAudio() async {
    try {
      await widget.audioService.audioPlayer.setUrl(
        'http://202.129.206.187:8000/livech1.mp3',
      );
      await widget.audioService.audioPlayer.play();
    } catch (e) {
      log('Error initializing audio: $e');
    }
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const mediaPlayerHeight = 58.0;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: mediaPlayerHeight),
                child: PageStorage(
                  bucket: pageStorageBucket,
                  child: pages[currentIndex],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: LiveAudioWidget(audioService: widget.audioService),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: currentIndex,
        onIndexChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
