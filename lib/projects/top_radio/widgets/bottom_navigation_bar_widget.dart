import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final VoidCallback? callback;
  final int currentIndex;
  final Function(int) onIndexChanged;

  const BottomNavigationBarWidget({
    super.key,
    this.callback,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor, // เปลี่ยนเป็นสีที่ต้องการ
      unselectedItemColor: Colors.grey, // เปลี่ยนเป็นสีที่ต้องการ
      currentIndex: widget.currentIndex,
      selectedFontSize: 12,
      onTap: (index) {
        widget.callback?.call();
        widget.onIndexChanged(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/radio_nav_bar.png',
            height: 28.0,
            width: 28.0,
            color: widget.currentIndex == 0 ? primaryColor : Colors.grey,
          ),
          label: 'LIVE Radio',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/event_nav_bar.png',
            height: 28.0,
            width: 28.0,
            color: widget.currentIndex == 1 ? primaryColor : Colors.grey,
          ),
          label: 'Event & News',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            AntDesign.gift,
            color: widget.currentIndex == 2 ? primaryColor : Colors.grey,
          ),
          label: 'Rewards',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/profile_nav_bar.png',
            height: 28.0,
            width: 28.0,
            color: widget.currentIndex == 3 ? primaryColor : Colors.grey,
          ),
          label: 'Me',
        ),
      ],
    );
  }
}
