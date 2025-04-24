// // 📦 Updated: Responsive, Centered Layout, Smooth Scroll, and Animations

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:portfolio/constants/icon_assets.dart';
// import 'package:portfolio/constants/image_assets.dart';
// import 'package:portfolio/portfolio/data/portfolio.dart';
// import 'package:portfolio/portfolio/widgets/device_frame.dart';
// import 'package:portfolio/portfolio/widgets/project_detail_widget.dart';
// import 'package:portfolio/portfolio/widgets/stepper_widget.dart';
// import 'package:portfolio/portfolio/widgets/vertical_divider_widget.dart';
// import 'package:portfolio/projects/top_radio/services/audio_service.dart';
// import 'package:portfolio/projects/top_radio/top_radio_main_page.dart';
// import 'package:portfolio/themes/bringoo_colors.dart';
// import 'package:portfolio/themes/bringoo_typography.dart';

// class PortfolioHomePage extends StatefulWidget {
//   const PortfolioHomePage({super.key});

//   @override
//   State<PortfolioHomePage> createState() => _PortfolioHomePageState();
// }

// class _PortfolioHomePageState extends State<PortfolioHomePage> {
//   final ScrollController _scrollController = ScrollController();

//   final GlobalKey _contactKey = GlobalKey();
//   final GlobalKey _aboutKey = GlobalKey();
//   final GlobalKey _projectsKey = GlobalKey();

//   void _scrollToSection(GlobalKey key) {
//     final context = key.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 700),
//         curve: Curves.easeInOutQuart,
//         alignment: 0.1,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0XFFDAE6E8),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           final isMobile = constraints.maxWidth < 800;
//           return CustomScrollView(
//             controller: _scrollController,
//             slivers: [
//               SliverAppBar(
//                 pinned: true,
//                 backgroundColor: Colors.white,
//                 toolbarHeight: 60,
//                 flexibleSpace: FlexibleSpaceBar(
//                   titlePadding: const EdgeInsets.symmetric(horizontal: 20),
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         Portfolio.name,
//                         style: BringooTypoGraphy.captionSemiBold(
//                           context,
//                         ).copyWith(fontSize: 16, color: BringooColors.darkBlue),
//                       ),
//                       Row(
//                         children: [
//                           TextButton(
//                             onPressed: () => _scrollToSection(_contactKey),
//                             child: Text(Portfolio.contact),
//                           ),
//                           TextButton(
//                             onPressed: () => _scrollToSection(_aboutKey),
//                             child: Text(Portfolio.about),
//                           ),
//                           TextButton(
//                             onPressed: () => _scrollToSection(_projectsKey),
//                             child: Text(Portfolio.projects),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 key: _contactKey,
//                 child: _buildSectionWrapper(
//                   isMobile,
//                   Column(
//                     children: [
//                       const SizedBox(height: 20),
//                       _buildProfileImage(context),
//                       _buildContactInfo(context, isMobile),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 key: _aboutKey,
//                 child: _buildSectionWrapper(
//                   isMobile,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildSectionTitle(context, Portfolio.overviewTitle),
//                       _buildParagraph(context, Portfolio.overviewDescription),
//                       _buildSectionTitle(context, Portfolio.skillsTitle),
//                       _buildSkillWrap(Portfolio.skills),
//                       _buildSectionTitle(
//                         context,
//                         Portfolio.stateManagementTitle,
//                       ),
//                       _buildSkillWrap(Portfolio.stateManagement),
//                       _buildSectionTitle(context, Portfolio.toolsTitle),
//                       _buildSkillWrap(Portfolio.tools),
//                       _buildSectionTitle(context, Portfolio.languagesTitle),
//                       _buildLanguageRow(
//                         context,
//                         Portfolio.thai,
//                         Portfolio.thaiLevel,
//                       ),
//                       _buildLanguageRow(
//                         context,
//                         Portfolio.english,
//                         Portfolio.englishLevel,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: _buildWhiteSectionWrapper(
//                   isMobile,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildSectionTitle(context, Portfolio.educationTitle),
//                       const SizedBox(height: 30),
//                       VerticalStepper(
//                         items: [
//                           VerticalStepperItem(
//                             titles: [Portfolio.bachelorTitle],
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   Portfolio.bachelorPlace,
//                                   style: BringooTypoGraphy.paragraph02SemiBold(
//                                     context,
//                                   ).copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   Portfolio.bachelorYear,
//                                   style: TextStyle(
//                                     color: BringooColors.oceanTeal.shade900,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           VerticalStepperItem(
//                             titles: [Portfolio.highSchoolTitle],
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   Portfolio.highSchoolPlace,
//                                   style: BringooTypoGraphy.paragraph02SemiBold(
//                                     context,
//                                   ).copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   Portfolio.highSchoolYear,
//                                   style: TextStyle(
//                                     color: BringooColors.oceanTeal.shade900,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: _buildSectionWrapper(
//                   isMobile,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildSectionTitle(
//                         context,
//                         Portfolio.workExperienceTitle,
//                       ),
//                       const SizedBox(height: 30),
//                       VerticalStepper(
//                         items: [
//                           VerticalStepperItem(
//                             titles: ['Mobile DEVELOPER'],
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   'Lab hyperlink Co., Ltd., Bangkok',
//                                   style: BringooTypoGraphy.paragraph02SemiBold(
//                                     context,
//                                   ).copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   'Jul 2024-Dec 2024',
//                                   style: TextStyle(
//                                     color: BringooColors.oceanTeal.shade900,
//                                   ),
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Write clean, maintainable, and efficient code using Flutter framework and Dart language.",
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Integrate mobile applications with Firebase services and external APIs.",
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Collaborate with cross-functional teams to bring features and improvements to market.",
//                                 ),
//                               ],
//                             ),
//                           ),
//                           VerticalStepperItem(
//                             titles: ['Mobile DEVELOPER'],
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   '20Scoops CNX Co., Ltd., Chiang Mai',
//                                   style: BringooTypoGraphy.paragraph02SemiBold(
//                                     context,
//                                   ).copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   'Jun 2022-Dec 2023',
//                                   style: TextStyle(
//                                     color: BringooColors.oceanTeal.shade900,
//                                   ),
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Collaborate with senior developers to implement features and fix bugs mobile applications for Android and iOS platforms.",
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Write clean, maintainable, and efficient code using Flutter framework and Dart language.",
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Conducted code reviews and participated in team meetings to enhance overall project quality.",
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Integrate mobile applications with back-end services and external APIs.",
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Collaborate with cross-functional teams, including designers and product managers, to bring features and improvements to market.",
//                                 ),
//                               ],
//                             ),
//                           ),
//                           VerticalStepperItem(
//                             titles: ['Mobile DEVELOPER'],
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   'DoDee Digital Group  Co., Ltd., Chiang Mai',
//                                   style: BringooTypoGraphy.paragraph02SemiBold(
//                                     context,
//                                   ).copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   'Sep 2021-Feb 2022',
//                                   style: TextStyle(
//                                     color: BringooColors.oceanTeal.shade900,
//                                   ),
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Collaborated with the development team to implemented features and fix bugs mobile applications for Android and iOS platforms.",
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Integrate mobile applications with back-end services and external APIs.",
//                                 ),
//                               ],
//                             ),
//                           ),
//                           VerticalStepperItem(
//                             titles: ['Backend DEVELOPER'],
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   'SAIJAI SOFT Co., Ltd., Chiang Mai',
//                                   style: BringooTypoGraphy.paragraph02SemiBold(
//                                     context,
//                                   ).copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   'Sep 2021-Feb 2022',
//                                   style: TextStyle(
//                                     color: BringooColors.oceanTeal.shade900,
//                                   ),
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Collaborate with senior developers to developed a backend system for CRM platform using Node.js and Express.js.",
//                                 ),
//                                 _buildResponsibilitiesItem(
//                                   "Implemented RESTful APIs for user authentication, product listing, and order processing.",
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                         items: [
//                           VerticalStepperItem(
//                             titles: ['Mobile DEVELOPER'],
//                             subtitle: Text(
//                               'Lab hyperlink Co., Ltd., BangkokJul 2024 - Dec 2024',
//                             ),
//                           ),
//                           VerticalStepperItem(
//                             titles: ['Backend DEVELOPER'],
//                             subtitle: Text(
//                               'SAIJAI SOFT Co., Ltd., Chiang MaiSep 2021 - Feb 2022',
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 key: _projectsKey,
//                 child: _buildWhiteSectionWrapper(
//                   isMobile,
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildSectionTitle(context, Portfolio.myProjectsTitle),
//                       const SizedBox(height: 10),
//                       GridView.builder(
//                         padding: EdgeInsets.zero,
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: Portfolio.listProjects.length,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: isMobile ? 1 : 2,
//                           crossAxisSpacing: 20,
//                           mainAxisSpacing: 20,
//                           childAspectRatio: 1.2,
//                         ),
//                         itemBuilder:
//                             (context, index) => AnimatedScale(
//                               scale: 1,
//                               duration: const Duration(milliseconds: 300),
//                               child: _buildProjectCard(
//                                 Portfolio.listProjects[index],
//                               ),
//                             ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildSectionWrapper(bool isMobile, Widget child) => Center(
//     child: Container(
//       constraints: const BoxConstraints(maxWidth: 1100),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//       alignment: Alignment.topLeft,
//       child: child,
//     ),
//   );
//   Widget _buildWhiteSectionWrapper(bool isMobile, Widget child) => Container(
//     width: double.infinity,
//     color: Colors.white,
//     child: Center(
//       child: Container(
//         color: Colors.white,
//         constraints: const BoxConstraints(maxWidth: 1100),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//         alignment: Alignment.topLeft,
//         child: child,
//       ),
//     ),
//   );

//   Widget _buildSectionTitle(BuildContext context, String title) => Padding(
//     padding: const EdgeInsets.symmetric(vertical: 20.0),
//     child: Text(
//       title,
//       style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//     ),
//   );

//   Widget _buildParagraph(BuildContext context, String text) => Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//     child: Text(
//       text,
//       style: BringooTypoGraphy.paragraph03Regular(context),
//       textAlign: TextAlign.start,
//     ),
//   );

//   Widget _buildSkillWrap(List<SkillModel> skills) => Wrap(
//     spacing: 10,
//     runSpacing: 10,
//     children:
//         skills.map((skill) => _buildSkillChip(skill.name, skill.icon)).toList(),
//   );

//   Widget _buildLanguageRow(
//     BuildContext context,
//     String language,
//     String level,
//   ) => Padding(
//     padding: const EdgeInsets.only(bottom: 8.0),
//     child: Row(
//       children: [
//         Text(language, style: BringooTypoGraphy.paragraph03SemiBold(context)),
//         const SizedBox(width: 10),
//         Container(
//           decoration: BoxDecoration(
//             color: BringooColors.oceanTeal,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           child: Text(
//             level,
//             style: BringooTypoGraphy.captionLight(
//               context,
//             ).copyWith(color: Colors.white),
//           ),
//         ),
//       ],
//     ),
//   );

//   Widget _buildSkillChip(String skill, String icon) => Container(
//     padding: const EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       color: BringooColors.oceanTeal,
//       borderRadius: BorderRadius.circular(16),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.white.withOpacity(0.7),
//           offset: const Offset(-5, -5),
//           blurRadius: 10,
//           spreadRadius: 1,
//         ),
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.6),
//           offset: const Offset(5, 3),
//           blurRadius: 5,
//           spreadRadius: 1,
//         ),
//       ],
//     ),
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         icon.isEmpty ? Container() : SvgPicture.asset(icon, width: 20),
//         const SizedBox(width: 5),
//         Text(
//           skill,
//           style: BringooTypoGraphy.paragraph01Regular(
//             context,
//           ).copyWith(color: Colors.white),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     ),
//   );

//   Widget _buildProjectCard(Project project) => Card(
//     elevation: 5,
//     color: Colors.white,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//     child: InkWell(
//       borderRadius: BorderRadius.circular(15),
//       onTap: () => _showProjectDialog(project),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
//             child: Container(
//               color: project.backgroundColor,
//               child: Image.asset(
//                 height: 180,
//                 project.imageUrl,
//                 width: double.infinity,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           Container(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     project.projectName,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     project.description,
//                     style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );

//   void _showProjectDialog(Project project) {
//     final audioService = AudioService();
//     showDialog(
//       context: context,
//       useRootNavigator: true,
//       builder: (context) {
//         return Dialog(
//           backgroundColor: Colors.white,
//           insetPadding: const EdgeInsets.all(20),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 maxHeight: MediaQuery.of(context).size.height * 0.9,
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Text(
//                         project.projectName,
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w900,
//                           color: BringooColors.oceanTeal.shade900,
//                         ),
//                       ),
//                       const Spacer(),
//                       IconButton(
//                         icon: const Icon(Icons.close),
//                         onPressed: () => Navigator.of(context).pop(),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Divider(thickness: 1, color: BringooColors.oceanTeal),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: IntrinsicHeight(
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             Expanded(
//                               child: ProjectDetailWidget(project: project),
//                             ),
//                             VerticalDividerWidget(),
//                             Container(
//                               padding: const EdgeInsets.all(16),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     Portfolio.livePreview,
//                                     style:
//                                         BringooTypoGraphy.paragraph01SemiBold(
//                                           context,
//                                         ).copyWith(
//                                           fontWeight: FontWeight.w900,
//                                           fontSize: 20,
//                                         ),
//                                   ),
//                                   const SizedBox(height: 10),
//                                   DeviceFrame(
//                                     theme: ThemeData(
//                                       colorScheme: ColorScheme.fromSeed(
//                                         seedColor: Colors.deepPurple,
//                                       ),
//                                       useMaterial3: true,
//                                     ),
//                                     child: Navigator(
//                                       onGenerateRoute:
//                                           (_) => MaterialPageRoute(
//                                             builder:
//                                                 (_) => TopRadioMainPage(
//                                                   key: UniqueKey(),
//                                                   audioService: audioService,
//                                                 ),
//                                           ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     ).then((_) async => await audioService.disposePlayer());
//   }

//   Widget _buildProfileImage(BuildContext context) => Container(
//     padding: const EdgeInsets.all(30),
//     child: Container(
//       width: 220,
//       height: 220,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: const Color(0xFF6CBBB5),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white.withOpacity(0.7),
//             offset: const Offset(-5, -5),
//             blurRadius: 10,
//           ),
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.6),
//             offset: const Offset(5, 5),
//             blurRadius: 10,
//           ),
//         ],
//         border: Border.all(color: Colors.white, width: 4),
//       ),
//       child: const CircleAvatar(
//         radius: 80,
//         backgroundImage: AssetImage("assets/images/image.png"),
//       ),
//     ),
//   );

//   Widget _buildContactInfo(BuildContext context, bool isMobile) => Container(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: Column(
//       crossAxisAlignment:
//           isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           Portfolio.name.toUpperCase(),
//           style: GoogleFonts.nunito(
//             color: Colors.black,
//             fontSize: 38,
//             fontWeight: FontWeight.w900,
//           ),
//         ),
//         Text(
//           Portfolio.position,
//           style: BringooTypoGraphy.headline01Bold(context).copyWith(
//             color: BringooColors.darkBlue,
//             fontSize: 30,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//         const SizedBox(height: 30),
//         _buildContactItem(Icons.email, Portfolio.email),
//         _buildContactItem(Icons.phone, Portfolio.phone),
//         _buildContactItem(Icons.pin_drop, Portfolio.location),
//       ],
//     ),
//   );

//   Widget _buildContactItem(IconData icon, String text) => Padding(
//     padding: const EdgeInsets.symmetric(vertical: 10),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(6),
//           decoration: BoxDecoration(
//             color: BringooColors.oceanTeal,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.white.withOpacity(0.7),
//                 offset: const Offset(-5, -5),
//                 blurRadius: 10,
//               ),
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.6),
//                 offset: const Offset(5, 3),
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           child: Center(child: Icon(icon, size: 26, color: Colors.white)),
//         ),
//         const SizedBox(width: 15),
//         Text(
//           text,
//           style: BringooTypoGraphy.paragraph01SemiBold(
//             context,
//           ).copyWith(fontSize: 18, fontWeight: FontWeight.w800),
//         ),
//       ],
//     ),
//   );
// }
