import 'package:portfolio/projects/top_radio/utils/enum.dart';

class RewardModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> participants;
  final List<String> userFavorites;
  final List<String> winners;
  final int? rewardCount;
  final String startDate;
  final String endDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String refLink;
  final RewardPostStatusEnum status;

  RewardModel({
    this.id = "",
    this.title = "",
    this.description = "",
    this.imageUrl = "",
    this.participants = const [],
    this.userFavorites = const [],
    this.winners = const [],
    this.rewardCount,
    this.startDate = "",
    this.endDate = "",
    this.createdAt,
    this.updatedAt,
    this.refLink = "",
    this.status = RewardPostStatusEnum.pending,
  });

  // Copy with method
  RewardModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    List<String>? participants,
    List<String>? userFavorites,
    List<String>? winners,
    int? rewardCount,
    String? startDate,
    String? endDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? refLink,
    RewardPostStatusEnum? status,
  }) {
    return RewardModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      participants: participants ?? this.participants,
      userFavorites: userFavorites ?? this.userFavorites,
      winners: winners ?? this.winners,
      rewardCount: rewardCount ?? this.rewardCount,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      refLink: refLink ?? this.refLink,
      status: status ?? this.status,
    );
  }
}
