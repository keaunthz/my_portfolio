import 'package:portfolio/projects/top_radio/models/reward_model.dart';
import 'package:portfolio/projects/top_radio/utils/enum.dart';

List<RewardModel> generateMockRewards() {
  final now = DateTime.now();
  return [
    RewardModel(
      id: "2",
      title: "AirPods Pro 2",
      description: "ลุ้นรับ AirPods Pro 2 จำนวน 5 เครื่อง",
      imageUrl:
          "https://images.unsplash.com/photo-1590658268037-6bf12165a8df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80",
      participants: ["user1", "user2", "user3", "user4"],
      userFavorites: ["user5", "user6"],
      winners: ["user2", "user3"],
      rewardCount: 5,
      startDate: "2023-09-15",
      endDate: "2023-10-15",
      createdAt: now.subtract(const Duration(days: 45)),
      updatedAt: now.subtract(const Duration(days: 10)),
      refLink: "https://example.com/reward/2",
      status: RewardPostStatusEnum.processed,
    ),
    RewardModel(
      id: "3",
      title: "MacBook Air M2",
      description: "ลุ้นรับ MacBook Air M2 1 เครื่อง",
      imageUrl:
          "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
      participants: ["user1", "user2"],
      userFavorites: ["user3", "user4", "user5"],
      winners: [],
      rewardCount: 1,
      startDate: "2023-11-01",
      endDate: "2023-11-30",
      createdAt: now.subtract(const Duration(days: 10)),
      updatedAt: now.subtract(const Duration(days: 2)),
      refLink: "https://example.com/reward/3",
      status: RewardPostStatusEnum.pending,
    ),
    RewardModel(
      id: "4",
      title: "Apple Watch Series 9",
      description: "ลุ้นรับ Apple Watch Series 9 3 เครื่อง",
      imageUrl:
          "https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1528&q=80",
      participants: ["user1", "user2", "user3", "user4", "user5"],
      userFavorites: ["user6", "user7"],
      winners: ["user4"],
      rewardCount: 3,
      startDate: "2023-10-15",
      endDate: "2023-11-15",
      createdAt: now.subtract(const Duration(days: 20)),
      updatedAt: now.subtract(const Duration(days: 1)),
      refLink: "https://example.com/reward/4",
      status: RewardPostStatusEnum.announced,
    ),
    RewardModel(
      id: "5",
      title: "iPad Pro",
      description: "ลุ้นรับ iPad Pro 1 เครื่อง",
      imageUrl:
          "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1511&q=80",
      participants: ["user1", "user2"],
      userFavorites: ["user3"],
      winners: [],
      rewardCount: 1,
      startDate: "2023-12-01",
      endDate: "2023-12-31",
      createdAt: now.subtract(const Duration(days: 5)),
      updatedAt: now.subtract(const Duration(days: 1)),
      refLink: "https://example.com/reward/5",
      status: RewardPostStatusEnum.pending,
    ),
  ];
}
