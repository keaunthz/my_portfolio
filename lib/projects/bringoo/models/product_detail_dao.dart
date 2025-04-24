import 'package:portfolio/projects/bringoo/models/product_request_dao.dart';

class ProductDetailDao {
  String? id;
  String? imageUrl;
  String? nameI18n;
  String? code;
  String? categoryCode;
  String? categoryName;
  String? subcategoryCode;
  String? subcategoryName;
  int? weight;
  int? vatPercent;
  String? vat;
  int? ean;
  String? sku;
  String? gtin;
  bool? isAlcohol;
  bool? isCustomAgeRestriction;
  int? ageRestriction;
  bool? isBio;
  bool? isFrozen;
  bool? isTobacco;
  bool? isVegan;
  bool? isVegetarian;
  bool? isLactoseFree;
  bool? isGlutenFree;
  bool? isFairTrade;
  String? defaultPrice;
  String? costPrice;
  String? alcoholValue;
  String? descriptionI18n;
  List<String>? imageUrls;
  String? nutriScore;
  String? deposit;
  NutritionalData? nutritionalData;
  String? productBrandNameI18n;
  String? manufacturerI18n;
  String? ingredientsI18n;
  String? allergenicInformationI18n;
  String? baseSize;
  String? productSize;
  DepositEntity? depositEntity;
  VatEntity? vatEntity;
  double? basePriceCoefficient;

  ProductDetailDao({
    this.id,
    this.imageUrl,
    this.nameI18n,
    this.code,
    this.categoryCode,
    this.categoryName,
    this.subcategoryCode,
    this.subcategoryName,
    this.weight,
    this.vatPercent,
    this.vat,
    this.ean,
    this.sku,
    this.gtin,
    this.isAlcohol,
    this.isCustomAgeRestriction,
    this.ageRestriction,
    this.isBio,
    this.isFrozen,
    this.isTobacco,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
    this.isGlutenFree,
    this.isFairTrade,
    this.defaultPrice,
    this.costPrice,
    this.alcoholValue,
    this.descriptionI18n,
    this.imageUrls,
    this.nutriScore,
    this.deposit,
    this.nutritionalData,
    this.productBrandNameI18n,
    this.manufacturerI18n,
    this.ingredientsI18n,
    this.allergenicInformationI18n,
    this.baseSize,
    this.productSize,
    this.depositEntity,
    this.vatEntity,
  });

  ProductDetailDao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    nameI18n = json['name_i18n'];
    code = json['code'];
    categoryCode = json['categoryCode'];
    categoryName = json['categoryName'];
    subcategoryCode = json['subcategoryCode'];
    subcategoryName = json['subcategoryName'];
    weight = json['weight'];
    vatPercent = json['vatPercent'];
    vat = json['vat'];
    ean = json['ean'];
    sku = json['sku'];
    gtin = json['gtin'];
    isAlcohol = json['isAlcohol'];
    isCustomAgeRestriction = json['isCustomAgeRestriction'];
    ageRestriction = json['ageRestriction'];
    isBio = json['isBio'];
    isFrozen = json['isFrozen'];
    isTobacco = json['isTobacco'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    isLactoseFree = json['isLactoseFree'];
    isGlutenFree = json['isGlutenFree'];
    isFairTrade = json['isFairTrade'];
    defaultPrice = json['defaultPrice'];
    costPrice = json['costPrice'];
    alcoholValue = json['alcoholValue'];
    descriptionI18n = json['description_i18n'];
    imageUrls = json['imageUrls'].cast<String>();
    nutriScore = json['nutriScore'];
    deposit = json['deposit'];
    nutritionalData =
        json['nutritional_data'] != null
            ? NutritionalData.fromJson(json['nutritional_data'])
            : null;
    productBrandNameI18n = json['productBrandName_i18n'];
    manufacturerI18n = json['manufacturer_i18n'];
    ingredientsI18n = json['ingredients_i18n'];
    allergenicInformationI18n = json['allergenic_information_i18n'];
    baseSize = json['baseSize'];
    productSize = json['productSize'];
    depositEntity =
        json['depositEntity'] != null
            ? DepositEntity.fromJson(json['depositEntity'])
            : null;
    vatEntity =
        json['vatEntity'] != null
            ? VatEntity.fromJson(json['vatEntity'])
            : null;
    basePriceCoefficient = double.tryParse(
      json['basePriceCoefficient'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['name_i18n'] = nameI18n;
    data['code'] = code;
    data['categoryCode'] = categoryCode;
    data['categoryName'] = categoryName;
    data['subcategoryCode'] = subcategoryCode;
    data['subcategoryName'] = subcategoryName;
    data['weight'] = weight;
    data['vatPercent'] = vatPercent;
    data['vat'] = vat;
    data['ean'] = ean;
    data['sku'] = sku;
    data['gtin'] = gtin;
    data['isAlcohol'] = isAlcohol;
    data['isCustomAgeRestriction'] = isCustomAgeRestriction;
    data['ageRestriction'] = ageRestriction;
    data['isBio'] = isBio;
    data['isFrozen'] = isFrozen;
    data['isTobacco'] = isTobacco;
    data['isVegan'] = isVegan;
    data['isVegetarian'] = isVegetarian;
    data['isLactoseFree'] = isLactoseFree;
    data['isGlutenFree'] = isGlutenFree;
    data['isFairTrade'] = isFairTrade;
    data['defaultPrice'] = defaultPrice;
    data['costPrice'] = costPrice;
    data['alcoholValue'] = alcoholValue;
    data['description_i18n'] = descriptionI18n;
    data['imageUrls'] = imageUrls;
    data['nutriScore'] = nutriScore;
    data['deposit'] = deposit;
    if (nutritionalData != null) {
      data['nutritional_data'] = nutritionalData!.toJson();
    }
    data['productBrandName_i18n'] = productBrandNameI18n;
    data['manufacturer_i18n'] = manufacturerI18n;
    data['ingredients_i18n'] = ingredientsI18n;
    data['allergenic_information_i18n'] = allergenicInformationI18n;
    data['baseSize'] = baseSize;
    data['productSize'] = productSize;
    if (depositEntity != null) {
      data['depositEntity'] = depositEntity!.toJson();
    }
    if (depositEntity != null) {
      data['vatEntity'] = vatEntity!.toJson();
    }
    data['basePriceCoefficient'] = basePriceCoefficient;
    return data;
  }

  List<Attribute> getAttributes() {
    final List<Attribute> attributes = [];
    attributes.add(
      Attribute(key: 'isBio', label: 'BIO / Organic', value: isBio ?? false),
    );
    attributes.add(
      Attribute(key: 'isFrozen', label: 'Frozen', value: isFrozen ?? false),
    );
    attributes.add(
      Attribute(
        key: 'isGlutenFree',
        label: 'Gluten Free',
        value: isGlutenFree ?? false,
      ),
    );
    attributes.add(
      Attribute(
        key: 'isLactoseFree',
        label: 'Lactose Free',
        value: isLactoseFree ?? false,
      ),
    );
    attributes.add(
      Attribute(key: 'isTobacco', label: 'Tobacco', value: isTobacco ?? false),
    );
    attributes.add(
      Attribute(key: 'isVegan', label: 'Vegan', value: isVegan ?? false),
    );
    attributes.add(
      Attribute(
        key: 'isVegetarian',
        label: 'Vegetarian',
        value: isVegetarian ?? false,
      ),
    );
    attributes.add(
      Attribute(
        key: 'isFairTrade',
        label: 'Fair Trade',
        value: isFairTrade ?? false,
      ),
    );
    return attributes;
  }
}

class NutritionalData {
  double? energyTotal;
  double? calories;
  double? fatTotal;
  double? fatSaturates;
  double? carbohydrateTotal;
  double? carbohydrateSugars;
  double? fibres;
  double? protein;
  double? salt;

  NutritionalData({
    this.energyTotal,
    this.calories,
    this.fatTotal,
    this.fatSaturates,
    this.carbohydrateTotal,
    this.carbohydrateSugars,
    this.fibres,
    this.protein,
    this.salt,
  });

  NutritionalData.fromJson(Map<String, dynamic> json) {
    energyTotal = double.tryParse(json['energyTotal'].toString());
    calories = double.tryParse(json['calories'].toString());
    fatTotal = double.tryParse(json['fatTotal'].toString());
    fatSaturates = double.tryParse(json['fatSaturates'].toString());
    carbohydrateTotal = double.tryParse(json['carbohydrateTotal'].toString());
    carbohydrateSugars = double.tryParse(json['carbohydrateSugars'].toString());
    fibres = double.tryParse(json['fibres'].toString());
    protein = double.tryParse(json['protein'].toString());
    salt = double.tryParse(json['salt'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['energyTotal'] = energyTotal;
    data['calories'] = calories;
    data['fatTotal'] = fatTotal;
    data['fatSaturates'] = fatSaturates;
    data['carbohydrateTotal'] = carbohydrateTotal;
    data['carbohydrateSugars'] = carbohydrateSugars;
    data['fibres'] = fibres;
    data['protein'] = protein;
    data['salt'] = salt;
    return data;
  }

  List<NutritionalModel> getNutritionalList() {
    final List<NutritionalModel> nutritionalModel = [];
    nutritionalModel.add(
      NutritionalModel(
        key: 'energyTotal',
        label: 'Total Energy',
        value: energyTotal,
        unitLabel: 'kJ',
        isDouble: false,
      ),
    );
    nutritionalModel.add(
      NutritionalModel(
        key: 'calories',
        label: 'Calories',
        value: calories,
        unitLabel: 'kCal',
        isDouble: false,
      ),
    );
    nutritionalModel.add(
      NutritionalModel(
        key: 'fatTotal',
        label: 'Total Fat',
        value: fatTotal,
        unitLabel: 'g',
      ),
    );
    nutritionalModel.add(
      NutritionalModel(
        key: 'fatSaturates',
        label: 'Saturated fat',
        value: fatSaturates,
        unitLabel: 'g',
        depth: 1,
      ),
    );
    nutritionalModel.add(
      NutritionalModel(
        key: 'carbohydrateTotal',
        label: 'Total Carbohydrate',
        value: carbohydrateTotal,
        unitLabel: 'g',
      ),
    );
    nutritionalModel.add(
      NutritionalModel(
        key: 'carbohydrateSugars',
        label: 'Sugar',
        value: carbohydrateSugars,
        unitLabel: 'g',
        depth: 1,
      ),
    );
    nutritionalModel.add(
      NutritionalModel(
        key: 'fibres',
        label: 'Fibres',
        value: fibres,
        unitLabel: 'g',
        depth: 1,
      ),
    );
    nutritionalModel.add(
      NutritionalModel(
        key: 'protein',
        label: 'Protein',
        value: protein,
        unitLabel: 'g',
      ),
    );
    nutritionalModel.add(
      NutritionalModel(key: 'salt', label: 'Salt', value: salt, unitLabel: 'g'),
    );
    return nutritionalModel;
  }

  String getNutritionString() {
    return getNutritionalList()
        .where((element) => (element.value ?? 0.0) > 0.0)
        .map((e) => '${e.key}: ${e.value}')
        .join(', ');
  }

  Map<String, dynamic> nutritionToMap() {
    return {
      "energyTotal": energyTotal,
      "calories": calories,
      "fatTotal": fatTotal,
      "fatSaturates": fatSaturates,
      "carbohydrateTotal": carbohydrateTotal,
      "carbohydrateSugars": carbohydrateSugars,
      "fibres": fibres,
      "protein": protein,
      "salt": salt,
    };
  }
}

class DepositEntity {
  String? id;
  bool? isActive;
  String? createDate;
  String? updateDate;
  String? deletedDate;
  double? itemDepositValueGross;
  double? boxDepositValueGross;

  DepositEntity({
    this.id,
    this.isActive,
    this.createDate,
    this.updateDate,
    this.deletedDate,
    this.itemDepositValueGross,
    this.boxDepositValueGross,
  });

  DepositEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    deletedDate = json['deleted_date'];
    itemDepositValueGross = double.tryParse(
      json['itemDepositValueGross'].toString(),
    );
    boxDepositValueGross = double.tryParse(
      json['boxDepositValueGross'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isActive'] = isActive;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['deleted_date'] = deletedDate;
    data['itemDepositValueGross'] = itemDepositValueGross;
    data['boxDepositValueGross'] = boxDepositValueGross;
    return data;
  }
}

class NutritionalModel {
  String? key;
  String? label;
  double? value;
  String? unitLabel;
  int? depth = 0;
  bool? isDouble = true;

  NutritionalModel({
    this.key,
    this.label,
    this.value,
    this.unitLabel,
    this.depth,
    this.isDouble,
  });
}

class VatEntity {
  String? id;
  bool? isActive;
  String? createDate;
  String? updateDate;
  String? deletedDate;
  NameI18n? nameI18n;
  NameI18n? descriptionI18n;
  String? code;
  int? value;

  VatEntity({
    this.id,
    this.isActive,
    this.createDate,
    this.updateDate,
    this.deletedDate,
    this.nameI18n,
    this.descriptionI18n,
    this.code,
    this.value,
  });

  VatEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    deletedDate = json['deleted_date'];
    nameI18n =
        json['name_i18n'] != null ? NameI18n.fromJson(json['name_i18n']) : null;
    descriptionI18n =
        json['description_i18n'] != null
            ? NameI18n.fromJson(json['description_i18n'])
            : null;
    code = json['code'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isActive'] = isActive;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['deleted_date'] = deletedDate ?? '';
    if (nameI18n != null) {
      data['name_i18n'] = nameI18n!.toJson();
    }
    if (descriptionI18n != null) {
      data['description_i18n'] = descriptionI18n!.toJson();
    }
    data['code'] = code;
    data['value'] = value;
    return data;
  }
}
