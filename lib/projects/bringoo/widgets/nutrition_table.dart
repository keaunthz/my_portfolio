import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/icon_assets.dart';
import 'package:portfolio/projects/bringoo/widgets/text_label.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';
import 'package:portfolio/utils/formatter.dart';

class NutritionTable extends StatelessWidget {
  const NutritionTable({
    super.key,
    this.rows,
    this.readOnly = false,
    this.onOCRScanTap,
  });

  final List<Widget>? rows;
  final bool readOnly;
  final Function? onOCRScanTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!readOnly)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextLabel(text: 'Nutritional Data'),
              GestureDetector(
                onTap: () {
                  onOCRScanTap?.call();
                },
                child: Row(
                  children: [
                    Text(
                      'Take a photo of texts to scan',
                      style: BringooTypoGraphy.paragraph01Regular(
                        context,
                      ).copyWith(color: BringooColors.primary),
                    ),
                    const SizedBox(width: 8.0),
                    SvgPicture.asset(IconAssets.frameCorner),
                  ],
                ),
              ),
            ],
          ),
        if (!readOnly) const SizedBox(height: 12.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: BringooColors.neutral.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: Column(children: rows ?? []),
          ),
        ),
      ],
    );
  }
}

class NutritionRow extends StatelessWidget {
  const NutritionRow({
    super.key,
    this.readOnly = false,
    this.label,
    this.value,
    this.unitLabel,
    this.depth = 0,
    this.isDouble = true,
    this.background,
    this.onTextChange,
  });

  final bool readOnly;
  final String? label;
  final String? value;
  final String? unitLabel;
  final int depth;
  final bool isDouble;
  final Color? background;
  final Function(String text)? onTextChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        color: background,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: depth > 0 ? 12.0 * depth + 1 : 0.0,
                ),
                child: Text(
                  label ?? '',
                  style:
                      depth > 0
                          ? BringooTypoGraphy.paragraph01Regular(context)
                          : BringooTypoGraphy.paragraph01SemiBold(context),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: readOnly,
                      textAlign: TextAlign.end,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters:
                          isDouble
                              ? [CurrencyUtils.currencyInputMask]
                              : [NumberFormatUtil.numberOnly],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0.0),
                        hintText: isDouble ? '0,00' : '0',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        fillColor: Colors.transparent,
                      ),
                      onChanged: (value) {
                        onTextChange?.call(value);
                      },
                      initialValue: value,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  SizedBox(
                    width: 35.0,
                    child: Text(
                      unitLabel ?? '',
                      style: BringooTypoGraphy.paragraph01Regular(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
