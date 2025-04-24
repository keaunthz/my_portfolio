import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioService {
  final AudioPlayer audioPlayer = AudioPlayer();
  final ValueNotifier<bool> isPlaying = ValueNotifier(false);

  Future<void> disposePlayer() async {
    await audioPlayer.stop();
    await audioPlayer.dispose();
    isPlaying.value = false;
  }
}
