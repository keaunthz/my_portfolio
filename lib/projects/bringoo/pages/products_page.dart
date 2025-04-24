import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/icon_assets.dart';
import 'package:portfolio/projects/bringoo/models/product_dao.dart';
import 'package:portfolio/projects/bringoo/widgets/list_product_mock.dart';
import 'package:portfolio/projects/bringoo/widgets/product_detail.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/utils/app.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<ProductDAO> _products = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMockProducts();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _loadMockProducts() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _products = _generateMockProducts(10);
        _isLoading = false;
      });
    });
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  List<ProductDAO> _generateMockProducts(int count) {
    final foodType = [
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

    return List.generate(count, (index) {
      return ProductDAO(
        id: 'prod_${index + 1}',
        code: 'CODE${1000 + index}',
        ean: 123456789000 + index,
        sku: 'SKU${index + 100}',
        gtin: 'GTIN${index + 1000}',
        isAlcohol: index % 5 == 0,
        isBio: index % 3 == 0,
        isTobacco: index % 7 == 0,
        isFrozen: index % 4 == 0,
        isVegan: index % 6 == 0,
        isGlutenFree: index % 5 == 0,
        isFairTrade: index % 8 == 0,
        isVegetarian: index % 3 == 0,
        isLactoseFree: index % 4 == 0,
        categoryCode: 'CAT${(index % 5) + 1}',
        imageUrl:
            'https://foodish-api.com/images/${foodType[index % foodType.length]}/${foodType[index % foodType.length]}14.jpg',
        nameI18n: 'Product ${index + 1}',
        subcategoryCode: 'SUBCAT${(index % 3) + 1}',
        vat: 'VAT${(index % 3) + 1}',
        vatPercent: 7 + (index % 3),
      );
    });
  }

  List<ProductDAO> _filterProducts(String query) {
    if (query.isEmpty) return _products;

    return _products.where((product) {
      final name = product.nameI18n?.toLowerCase() ?? '';
      final code = product.code?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();

      return name.contains(searchLower) ||
          code.contains(searchLower) ||
          product.ean.toString().contains(searchLower);
    }).toList();
  }

  void _handleItemTap(String productId) {
    FocusManager.instance.primaryFocus?.unfocus();
    AppUtils.hideKeyboard();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetail(productId: productId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _filterProducts(_searchQuery);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by code or barcode',
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16.0,
                    end: 8.0,
                  ),
                  child: SvgPicture.asset(
                    IconAssets.search,
                    width: 16.0,
                    height: 16.0,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 8.0,
                    end: 16.0,
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 12.0,
                    children: [
                      if (_searchQuery.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            _searchController.clear();
                            FocusManager.instance.primaryFocus?.unfocus();
                            AppUtils.hideKeyboard();
                          },
                          child: SvgPicture.asset(
                            IconAssets.close,
                            color: BringooColors.neutral[400],
                          ),
                        ),
                      GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          AppUtils.hideKeyboard();
                        },
                        child: SvgPicture.asset(IconAssets.scanner),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child:
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListProductMock(
                        onItemTap: _handleItemTap,
                        item: filteredProducts,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
