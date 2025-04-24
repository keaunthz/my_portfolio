import 'package:flutter/material.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class PhotoSelector extends StatelessWidget {
  const PhotoSelector({super.key, this.onUseCamera, this.onSelectFromGallery});

  final Function? onUseCamera;
  final Function? onSelectFromGallery;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onUseCamera?.call(),
          child: Text(
            'Use Camera',
            style: BringooTypoGraphy.captionSemiBold(
              context,
            ).copyWith(color: BringooColors.primary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 1.0,
            height: 16.0,
            color: const Color(0xFFE5E5EA),
          ),
        ),
        GestureDetector(
          onTap: () => onSelectFromGallery?.call(),
          child: Text(
            'Select from Gallery',
            style: BringooTypoGraphy.captionSemiBold(
              context,
            ).copyWith(color: BringooColors.primary),
          ),
        ),
      ],
    );
  }
}
