import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/icon_assets.dart';
import 'package:portfolio/projects/bringoo/models/product_dao.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';
import 'package:portfolio/utils/app.dart';

class ListProductMock extends StatelessWidget {
  final List<ProductDAO> item;
  final Function? onItemTap;
  const ListProductMock({super.key, required this.item, this.onItemTap});

  @override
  Widget build(BuildContext context) {
    if (item.isEmpty) return _buildIncompleteProducts(context);
    return ListView.builder(
      itemCount: item.length,
      shrinkWrap: false,
      padding: EdgeInsets.only(top: 16),
      itemBuilder: (context, index) {
        final item = this.item[index];
        return GestureDetector(
          onTap: () => onItemTap?.call(item.id),
          child: Card(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child:
                        item.imageUrl != null
                            ? Image.network(
                              item.imageUrl ?? '',
                              width: 88.0,
                              height: 72.0,
                              fit: BoxFit.cover,
                              errorBuilder: (context, obj, error) {
                                return Container(
                                  color: Colors.grey[200],
                                  width: 88.0,
                                  height: 72.0,
                                );
                              },
                            )
                            : Container(),
                  ),
                  const SizedBox(width: 12.0),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.nameI18n ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: BringooTypoGraphy.paragraph02SemiBold(context),
                        ),
                        Text(
                          'Food',
                          style: BringooTypoGraphy.paragraph01SemiBold(
                            context,
                          ).copyWith(color: BringooColors.neutral),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            SvgPicture.asset(IconAssets.box_3d),
                            const SizedBox(width: 4.0),
                            Flexible(
                              child: Text(
                                item.code ?? '',
                                style: BringooTypoGraphy.captionRegular(
                                  context,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(IconAssets.barcode),
                            const SizedBox(width: 4.0),
                            Flexible(
                              child: Text(
                                item.ean.toString(),
                                style: BringooTypoGraphy.captionRegular(
                                  context,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIncompleteProducts(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: BringooColors.neutral.shade50,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(IconAssets.search, width: 48.0, height: 48.0),
          const SizedBox(height: 20.0),
          Text(
            'Search a product',
            style: BringooTypoGraphy.paragraph02SemiBold(context).copyWith(
              color: BringooColors.neutral.shade800.withValues(alpha: 0.5),
            ),
          ),
          SizedBox(
            width: 250.0,
            child: Text(
              'Type a product name or scan a barcode.',
              textAlign: TextAlign.center,
              style: BringooTypoGraphy.captionRegular(context).copyWith(
                color: BringooColors.neutral.shade600.withValues(alpha: 0.5),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: BringooColors.primary,
                ),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  AppUtils.hideKeyboard();
                  // Get.to(() => const MainProductForm());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconAssets.plus),
                    const SizedBox(width: 4.0),
                    Text(
                      'Add New Product',
                      style: BringooTypoGraphy.paragraph02SemiBold(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
