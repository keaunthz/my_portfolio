import 'package:portfolio/projects/bringoo/models/product_detail_dao.dart';

class ProductRequestDao {
  String? id;
  bool? isActive;
  String? createDate;
  String? updateDate;
  String? deletedDate;
  NameI18n? nameI18n;
  NameI18n? descriptionI18n;
  String? code;
  String? noteInternal;
  String? noteExternal;
  String? gtin;
  // String? metaData;
  String? sku;
  int? ean;
  String? slug;
  bool? isCustomAgeRestriction;
  int? ageRestriction;
  bool? isAlcohol;
  double? alcoholValue;
  bool? isApproved;
  bool? isPublic;
  bool? isBio;
  bool? isFrozen;
  bool? isTobacco;
  bool? isVegan;
  bool? isVegetarian;
  bool? isLactoseFree;
  bool? isGlutenFree;
  bool? isFairTrade;
  String? isPublicDateTime;
  bool? isPickup;
  bool? isPickAndDrive;
  bool? isOnlineShipment;
  String? productBrandCode;
  String? productSubcategoryCode;
  String? productCategoryCode;
  List<String>? imageUrls;
  int? weight;
  String? productUnitCode;
  String? nutriScore;
  String? baseUnitCode;
  int? productMeasurement;
  int? baseMeasurement;
  int? defaultPrice;
  int? costPrice;
  bool? chargeTax;
  String? depositId;
  String? vatCode;
  String? basePriceCoefficient;
  NameI18n? tagsI18n;
  NameI18n? manufacturerI18n;
  NutritionalData? nutritionalData;
  NameI18n? ingredientsI18n;
  NameI18n? specialNotesI18n;
  NameI18n? allergenicInformationI18n;
  String? staffId;
  String? staffNote;
  String? managerId;
  String? managerNote;
  String? status;
  String? requestDecisionTime;

  ProductRequestDao({
    this.id,
    this.isActive,
    this.createDate,
    this.updateDate,
    this.deletedDate,
    this.nameI18n,
    this.descriptionI18n,
    this.code,
    this.noteInternal,
    this.noteExternal,
    this.gtin,
    // this.metaData,
    this.sku,
    this.ean,
    this.slug,
    this.isCustomAgeRestriction,
    this.ageRestriction,
    this.isAlcohol,
    this.alcoholValue,
    this.isApproved,
    this.isPublic,
    this.isBio,
    this.isFrozen,
    this.isTobacco,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
    this.isGlutenFree,
    this.isFairTrade,
    this.isPublicDateTime,
    this.isPickup,
    this.isPickAndDrive,
    this.isOnlineShipment,
    this.productBrandCode,
    this.productSubcategoryCode,
    this.productCategoryCode,
    this.imageUrls,
    this.weight,
    this.productUnitCode,
    this.nutriScore,
    this.baseUnitCode,
    this.productMeasurement,
    this.baseMeasurement,
    this.defaultPrice,
    this.costPrice,
    this.chargeTax,
    this.depositId,
    this.vatCode,
    this.basePriceCoefficient,
    this.tagsI18n,
    this.manufacturerI18n,
    this.nutritionalData,
    this.ingredientsI18n,
    this.specialNotesI18n,
    this.allergenicInformationI18n,
    this.staffId,
    this.staffNote,
    this.managerId,
    this.managerNote,
    this.status,
    this.requestDecisionTime,
  });

  ProductRequestDao.fromJson(Map<String, dynamic> json) {
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
    noteInternal = json['note_internal'];
    noteExternal = json['note_external'];
    gtin = json['gtin'];
    // metaData = json['metaData'];
    sku = json['sku'];
    ean = json['ean'];
    slug = json['slug'];
    isCustomAgeRestriction = json['isCustomAgeRestriction'];
    ageRestriction = json['ageRestriction'];
    isAlcohol = json['isAlcohol'];
    alcoholValue = double.tryParse(json['alcoholValue'].toString());
    isApproved = json['isApproved'];
    isPublic = json['isPublic'];
    isBio = json['isBio'];
    isFrozen = json['isFrozen'];
    isTobacco = json['isTobacco'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    isLactoseFree = json['isLactoseFree'];
    isGlutenFree = json['isGlutenFree'];
    isFairTrade = json['isFairTrade'];
    isPublicDateTime = json['isPublicDateTime'];
    isPickup = json['isPickup'];
    isPickAndDrive = json['isPickAndDrive'];
    isOnlineShipment = json['isOnlineShipment'];
    productBrandCode = json['productBrandCode'];
    productSubcategoryCode = json['productSubcategoryCode'];
    productCategoryCode = json['productCategoryCode'];
    imageUrls = json['imageUrls'].cast<String>();
    weight = json['weight'];
    productUnitCode = json['productUnitCode'];
    nutriScore = json['nutriScore'];
    baseUnitCode = json['baseUnitCode'];
    productMeasurement = json['productMeasurement'];
    baseMeasurement = json['baseMeasurement'];
    defaultPrice = json['defaultPrice'];
    costPrice = json['costPrice'];
    chargeTax = json['chargeTax'];
    depositId = json['depositId'];
    vatCode = json['vatCode'];
    basePriceCoefficient = json['basePriceCoefficient'];
    tagsI18n =
        json['tags_i18n'] != null ? NameI18n.fromJson(json['tags_i18n']) : null;
    manufacturerI18n =
        json['manufacturer_i18n'] != null
            ? NameI18n.fromJson(json['manufacturer_i18n'])
            : null;
    nutritionalData =
        json['nutritional_data'] != null
            ? NutritionalData.fromJson(json['nutritional_data'])
            : null;
    ingredientsI18n =
        json['ingredients_i18n'] != null
            ? NameI18n.fromJson(json['ingredients_i18n'])
            : null;
    specialNotesI18n =
        json['special_notes_i18n'] != null
            ? NameI18n.fromJson(json['special_notes_i18n'])
            : null;
    allergenicInformationI18n =
        json['allergenic_information_i18n'] != null
            ? NameI18n.fromJson(json['allergenic_information_i18n'])
            : null;
    staffId = json['staffId'];
    staffNote = json['staffNote'];
    managerId = json['managerId'];
    managerNote = json['managerNote'];
    status = json['status'];
    requestDecisionTime = json['requestDecisionTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isActive'] = isActive;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['deleted_date'] = deletedDate;
    if (nameI18n != null) {
      data['name_i18n'] = nameI18n!.toJson();
    }
    if (descriptionI18n != null) {
      data['description_i18n'] = descriptionI18n!.toJson();
    }
    data['code'] = code;
    data['note_internal'] = noteInternal;
    data['note_external'] = noteExternal;
    data['gtin'] = gtin;
    // data['metaData'] = metaData;
    data['sku'] = sku;
    data['ean'] = ean;
    data['slug'] = slug;
    data['isCustomAgeRestriction'] = isCustomAgeRestriction;
    data['ageRestriction'] = ageRestriction;
    data['isAlcohol'] = isAlcohol;
    data['alcoholValue'] = alcoholValue;
    data['isApproved'] = isApproved;
    data['isPublic'] = isPublic;
    data['isBio'] = isBio;
    data['isFrozen'] = isFrozen;
    data['isTobacco'] = isTobacco;
    data['isVegan'] = isVegan;
    data['isVegetarian'] = isVegetarian;
    data['isLactoseFree'] = isLactoseFree;
    data['isGlutenFree'] = isGlutenFree;
    data['isFairTrade'] = isFairTrade;
    data['isPublicDateTime'] = isPublicDateTime;
    data['isPickup'] = isPickup;
    data['isPickAndDrive'] = isPickAndDrive;
    data['isOnlineShipment'] = isOnlineShipment;
    data['productBrandCode'] = productBrandCode;
    data['productSubcategoryCode'] = productSubcategoryCode;
    data['productCategoryCode'] = productCategoryCode;
    data['imageUrls'] = imageUrls;
    data['weight'] = weight;
    data['productUnitCode'] = productUnitCode;
    data['nutriScore'] = nutriScore;
    data['baseUnitCode'] = baseUnitCode;
    data['productMeasurement'] = productMeasurement;
    data['baseMeasurement'] = baseMeasurement;
    data['defaultPrice'] = defaultPrice;
    data['costPrice'] = costPrice;
    data['chargeTax'] = chargeTax;
    data['depositId'] = depositId;
    data['vatCode'] = vatCode;
    data['basePriceCoefficient'] = basePriceCoefficient;
    data['tags_i18n'] = tagsI18n;
    data['manufacturer_i18n'] = manufacturerI18n;
    data['nutritionalData'] = nutritionalData;
    data['ingredients_i18n'] = ingredientsI18n;
    data['special_notes_i18n'] = specialNotesI18n;
    data['allergenic_information_i18n'] = allergenicInformationI18n;
    data['staffId'] = staffId;
    data['staffNote'] = staffNote;
    data['managerId'] = managerId;
    data['managerNote'] = managerNote;
    data['status'] = status;
    data['requestDecisionTime'] = requestDecisionTime;
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

class Attribute {
  String? key;
  String? label;
  bool? value;

  Attribute({this.key, this.label, this.value});
}

class NameI18n {
  String? dE;
  String? eN;
  String? fR;

  NameI18n({this.dE, this.eN, this.fR});

  NameI18n.fromJson(Map<String, dynamic> json) {
    dE = json['DE'];
    eN = json['EN'];
    fR = json['FR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DE'] = dE;
    data['EN'] = eN;
    data['FR'] = fR;
    return data;
  }
}
