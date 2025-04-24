import 'package:flutter/material.dart';
import 'package:portfolio/projects/bringoo/models/job_model.dart';
import 'package:portfolio/projects/bringoo/widgets/job_card_item.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';
import 'package:portfolio/utils/app.dart';

final List<String> jobListTabLabels = [
  "All",
  "Not Started",
  "In Progress",
  "Done",
  "Cancelled",
];

List<JobModel> _generateMockJobs(String statusFilter) {
  final now = DateTime.now();
  final jobs = [
    JobModel(
      id: '1',
      status: 'available',
      shopName: 'GP Niendorfer Getrankemarkt Kieler StraBe',
      jobId: '3588839',
      date: now.subtract(Duration(hours: 2)),
      imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4',
    ),
    JobModel(
      id: '2',
      status: 'inprogress',
      shopName: 'Beverage World Hamburg',
      jobId: '3588840',
      date: now.subtract(Duration(hours: 1)),
      imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5',
    ),
    JobModel(
      id: '3',
      status: 'done',
      shopName: 'Super Drinks Berlin',
      jobId: '3588841',
      date: now.subtract(Duration(days: 1)),
      imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4',
    ),
    JobModel(
      id: '4',
      status: 'called',
      shopName: 'Liquor Store Munich',
      jobId: '3588842',
      date: now.subtract(Duration(days: 2)),
      imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5',
    ),
    JobModel(
      id: '5',
      status: 'available',
      shopName: 'Drink Market Frankfurt',
      jobId: '3588843',
      date: now.subtract(Duration(hours: 3)),
      imageUrl: 'https://images.unsplash.com/photo-1561758033-7e924f619b47',
    ),
  ];

  if (statusFilter == 'All') return jobs;

  return jobs.where((job) {
    switch (statusFilter) {
      case 'Not Started':
        return job.status == 'available';
      case 'In Progress':
        return job.status == 'inprogress';
      case 'Done':
        return job.status == 'done';
      case 'Cancelled':
        return job.status == 'called';
      default:
        return true;
    }
  }).toList();
}

class JobListPage extends StatefulWidget {
  const JobListPage({super.key});

  @override
  State<JobListPage> createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage>
    with TickerProviderStateMixin {
  late final TabController tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: jobListTabLabels.length, vsync: this);
  }

  void _handleTabPressed(int index) {
    FocusScope.of(context).unfocus();
    AppUtils.hideKeyboard();
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Job List")),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              controller: tabController,
              onTap: _handleTabPressed,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 4.0,
                  color: BringooColors.primary,
                ),
                insets: EdgeInsets.symmetric(horizontal: 4.0),
              ),
              physics: const ClampingScrollPhysics(),
              isScrollable: true,
              tabs:
                  jobListTabLabels
                      .asMap()
                      .entries
                      .map(
                        (e) => _buildTabBar(
                          label: e.value,
                          isActive: tabIndex == e.key,
                        ),
                      )
                      .toList(),
            ),
            Expanded(
              child: Container(
                color: BringooColors.neutral.shade50,
                child: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildForm(statusFilter: 'all'),
                    _buildForm(statusFilter: 'Not Started'),
                    _buildForm(statusFilter: 'In Progress'),
                    _buildForm(statusFilter: 'Done'),
                    _buildForm(statusFilter: 'Cancelled'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar({String label = '', bool isActive = false}) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: BringooTypoGraphy.paragraph01SemiBold(context).copyWith(
              color: isActive ? BringooColors.primary : BringooColors.neutral,
            ),
          ),

          const SizedBox(height: 4.0),
        ],
      ),
    );
  }

  Widget _buildForm({required String statusFilter}) {
    final jobs = _generateMockJobs(statusFilter);

    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final job = jobs[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: JobCardItem(job: job),
              );
            }, childCount: jobs.length),
          ),
        ),
      ],
    );
  }
}
