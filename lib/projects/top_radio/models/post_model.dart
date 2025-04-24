import 'package:portfolio/projects/top_radio/utils/enum.dart';

class PostModel {
  final String? id;
  final String title;
  final String description;
  final String imageUrl;
  final bool isFavorite;
  final String startDate;
  final double price;
  final String place;
  final String durationTime;
  final String placeDescription;
  final String placeLink;
  final String contactPhone;
  final String contactLine;
  final List<String> userFavorites;
  final List<String> totalParticipants;

  final DateTime? createdAt;

  final DateTime? updatedAt;
  final CategoryTagEnum tag;
  final PostTypeEnum? postType;

  PostModel({
    this.id,
    this.title = "",
    this.description = "",
    this.imageUrl = "",
    this.isFavorite = false,
    this.startDate = "",
    this.price = 0,
    this.place = "",
    this.durationTime = "",
    this.placeDescription = "",
    this.placeLink = "",
    this.contactPhone = "",
    this.contactLine = "",
    this.userFavorites = const [],
    this.totalParticipants = const [],
    this.createdAt,
    this.updatedAt,
    this.tag = CategoryTagEnum.unknown,
    this.postType = PostTypeEnum.unknown,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
      isFavorite: json['isFavorite'] ?? false,
      startDate: json['startDate'] ?? "",
      price: (json['price'] ?? 0).toDouble(),
      place: json['place'] ?? "",
      durationTime: json['durationTime'] ?? "",
      placeDescription: json['placeDescription'] ?? "",
      placeLink: json['placeLink'] ?? "",
      contactPhone: json['contactPhone'] ?? "",
      contactLine: json['contactLine'] ?? "",
      userFavorites: List<String>.from(json['userFavorites'] ?? []),
      totalParticipants: List<String>.from(json['totalParticipants'] ?? []),
      createdAt:
          json['createdAt'] != null
              ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'] * 1000)
              : null,
      updatedAt:
          json['updatedAt'] != null
              ? DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] * 1000)
              : null,
      tag: CategoryTagEnum.values.firstWhere(
        (e) => e.toString().split('.').last == json['tag'],
        orElse: () => CategoryTagEnum.unknown,
      ),
      postType:
          json['postType'] != null
              ? PostTypeEnum.values.firstWhere(
                (e) => e.toString().split('.').last == json['postType'],
                orElse: () => PostTypeEnum.unknown,
              )
              : PostTypeEnum.unknown,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
      'startDate': startDate,
      'price': price,
      'place': place,
      'durationTime': durationTime,
      'placeDescription': placeDescription,
      'placeLink': placeLink,
      'contactPhone': contactPhone,
      'contactLine': contactLine,
      'userFavorites': userFavorites,
      'totalParticipants': totalParticipants,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'tag': tag.toString().split('.').last,
      'postType': postType?.toString().split('.').last,
    };
  }

  PostModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    bool? isFavorite,
    String? startDate,
    double? price,
    String? place,
    String? durationTime,
    String? placeDescription,
    String? placeLink,
    String? contactPhone,
    String? contactLine,
    List<String>? userFavorites,
    List<String>? totalParticipants,
    DateTime? createdAt,
    DateTime? updatedAt,
    CategoryTagEnum? tag,
    PostTypeEnum? postType,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      startDate: startDate ?? this.startDate,
      price: price ?? this.price,
      place: place ?? this.place,
      durationTime: durationTime ?? this.durationTime,
      placeDescription: placeDescription ?? this.placeDescription,
      placeLink: placeLink ?? this.placeLink,
      contactPhone: contactPhone ?? this.contactPhone,
      contactLine: contactLine ?? this.contactLine,
      userFavorites: userFavorites ?? this.userFavorites,
      totalParticipants: totalParticipants ?? this.totalParticipants,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tag: tag ?? this.tag,
      postType: postType ?? this.postType,
    );
  }
}
