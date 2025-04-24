import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/constants/icon_assets.dart';
import 'package:portfolio/projects/bringoo/models/product_detail_dao.dart';
import 'package:portfolio/projects/bringoo/widgets/category_chip.dart';
import 'package:portfolio/projects/bringoo/widgets/product_expansion_panel.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';

class ProductDetail extends StatefulWidget {
  final String? productId;

  const ProductDetail({super.key, this.productId});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late ProductDetailDao _productDetail;
  bool _isLoading = false;

  final List<ProductDetailModel> _productDetailSections = [
    ProductDetailModel(label: 'Nutrition', dataType: DataTypeEnum.nutrition),
    ProductDetailModel(
      label: 'Manufacturer',
      dataType: DataTypeEnum.manufacturer,
    ),
    ProductDetailModel(label: 'Ingredients', dataType: DataTypeEnum.ingredient),
    ProductDetailModel(label: 'Attributes', dataType: DataTypeEnum.attributes),
    ProductDetailModel(
      label: 'Alcohol',
      dataType: DataTypeEnum.alcohol,
      optionalField: true,
    ),
    ProductDetailModel(label: 'Price', dataType: DataTypeEnum.price),
  ];

  @override
  void initState() {
    super.initState();
    _loadProductDetail();
  }

  Future<void> _loadProductDetail() async {
    setState(() => _isLoading = true);

    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // Simulate API delay

    setState(() {
      _productDetail = _mockProductDetail(widget.productId!);
      _isLoading = false;
    });
  }

  ProductDetailDao _mockProductDetail(String id) {
    final index = int.tryParse(id.replaceAll('prod_', '')) ?? 1;
    final foodTypes = [
      'biryani',
      'burger',
      'butter-chicken',
      'dessert',
      'dosa',
      'idly',
      'pasta',
      'pizza',
      'rice',
      'samosa',
    ];
    final foodType = foodTypes[(index - 1) % foodTypes.length];

    final nutritionalData = NutritionalData(
      energyTotal: 800 + (index * 100),
      calories: 200 + (index * 50),
      fatTotal: 5.0 + (index * 0.5),
      fatSaturates: 1.0 + (index * 0.1),
      carbohydrateTotal: 30.0 + (index * 2),
      carbohydrateSugars: 10.0 + (index * 1),
      fibres: 3.0 + (index * 0.3),
      protein: 8.0 + (index * 1),
      salt: 0.5 + (index * 0.05),
    );

    final depositEntity = DepositEntity(
      id: 'deposit_$index',
      isActive: index % 2 == 0,
      itemDepositValueGross: index % 3 == 0 ? 1.00 : 2.50,
      boxDepositValueGross: index % 3 == 0 ? 2.00 : 5.00,
    );

    final vatPercent = 7 + (index % 3);
    final vatEntity = VatEntity(
      id: 'vat_$index',
      isActive: true,
      code: 'VAT$vatPercent',
      value: vatPercent,
    );

    final isAlcohol = index % 5 == 0;
    final isBio = index % 3 == 0;
    final isVegan = index % 6 == 0;
    final isVegetarian = index % 3 == 0;

    return ProductDetailDao(
      id: id,
      imageUrl: 'https://foodish-api.com/images/$foodType/${foodType}14.jpg',
      nameI18n: '${foodType.replaceAll('-', ' ').toTitleCase()} #$index',
      code: 'CODE${1000 + index}',
      categoryCode: 'CAT${(index % 5) + 1}',
      categoryName:
          ['Organic', 'Frozen', 'Bakery', 'Beverage', 'Snack'][index % 5],
      subcategoryCode: 'SUBCAT${(index % 3) + 1}',
      subcategoryName: ['Premium', 'Standard', 'Economy'][index % 3],
      weight: 100 + (index * 50),
      vatPercent: vatPercent,
      vat: 'VAT$vatPercent',
      ean: 123456789000 + index,
      sku: 'SKU${100 + index}',
      gtin: 'GTIN${1000 + index}',
      isAlcohol: isAlcohol,
      isCustomAgeRestriction: isAlcohol,
      ageRestriction: isAlcohol ? 18 : 0,
      isBio: isBio,
      isFrozen: index % 4 == 0,
      isTobacco: index % 7 == 0,
      isVegan: isVegan,
      isVegetarian: isVegetarian,
      isLactoseFree: index % 4 == 0,
      isGlutenFree: index % 5 == 0,
      isFairTrade: index % 8 == 0,
      defaultPrice: (199 + (index * 10)).toStringAsFixed(2),
      costPrice: (150 + (index * 8)).toStringAsFixed(2),
      alcoholValue: isAlcohol ? '5.0' : '0.0',
      descriptionI18n:
          'Delicious ${foodType.replaceAll('-', ' ')} '
          '${isBio ? '(Organic)' : ''} '
          '${isVegan
              ? '(Vegan)'
              : isVegetarian
              ? '(Vegetarian)'
              : ''}',
      imageUrls: [
        'https://foodish-api.com/images/$foodType/${foodType}14.jpg',
        'https://foodish-api.com/images/$foodType/$foodType${10 + index % 5}.jpg',
      ],
      nutriScore: ['A', 'B', 'C', 'D'][index % 4],
      deposit: (index % 3 == 0 ? '1.00' : '2.50'),
      nutritionalData: nutritionalData,
      productBrandNameI18n: ['Organic', 'Premium', 'Natural'][index % 3],
      manufacturerI18n:
          ['Nature Foods', 'Healthy Choice', 'Pure Harvest'][index % 3],
      ingredientsI18n:
          'Ingredients for ${foodType.replaceAll('-', ' ')}: '
          '${isBio ? 'Organic ' : ''}${foodType.split('-').first}, spices, '
          '${isVegan ? 'plant-based ingredients' : 'natural ingredients'}',
      allergenicInformationI18n:
          'May contain ${['nuts', 'gluten', 'soy', 'milk'][index % 4]}',
      baseSize: '${100 + (index * 50)}g',
      productSize: '1 unit',
      depositEntity: depositEntity,
      vatEntity: vatEntity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 26.0),
                      width: double.infinity,
                      color: BringooColors.neutral.shade50,
                      child:
                          (_productDetail.imageUrls?.isNotEmpty ?? false) &&
                                  Uri.parse(
                                    _productDetail.imageUrls?.first ?? '',
                                  ).isAbsolute
                              ? Image.network(
                                _productDetail.imageUrls?.first ?? '',
                                width: 160.0,
                                height: 160.0,
                                fit: BoxFit.cover,
                              )
                              : Center(
                                child: Container(
                                  color: Colors.white,
                                  width: 160.0,
                                  height: 160.0,
                                ),
                              ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _productDetail.nameI18n ?? '',
                            style: BringooTypoGraphy.paragraph02SemiBold(
                              context,
                            ),
                          ),
                          Text(
                            '${_productDetail.productSize}',
                            style: BringooTypoGraphy.captionSemiBold(
                              context,
                            ).copyWith(color: BringooColors.neutral.shade600),
                          ),
                          const SizedBox(height: 12.0),
                          Row(
                            children: [
                              SvgPicture.asset(IconAssets.box_3d),
                              const SizedBox(width: 4.0),
                              Flexible(
                                child: Text(
                                  _productDetail.code ?? '',
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
                              Text(
                                _productDetail.ean.toString(),
                                style: BringooTypoGraphy.captionRegular(
                                  context,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: -3.0,
                            children: [
                              CategoryChip(
                                label: _productDetail.categoryName ?? '',
                              ),
                              CategoryChip(
                                label: _productDetail.subcategoryName ?? '',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      color: BringooColors.neutral.shade50,
                      width: double.infinity,
                      child: Text(
                        'Information',
                        style: BringooTypoGraphy.paragraph01Regular(
                          context,
                        ).copyWith(color: BringooColors.neutral),
                      ),
                    ),
                    ProductDetailExpandPanel(
                      sections: _productDetailSections,
                      data: _productDetail,
                      onEditIconPress: (DataTypeEnum dataType) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MainProductForm(
                        //       initialIndex: _getSkipIndex(dataType),
                        //       initialData: _productDetail,
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              ),
    );
  }
}

extension StringCasingExtension on String {
  String toTitleCase() {
    return split(
      ' ',
    ).map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }
}
