import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:portfolio/themes/bringoo_colors.dart';

class BringooNavbarWidget extends StatelessWidget {
  final int? selectedIndex;
  final List<ItemConfig> items;
  final ValueChanged<int> onItemSelected;

  const BringooNavbarWidget({
    this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  }) : super(key: null);

  Widget _buildItem(ItemConfig item, bool isSelected) {
    return Column(
      children: [
        Container(
          color:
              isSelected
                  ? BringooColors.primary
                  : Colors.black.withValues(alpha: 0.07),
          height: 2.0,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconTheme(
                data: IconThemeData(
                  size: 20.0,
                  color:
                      isSelected
                          ? BringooColors.primary
                          : item.inactiveForegroundColor,
                ),
                child: isSelected ? item.icon : item.inactiveIcon,
              ),
              const SizedBox(height: 4.0),
              Text(
                item.title ?? '',
                style: TextStyle(
                  color:
                      isSelected
                          ? BringooColors.primary
                          : item.inactiveForegroundColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            items.map((item) {
              int index = items.indexOf(item);
              final isSelected = index == selectedIndex;
              return Flexible(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    onItemSelected(index);
                  },
                  child: _buildItem(item, isSelected),
                ),
              );
            }).toList(),
      ),
    );
  }
}
