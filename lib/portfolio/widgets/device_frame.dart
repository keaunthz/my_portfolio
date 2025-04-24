import 'package:flutter/material.dart';

class DeviceFrame extends StatelessWidget {
  final Widget child;
  final ThemeData? theme;

  const DeviceFrame({super.key, required this.child, this.theme});

  @override
  Widget build(BuildContext context) {
    const deviceWidth = 400.0;
    const deviceHeight = 700.0;
    const screenMargin = 18.0;

    return Center(
      child: Container(
        width: deviceWidth,
        height: deviceHeight,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.8),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(screenMargin),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Theme(data: theme ?? Theme.of(context), child: child),
                ),
              ),
            ),

            Positioned(
              top: 8,
              left: deviceWidth / 2 - 40,
              child: Container(
                width: 80,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),

            // ปุ่มข้างเครื่อง (ด้านขวา)
            Positioned(
              top: deviceHeight * 0.3,
              right: -6,
              child: Container(
                width: 10,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Positioned(
              top: deviceHeight * 0.5,
              right: -6,
              child: Container(
                width: 10,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
