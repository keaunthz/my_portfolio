// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularImage extends StatelessWidget {
  String imageUrl;
  double width;
  double height;
  CircularImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(width / 2)),
      child: CachedNetworkImage(
        height: height.h,
        width: width.w,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        progressIndicatorBuilder:
            (context, url, downloadProgress) => Center(
              child: CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
            ),
        errorWidget:
            (context, url, error) => Container(
              color: Colors.grey.shade300,
              height: width.w,
              width: height,
              child: const Icon(Icons.person, color: Colors.grey, size: 40),
            ),
      ),
    );
  }
}
