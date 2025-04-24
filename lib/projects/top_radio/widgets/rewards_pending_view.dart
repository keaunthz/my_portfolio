import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/projects/top_radio/models/reward_model.dart';
import 'package:portfolio/projects/top_radio/utils/enum.dart';
import 'package:portfolio/projects/top_radio/utils/mock_reward_data.dart';
import 'package:portfolio/projects/top_radio/widgets/reward_item_widget.dart';

class RewardsPendingView extends StatefulWidget {
  const RewardsPendingView({super.key});

  @override
  State<RewardsPendingView> createState() => _RewardsPendingViewState();
}

class _RewardsPendingViewState extends State<RewardsPendingView> {
  late Future<List<RewardModel>> _rewardsFuture;

  @override
  void initState() {
    super.initState();
    _rewardsFuture = Future.delayed(
      const Duration(seconds: 1),
      () =>
          generateMockRewards()
              .where((reward) => reward.status == RewardPostStatusEnum.pending)
              .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RewardModel>>(
      future: _rewardsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final rewards = snapshot.data ?? [];

        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: rewards.length,
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (ctx, index) => const Gap(16),
                  itemBuilder: (ctx, index) {
                    final reward = rewards[index];
                    return RewardItemWidget(
                      item: reward,
                      onItemTap: () {
                        // TODO: Implement navigation
                      },
                    );
                  },
                ),
              ),
              const Gap(16),
            ],
          ),
        );
      },
    );
  }
}
