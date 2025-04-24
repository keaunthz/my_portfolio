import 'package:flutter/material.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';

class VisualizerBar extends StatefulWidget {
  final bool animate;
  final double width;
  final double height;
  final double radius;
  final Color color;

  const VisualizerBar({
    super.key,
    required this.animate,
    required this.width,
    required this.height,
    required this.radius,
    required this.color,
  });

  @override
  State<VisualizerBar> createState() => _VisualizerBarState();
}

class _VisualizerBarState extends State<VisualizerBar> {
  late bool isAnimating;

  @override
  void initState() {
    super.initState();
    isAnimating = widget.animate;
  }

  @override
  void didUpdateWidget(covariant VisualizerBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animate != widget.animate) {
      setState(() {
        isAnimating = widget.animate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MiniMusicVisualizer(
      radius: widget.radius,
      width: widget.width,
      height: widget.height,
      color: widget.color,
      animate: isAnimating,
    );
  }
}
