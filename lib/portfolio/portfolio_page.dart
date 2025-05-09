// 📦 Updated: Responsive, Centered Layout, Smooth Scroll, and Animations

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/portfolio/data/portfolio.dart';
import 'package:portfolio/portfolio/widgets/device_frame.dart';
import 'package:portfolio/portfolio/widgets/project_detail_widget.dart';
import 'package:portfolio/portfolio/widgets/stepper_widget.dart';
import 'package:portfolio/portfolio/widgets/vertical_divider_widget.dart';
import 'package:portfolio/projects/top_radio/services/audio_service.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/bringoo_typography.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutQuart,
        alignment: 0.1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFDAE6E8),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                centerTitle: true,
                pinned: true,
                backgroundColor: Colors.white,
                toolbarHeight: 50,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.symmetric(horizontal: 20),
                  title: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => _scrollToSection(_contactKey),
                          child: Text(
                            Portfolio.name,
                            style: BringooTypoGraphy.captionSemiBold(
                              context,
                            ).copyWith(
                              fontSize: 16,
                              color: BringooColors.darkBlue,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                const url =
                                    'https://drive.google.com/file/d/17IsOjbaCRtVdzB33s-3xp--LvdaS9Ijm/view';
                                if (await canLaunchUrl(Uri.parse(url))) {
                                  await launchUrl(
                                    Uri.parse(url),
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: BringooColors.oceanTeal,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  "Download my CV",
                                  style: BringooTypoGraphy.captionSemiBold(
                                    context,
                                  ).copyWith(fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _scrollToSection(_aboutKey),
                              child: Text(
                                Portfolio.about,
                                style: BringooTypoGraphy.captionSemiBold(
                                  context,
                                ).copyWith(
                                  fontSize: 14,
                                  color: BringooColors.darkBlue,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _scrollToSection(_projectsKey),
                              child: Text(
                                Portfolio.projects,
                                style: BringooTypoGraphy.captionSemiBold(
                                  context,
                                ).copyWith(
                                  fontSize: 14,
                                  color: BringooColors.darkBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                key: _contactKey,
                child: _buildSectionWrapper(
                  isMobile,
                  isMobile
                      ? Column(
                        children: [
                          const SizedBox(height: 20),
                          _buildProfileImage(context),
                          _buildContactInfo(context, isMobile),
                        ],
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildProfileImage(context),
                          _buildContactInfo(context, isMobile),
                        ],
                      ),
                ),
              ),
              SliverToBoxAdapter(
                key: _aboutKey,
                child: _buildSectionWrapper(
                  isMobile,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(context, Portfolio.overviewTitle),
                      _buildParagraph(context, Portfolio.overviewDescription),
                      _buildSectionTitle(context, Portfolio.skillsTitle),
                      _buildSkillWrap(Portfolio.skills),
                      _buildSectionTitle(
                        context,
                        Portfolio.stateManagementTitle,
                      ),
                      _buildSkillWrap(Portfolio.stateManagement),
                      _buildSectionTitle(context, Portfolio.toolsTitle),
                      _buildSkillWrap(Portfolio.tools),
                      _buildSectionTitle(context, Portfolio.languagesTitle),
                      _buildLanguageRow(
                        context,
                        Portfolio.thai,
                        Portfolio.thaiLevel,
                      ),
                      _buildLanguageRow(
                        context,
                        Portfolio.english,
                        Portfolio.englishLevel,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _buildWhiteSectionWrapper(
                  isMobile,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(context, Portfolio.educationTitle),
                      const SizedBox(height: 30),
                      VerticalStepper(
                        items: [
                          VerticalStepperItem(
                            titles: [Portfolio.bachelorTitle],
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  Portfolio.bachelorPlace,
                                  style: BringooTypoGraphy.paragraph02SemiBold(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  Portfolio.bachelorYear,
                                  style: TextStyle(
                                    color: BringooColors.oceanTeal.shade900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          VerticalStepperItem(
                            titles: [Portfolio.highSchoolTitle],
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  Portfolio.highSchoolPlace,
                                  style: BringooTypoGraphy.paragraph02SemiBold(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  Portfolio.highSchoolYear,
                                  style: TextStyle(
                                    color: BringooColors.oceanTeal.shade900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _buildSectionWrapper(
                  isMobile,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(
                        context,
                        Portfolio.workExperienceTitle,
                      ),
                      const SizedBox(height: 30),
                      VerticalStepper(
                        items: [
                          VerticalStepperItem(
                            titles: ['Mobile DEVELOPER'],
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  'Lab hyperlink Co., Ltd., Bangkok',
                                  style: BringooTypoGraphy.paragraph02SemiBold(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),

                                const SizedBox(height: 8),
                                Text(
                                  'Jul 2024-Dec 2024',
                                  style: TextStyle(
                                    color: BringooColors.oceanTeal.shade900,
                                  ),
                                ),
                                _buildResponsibilitiesItem(
                                  "Write clean, maintainable, and efficient code using Flutter framework and Dart language.",
                                ),
                                _buildResponsibilitiesItem(
                                  "Integrate mobile applications with Firebase services and external APIs.",
                                ),
                                _buildResponsibilitiesItem(
                                  "Collaborate with cross-functional teams to bring features and improvements to market.",
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '20Scoops CNX Co., Ltd., Chiang Mai',
                                  style: BringooTypoGraphy.paragraph02SemiBold(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),

                                const SizedBox(height: 8),
                                Text(
                                  'Jun 2022-Dec 2023',
                                  style: TextStyle(
                                    color: BringooColors.oceanTeal.shade900,
                                  ),
                                ),
                                _buildResponsibilitiesItem(
                                  "Collaborate with senior developers to implement features and fix bugs mobile applications for Android and iOS platforms.",
                                ),
                                _buildResponsibilitiesItem(
                                  "Write clean, maintainable, and efficient code using Flutter framework and Dart language.",
                                ),
                                _buildResponsibilitiesItem(
                                  "Conducted code reviews and participated in team meetings to enhance overall project quality.",
                                ),
                                _buildResponsibilitiesItem(
                                  "Integrate mobile applications with back-end services and external APIs.",
                                ),
                                _buildResponsibilitiesItem(
                                  "Collaborate with cross-functional teams, including designers and product managers, to bring features and improvements to market.",
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'DoDee Digital Group  Co., Ltd., Chiang Mai ',
                                  style: BringooTypoGraphy.paragraph02SemiBold(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Sep 2021-Feb 2022',
                                  style: TextStyle(
                                    color: BringooColors.oceanTeal.shade900,
                                  ),
                                ),
                                _buildResponsibilitiesItem(
                                  "Collaborated with the development team to implemented features and fix bugs mobile applications for Android and iOS platforms.",
                                ),
                                _buildResponsibilitiesItem(
                                  "Integrate mobile applications with back-end services and external APIs.",
                                ),
                              ],
                            ),
                          ),
                          VerticalStepperItem(
                            titles: ['Backend DEVELOPER'],
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  'SAIJAI SOFT Co., Ltd., Chiang Mai',
                                  style: BringooTypoGraphy.paragraph02SemiBold(
                                    context,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),

                                const SizedBox(height: 8),
                                Text(
                                  'Mar 2022-May 2022',
                                  style: TextStyle(
                                    color: BringooColors.oceanTeal.shade900,
                                  ),
                                ),
                                _buildResponsibilitiesItem(
                                  'Collaborate with senior developers to developed a backend system for CRM platform using Node.js and Express.js.',
                                ),
                                _buildResponsibilitiesItem(
                                  "Implemented RESTful APIs for user authentication, product listing, and order processing.",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                key: _projectsKey,
                child: _buildWhiteSectionWrapper(
                  isMobile,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(context, Portfolio.myProjectsTitle),
                      const SizedBox(height: 10),
                      GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Portfolio.listProjects.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 300,
                          crossAxisCount: isMobile ? 1 : 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: isMobile ? 20 : 8,
                          childAspectRatio: isMobile ? 1.5 : 1,
                        ),
                        itemBuilder:
                            (context, index) => AnimatedScale(
                              scale: 1,
                              duration: Duration(milliseconds: 300),
                              child: _buildProjectCard(
                                Portfolio.listProjects[index],
                                isMobile,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Row _buildResponsibilitiesItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• ', style: const TextStyle(fontSize: 16)),
        Flexible(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }

  Widget _buildSectionWrapper(bool isMobile, Widget child) => Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 1100),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      alignment: Alignment.topLeft,
      child: child,
    ),
  );
  Widget _buildWhiteSectionWrapper(bool isMobile, Widget child) => Container(
    width: double.infinity,
    color: Colors.white,
    child: Center(
      child: Container(
        color: Colors.white,
        constraints: const BoxConstraints(maxWidth: 1100),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        alignment: Alignment.topLeft,
        child: child,
      ),
    ),
  );

  Widget _buildSectionTitle(BuildContext context, String title) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Text(
      title,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    ),
  );

  Widget _buildParagraph(BuildContext context, String text) => Text(
    text,
    style: BringooTypoGraphy.paragraph03Regular(context),
    textAlign: TextAlign.start,
  );

  Widget _buildSkillWrap(List<SkillModel> skills) => Wrap(
    spacing: 10,
    runSpacing: 10,
    children:
        skills.map((skill) => _buildSkillChip(skill.name, skill.icon)).toList(),
  );

  Widget _buildLanguageRow(
    BuildContext context,
    String language,
    String level,
  ) => Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        Text(language, style: BringooTypoGraphy.paragraph03SemiBold(context)),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: BringooColors.oceanTeal,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            level,
            style: BringooTypoGraphy.captionLight(
              context,
            ).copyWith(color: Colors.white),
          ),
        ),
      ],
    ),
  );

  Widget _buildSkillChip(String skill, String icon) => Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: BringooColors.oceanTeal,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.7),
          offset: const Offset(-5, -5),
          blurRadius: 10,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.6),
          offset: const Offset(5, 3),
          blurRadius: 5,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon.isEmpty ? Container() : SvgPicture.asset(icon, width: 20),
        const SizedBox(width: 5),
        Text(
          skill,
          style: BringooTypoGraphy.paragraph01Regular(
            context,
          ).copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );

  Widget _buildProjectCard(Project project, bool isMobile) => Card(
    elevation: 5,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => _showProjectDialog(project),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Container(
              color: project.backgroundColor,
              child: Image.asset(
                height: 180,
                project.imageUrl,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.projectName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    project.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  void _showProjectDialog(Project project) {
    final audioService = AudioService();

    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 1000;

            return Dialog(
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.9,
                    maxWidth:
                        isMobile
                            ? MediaQuery.of(context).size.width * 0.9
                            : MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            project.projectName,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: BringooColors.oceanTeal.shade900,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Divider(thickness: 1, color: BringooColors.oceanTeal),
                      Expanded(
                        child: SingleChildScrollView(
                          child:
                              isMobile
                                  ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      ProjectDetailWidget(project: project),
                                      const SizedBox(height: 20),
                                      _buildLivePreview(
                                        context,
                                        audioService,
                                        project,
                                      ),
                                    ],
                                  )
                                  : IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: ProjectDetailWidget(
                                            project: project,
                                          ),
                                        ),
                                        VerticalDividerWidget(),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: _buildLivePreview(
                                              context,
                                              audioService,
                                              project,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ).then((_) async => await audioService.disposePlayer());
  }

  Widget _buildLivePreview(
    BuildContext context,
    AudioService audioService,
    Project project,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Portfolio.livePreview,
          style: BringooTypoGraphy.paragraph01SemiBold(
            context,
          ).copyWith(fontWeight: FontWeight.w900, fontSize: 20),
        ),
        const SizedBox(height: 10),
        DeviceFrame(
          theme: project.themeData,
          child: Navigator(
            onGenerateRoute:
                (_) => MaterialPageRoute(
                  builder: (_) => project.projectWidget(audioService),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) => Container(
    padding: const EdgeInsets.all(30),
    child: Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF6CBBB5),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.7),
            offset: const Offset(-5, -5),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.6),
            offset: const Offset(5, 5),
            blurRadius: 10,
          ),
        ],
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: const CircleAvatar(
        radius: 80,
        backgroundImage: AssetImage("assets/images/image.png"),
      ),
    ),
  );

  Widget _buildContactInfo(BuildContext context, bool isMobile) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Portfolio.name.toUpperCase(),
          style: GoogleFonts.nunito(
            color: Colors.black,
            fontSize: 38,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          Portfolio.position,
          style: BringooTypoGraphy.headline01Bold(context).copyWith(
            color: BringooColors.darkBlue,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 30),
        _buildContactItem(Icons.email, Portfolio.email),
        _buildContactItem(Icons.phone, Portfolio.phone),
        _buildContactItem(Icons.pin_drop, Portfolio.location),
      ],
    ),
  );

  Widget _buildContactItem(IconData icon, String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: BringooColors.oceanTeal,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.7),
                offset: const Offset(-5, -5),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.6),
                offset: const Offset(5, 3),
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(child: Icon(icon, size: 26, color: Colors.white)),
        ),
        const SizedBox(width: 15),
        Text(
          text,
          style: BringooTypoGraphy.paragraph01SemiBold(
            context,
          ).copyWith(fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ],
    ),
  );
}
