import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/projects/top_radio/services/audio_service.dart';

class LiveAudioWidget extends StatefulWidget {
  final AudioService audioService;
  const LiveAudioWidget({super.key, required this.audioService});

  @override
  State<LiveAudioWidget> createState() => _LiveAudioWidgetState();
}

class _LiveAudioWidgetState extends State<LiveAudioWidget> {
  // final String mp3 = 'http://202.129.206.187:8000/livech1.mp3';
  // late AudioService audioService;

  @override
  void initState() {
    super.initState();
    widget.audioService.audioPlayer.playingStream.listen((playing) {
      if (mounted) {
        setState(() {
          widget.audioService.isPlaying.value = playing;
        });
      }
    });
  }

  // Future<void> _initAudio() async {
  //   await audioService.audioPlayer.setUrl(mp3);
  //   await audioService.audioPlayer.play();
  // }

  void playPause() async {
    if (widget.audioService.audioPlayer.playing) {
      await widget.audioService.audioPlayer.pause();
    } else {
      await widget.audioService.audioPlayer.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.3),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            const Color(0xFFFFC0F9).withValues(alpha: 0.5),
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: Image.asset(
                                  'assets/dummy/home_dummy_img.png',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const Gap(10),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "ตะวัน สนิทพันธ์",
                                      style: TextStyle(
                                        color: Color(0xFF863488),
                                      ),
                                    ),
                                    const Text(
                                      "LIVE MON - FRI - 08.00 - 12.00",
                                      style: TextStyle(fontSize: 11.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Center(
                      child: ValueListenableBuilder<bool>(
                        valueListenable: widget.audioService.isPlaying,
                        builder: (context, isPlaying, _) {
                          return IconButton(
                            icon: Icon(
                              isPlaying ? Icons.pause : Icons.play_arrow,
                              color: const Color(0xFF863488),
                            ),
                            iconSize: 30.0,
                            onPressed: playPause,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 2.0,
            color: const Color(0xFF863488),
          ),
        ],
      ),
    );
  }
}
