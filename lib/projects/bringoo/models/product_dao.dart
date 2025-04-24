class ProductListDAO {
  int? total;
  int? pageCount;
  int? page;
  int? count;
  List<ProductDAO>? data;

  ProductListDAO(
      {this.total, this.pageCount, this.page, this.count, this.data});

  ProductListDAO.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pageCount = json['pageCount'];
    page = json['page'];
    count = json['count'];
    if (json['data'] != null) {
      data = <ProductDAO>[];
      json['data'].forEach((v) {
        data!.add(ProductDAO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['pageCount'] = pageCount;
    data['page'] = page;
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDAO {
  String? id;
  String? code;
  int? ean;
  String? sku;
  String? gtin;
  int? weight;
  bool? isAlcohol;
  bool? isBio;
  bool? isTobacco;
  bool? isFrozen;
  bool? isVegan;
  bool? isGlutenFree;
  bool? isFairTrade;
  bool? isVegetarian;
  bool? isLactoseFree;
  String? categoryCode;
  String? categoryName;
  String? subcategoryName;
  String? imageUrl;
  String? nameI18n;
  String? subcategoryCode;
  String? vat;
  int? vatPercent;

  ProductDAO(
      {this.id,
      this.code,
      this.ean,
      this.sku,
      this.gtin,
      this.isAlcohol,
      this.isBio,
      this.isTobacco,
      this.isFrozen,
      this.isVegan,
      this.isGlutenFree,
      this.isFairTrade,
      this.isVegetarian,
      this.isLactoseFree,
      this.categoryCode,
      this.imageUrl,
      this.nameI18n,
      this.subcategoryCode,
      this.vat,
      this.vatPercent});

  ProductDAO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    ean = json['ean'];
    sku = json['sku'];
    gtin = json['gtin'];
    weight = json['weight'];
    isAlcohol = json['isAlcohol'];
    isBio = json['isBio'];
    isTobacco = json['isTobacco'];
    isFrozen = json['isFrozen'];
    isVegan = json['isVegan'];
    isGlutenFree = json['isGlutenFree'];
    isFairTrade = json['isFairTrade'];
    isVegetarian = json['isVegetarian'];
    isLactoseFree = json['isLactoseFree'];
    categoryCode = json['categoryCode'];
    imageUrl = json['imageUrl'];
    nameI18n = json['name_i18n'];
    subcategoryCode = json['subcategoryCode'];
    categoryName = json['categoryName'];
    subcategoryName = json['subcategoryName'];
    vat = json['vat'];
    vatPercent = json['vatPercent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['ean'] = ean;
    data['sku'] = sku;
    data['gtin'] = gtin;
    data['weight'] = weight;
    data['isAlcohol'] = isAlcohol;
    data['isBio'] = isBio;
    data['isTobacco'] = isTobacco;
    data['isFrozen'] = isFrozen;
    data['isVegan'] = isVegan;
    data['isGlutenFree'] = isGlutenFree;
    data['isFairTrade'] = isFairTrade;
    data['isVegetarian'] = isVegetarian;
    data['isLactoseFree'] = isLactoseFree;
    data['categoryCode'] = categoryCode;
    data['imageUrl'] = imageUrl;
    data['name_i18n'] = nameI18n;
    data['subcategoryCode'] = subcategoryCode;
    data['categoryName'] = categoryName;
    data['subcategoryName'] = subcategoryName;
    data['vat'] = vat;
    data['vatPercent'] = vatPercent;
    return data;
  }
}
