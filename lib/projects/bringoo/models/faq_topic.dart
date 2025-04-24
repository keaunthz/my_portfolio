class FaqTopicDao {
  String? id;
  String? code;
  String? name;
  String? description;
  String? dateStart;
  String? dateEnd;
  List<FaqTopicItem>? items;

  FaqTopicDao({
    this.id,
    this.code,
    this.name,
    this.description,
    this.dateStart,
    this.dateEnd,
    this.items,
  });

  FaqTopicDao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    dateStart = json['dateStart'];
    dateEnd = json['dateEnd'];
    if (json['items'] != null) {
      items = <FaqTopicItem>[];
      json['items'].forEach((v) {
        items!.add(FaqTopicItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['description'] = description;
    data['dateStart'] = dateStart;
    data['dateEnd'] = dateEnd;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FaqTopicItem {
  String? id;
  String? code;
  String? userGroup;
  String? name;
  String? description;
  String? dateStart;
  String? dateEnd;

  FaqTopicItem({
    this.id,
    this.code,
    this.userGroup,
    this.name,
    this.description,
    this.dateStart,
    this.dateEnd,
  });

  FaqTopicItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    userGroup = json['userGroup'];
    name = json['name'];
    description = json['description'];
    dateStart = json['dateStart'];
    dateEnd = json['dateEnd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['userGroup'] = userGroup;
    data['name'] = name;
    data['description'] = description;
    data['dateStart'] = dateStart;
    data['dateEnd'] = dateEnd;
    return data;
  }
}
