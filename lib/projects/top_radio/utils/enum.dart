enum CategoryTagEnum {
  entertainment,
  health,
  promotion,
  food,
  houseWork,
  unknown,
}

extension CategoryTagEnumExtension on CategoryTagEnum {
  String get locale => switch (this) {
    CategoryTagEnum.entertainment => 'บันเทิง',
    CategoryTagEnum.health => 'สุขภาพ',
    CategoryTagEnum.promotion => 'โปรโมชั่น',
    CategoryTagEnum.food => 'อาหาร',
    CategoryTagEnum.houseWork => 'งานบ้าน',
    CategoryTagEnum.unknown => 'Unknown',
  };
}

List<CategoryTagEnum> categoryTagList =
    CategoryTagEnum.values.where((e) => e.name != 'unknown').toList();

enum PostTypeEnum { news, event, unknown }

enum RewardPostStatusEnum { pending, announced, processed }
