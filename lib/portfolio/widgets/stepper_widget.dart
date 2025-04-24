import 'package:flutter/material.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class VerticalStepper extends StatelessWidget {
  final List<VerticalStepperItem> items;

  const VerticalStepper({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < items.length; i++)
          _VerticalStepperItemWidget(
            item: items[i],
            isLast: i == items.length - 1,
          ),
      ],
    );
  }
}

class _VerticalStepperItemWidget extends StatefulWidget {
  final VerticalStepperItem item;
  final bool isLast;

  const _VerticalStepperItemWidget({required this.item, required this.isLast});

  @override
  State<_VerticalStepperItemWidget> createState() =>
      _VerticalStepperItemWidgetState();
}

class _VerticalStepperItemWidgetState
    extends State<_VerticalStepperItemWidget> {
  final GlobalKey _contentKey = GlobalKey();
  double _contentHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final height = _contentKey.currentContext?.size?.height ?? 0;
      if (height != _contentHeight) {
        setState(() {
          _contentHeight = height;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline line and dot
        Column(
          children: [
            // Dot
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: BringooColors.oceanTeal,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400]!,
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            // Line (only if not last item)
            if (!widget.isLast)
              Container(
                width: 2,
                height: _contentHeight > 0 ? _contentHeight - 12 : 0,
                color: Colors.grey[400],
              ),
          ],
        ),
        const SizedBox(width: 16),
        // Content
        Expanded(
          child: Column(
            key: _contentKey,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Multiple titles
              for (final title in widget.item.titles)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    title,
                    style: BringooTypoGraphy.paragraph03SemiBold(
                      context,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              // Subtitle as Widget
              widget.item.subtitle,
            ],
          ),
        ),
      ],
    );
  }
}

class VerticalStepperItem {
  final List<String> titles;
  final Widget subtitle;

  VerticalStepperItem({required this.titles, required this.subtitle});
}
