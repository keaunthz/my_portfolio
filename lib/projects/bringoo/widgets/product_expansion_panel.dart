import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/icon_assets.dart';
import 'package:portfolio/projects/bringoo/models/product_detail_dao.dart';
import 'package:portfolio/projects/bringoo/widgets/category_chip.dart';
import 'package:portfolio/projects/bringoo/widgets/nutrition_table.dart';
import 'package:portfolio/projects/bringoo/widgets/row_between_label.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';
import 'package:portfolio/utils/formatter.dart';

class ProductDetailModel {
  String? label;
  bool? optionalField;
  DataTypeEnum? dataType;

  ProductDetailModel({this.label, this.optionalField, this.dataType});
}

enum DataTypeEnum {
  nutrition,
  manufacturer,
  ingredient,
  attributes,
  alcohol,
  price,
  bottomDeposit,
  boxDeposit,
  linkProduct,
}

class ProductDetailExpandPanel extends StatefulWidget {
  const ProductDetailExpandPanel({
    super.key,
    required this.sections,
    required this.data,
    this.onEditIconPress,
    this.viewOnly = false,
  });

  final List<ProductDetailModel> sections;
  final ProductDetailDao data;
  final Function(DataTypeEnum dataType)? onEditIconPress;
  final bool viewOnly;

  @override
  State<ProductDetailExpandPanel> createState() =>
      _ProductDetailExpandPanelState();
}

class _ProductDetailExpandPanelState extends State<ProductDetailExpandPanel> {
  late List<bool> isOpens;

  @override
  void initState() {
    super.initState();
    isOpens = List.generate(widget.sections.length, (_) => false);
  }

  void singleExpand(int index, bool isExpanded) {
    setState(() {
      isOpens =
          isOpens.asMap().entries.map((e) {
            if (index == e.key && e.value == isExpanded) {
              return !isExpanded;
            }
            return index == e.key;
          }).toList();
    });
  }

  void toggleExpand(int index, bool isExpanded) {
    isOpens[index] = !isExpanded;
  }

  bool getValidInfoChecker(DataTypeEnum? dataType) {
    final data = widget.data;
    if (dataType == DataTypeEnum.nutrition) {
      return data.nutritionalData != null;
    } else if (dataType == DataTypeEnum.manufacturer) {
      return data.manufacturerI18n?.isNotEmpty ?? false;
    } else if (dataType == DataTypeEnum.ingredient) {
      return data.ingredientsI18n?.isNotEmpty ?? false;
    } else if (dataType == DataTypeEnum.attributes) {
      return data.getAttributes().where((e) => e.value == true).isNotEmpty;
    } else if (dataType == DataTypeEnum.price) {
      return data.costPrice != null && data.vat != null;
    }
    return false;
  }

  Widget getChildWidget(BuildContext context, DataTypeEnum? dataType) {
    final data = widget.data;
    final plainTextStyle = BringooTypoGraphy.paragraph01Regular(
      context,
    ).copyWith(color: BringooColors.neutral);
    final semiBoldTextStyle = BringooTypoGraphy.paragraph01SemiBold(context);

    switch (dataType) {
      case DataTypeEnum.nutrition:
        return data.nutritionalData != null
            ? NutritionTable(
              readOnly: true,
              rows:
                  data.nutritionalData
                      ?.getNutritionalList()
                      .asMap()
                      .entries
                      .map((e) {
                        return NutritionRow(
                          readOnly: true,
                          label: e.value.label,
                          value:
                              e.value.value != null
                                  ? e.value.isDouble == false
                                      ? e.value.value?.toInt().toString()
                                      : CurrencyUtils.parseToEuroFormat(
                                        e.value.value,
                                      )
                                  : null,
                          unitLabel: e.value.unitLabel,
                          depth: e.value.depth ?? 0,
                          isDouble: e.value.isDouble ?? true,
                          background:
                              e.key.isEven
                                  ? Colors.white
                                  : BringooColors.neutral[50],
                        );
                      })
                      .toList(),
            )
            : Text('Undefined', style: plainTextStyle);
      case DataTypeEnum.manufacturer:
        return data.manufacturerI18n?.isNotEmpty ?? false
            ? Text(data.manufacturerI18n!, style: semiBoldTextStyle)
            : Text('Undefined', style: plainTextStyle);
      case DataTypeEnum.ingredient:
        return data.ingredientsI18n?.isNotEmpty ?? false
            ? Text(data.ingredientsI18n!, style: semiBoldTextStyle)
            : Text('Undefined', style: plainTextStyle);
      case DataTypeEnum.attributes:
        return _buildAttributesWidget(context);
      case DataTypeEnum.alcohol:
        return data.isAlcohol == true
            ? data.alcoholValue != null
                ? RowBetweenLabel(
                  label: 'Alcohol value',
                  value: '${data.alcoholValue}',
                )
                : Text('Undefined', style: plainTextStyle)
            : const Text('No alcohol in this product.');
      case DataTypeEnum.price:
        return Column(
          children: [
            RowBetweenLabel(label: 'Price', value: data.costPrice),
            RowBetweenLabel(
              label: 'VAT',
              value:
                  data.vatEntity?.value != null
                      ? '${data.vatEntity?.value} %'
                      : '-',
            ),
          ],
        );
      case DataTypeEnum.bottomDeposit:
        return Column(
          children: [
            RowBetweenLabel(
              label: 'Bottle Deposit Value',
              value: '${data.depositEntity?.itemDepositValueGross ?? 0}',
            ),
            RowBetweenLabel(label: 'Bottle Deposit VAT', value: '0 %'),
          ],
        );
      case DataTypeEnum.boxDeposit:
        return Column(
          children: [
            RowBetweenLabel(
              label: 'Box Deposit Value',
              value: '${data.depositEntity?.boxDepositValueGross ?? 0}',
            ),
            RowBetweenLabel(label: 'Bottle Deposit VAT', value: '0 %'),
          ],
        );
      case DataTypeEnum.linkProduct:
      default:
        return Text('Undefined', style: plainTextStyle);
    }
  }

  Widget _buildAttributesWidget(BuildContext context) {
    final attributes = widget.data.getAttributes().where(
      (e) => e.value == true,
    );
    return attributes.isNotEmpty
        ? Wrap(
          spacing: 8.0,
          runSpacing: -8.0,
          children:
              attributes
                  .map((e) => CategoryChip(label: e.label.toString()))
                  .toList(),
        )
        : Text(
          'Undefined',
          style: BringooTypoGraphy.paragraph01Regular(
            context,
          ).copyWith(color: BringooColors.neutral),
        );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      elevation: 0,
      dividerColor: BringooColors.neutral.shade200,
      expansionCallback: (int index, bool isExpanded) {
        singleExpand(index, isExpanded);
      },
      children:
          widget.sections.asMap().entries.map((e) {
            final model = e.value;
            return _buildExpansionPanel(
              label: model.label,
              isExpanded: isOpens[e.key],
              optional: widget.viewOnly ? false : model.optionalField ?? false,
              completed:
                  widget.viewOnly ? true : getValidInfoChecker(model.dataType),
              onEditPress: () {
                if (widget.onEditIconPress != null) {
                  widget.onEditIconPress!(model.dataType!);
                }
              },
              body: getChildWidget(context, model.dataType),
            );
          }).toList(),
    );
  }

  ExpansionPanel _buildExpansionPanel({
    String? label,
    bool isExpanded = false,
    bool optional = false,
    bool completed = false,
    required Function onEditPress,
    Widget? body,
  }) {
    return ExpansionPanel(
      canTapOnHeader: true,
      headerBuilder: (context, isOpen) {
        return Container(
          height: 51.0,
          padding: const EdgeInsets.only(left: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    label ?? '',
                    style: BringooTypoGraphy.paragraph02SemiBold(
                      context,
                    ).copyWith(
                      color:
                          isExpanded
                              ? BringooColors.primary
                              : BringooColors.neutral.shade800,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  optional
                      ? Text(
                        '(Optional)',
                        style: BringooTypoGraphy.captionRegular(context),
                      )
                      : !completed
                      ? SvgPicture.asset(IconAssets.redWarningCircle)
                      : const SizedBox(),
                ],
              ),
              if (!optional && !completed)
                GestureDetector(
                  onTap: () => onEditPress(),
                  child: SvgPicture.asset(
                    IconAssets.edit,
                    color: BringooColors.neutral,
                    width: 16.0,
                    height: 16.0,
                  ),
                ),
            ],
          ),
        );
      },
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: body ?? const Text('dynamic child will show here!'),
        ),
      ),
      isExpanded: isExpanded,
    );
  }
}
