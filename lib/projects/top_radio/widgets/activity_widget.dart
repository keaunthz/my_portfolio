import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/projects/top_radio/utils/app_colors.dart';
import 'package:portfolio/projects/top_radio/utils/enum.dart';

class ActivityWidget extends StatefulWidget {
  final Function(CategoryTagEnum)? onSelectedCategory;

  const ActivityWidget({super.key, this.onSelectedCategory});

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  // ข้อมูลแท็กกิจกรรม
  final List<TagModel> _activities = [
    TagModel(
      tag: CategoryTagEnum.entertainment,
      imgAssetPath: "icons/entertainment.png",
      color: const Color(0xFFFCE8D2),
      isSelected: false,
    ),
    TagModel(
      tag: CategoryTagEnum.health,
      imgAssetPath: "icons/health.png",
      color: const Color(0xFFD2FCED),
      isSelected: false,
    ),
    TagModel(
      tag: CategoryTagEnum.food,
      imgAssetPath: "icons/food.png",
      color: const Color(0xFFFFD43C),
      isSelected: false,
    ),
    TagModel(
      tag: CategoryTagEnum.houseWork,
      imgAssetPath: "icons/house_work.png",
      color: const Color(0xFFFCD2E4),
      isSelected: false,
    ),
    TagModel(
      tag: CategoryTagEnum.promotion,
      imgAssetPath: "icons/promotion.png",
      color: const Color(0xFFFFBEC7),
      isSelected: false,
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _activities.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180,
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
        childAspectRatio: 176 / 58,
      ),
      itemBuilder: (ctx, index) {
        final item = _activities[index];
        return _renderItem(item: item, index: index + 1);
      },
    );
  }

  Widget _renderItem({required TagModel item, required int index}) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedIndex == index) {
            _selectedIndex = 0;
            widget.onSelectedCategory?.call(CategoryTagEnum.unknown);
          } else {
            _selectedIndex = index;
            widget.onSelectedCategory?.call(
              item.tag ?? CategoryTagEnum.unknown,
            );
          }
        });
      },
      child: ClipRRect(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: item.color,
            border: Border.all(
              color: isSelected ? primaryColor : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 22,
                height: 22,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    item.imgAssetPath ?? "",
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(Icons.error),
                  ),
                ),
              ),
              const Gap(14),
              Expanded(
                child: Text(
                  item.tag?.toString().split('.').last.toCapitalized ?? "",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension StringCasingExtension on String {
  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String get toTitleCase => replaceAll(
    RegExp(' +'),
    ' ',
  ).split(' ').map((str) => str.toCapitalized).join(' ');
}

class TagModel {
  final CategoryTagEnum? tag;
  final String? imgAssetPath;
  final Color color;
  final bool isSelected;

  TagModel({
    this.tag,
    this.imgAssetPath,
    this.color = Colors.white,
    this.isSelected = false,
  });
}
