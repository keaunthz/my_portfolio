import 'package:flutter/material.dart';
import 'package:portfolio/constants/icon_assets.dart';
import 'package:portfolio/projects/bringoo/bringoo_main_page.dart';
import 'package:portfolio/projects/top_radio/services/audio_service.dart';
import 'package:portfolio/projects/top_radio/top_radio_main_page.dart';
import 'package:portfolio/themes/bringoo_colors.dart';
import 'package:portfolio/themes/theme_data.dart';

class Portfolio {
  // Basic Info
  static const String name = 'Tawan Sanitpunth';
  static const String position = 'Mobile Developer';
  static const String email = 'tawan.sanitpunth@gmail.com';
  static const String phone = '+66-85-598-8344';
  static const String location = 'Chiang Mai, Thailand';

  // Menu Titles
  static const String contact = 'Contact';
  static const String about = 'About';
  static const String projects = 'Projects';

  // Section Titles
  static const String overviewTitle = 'Overview';
  static const String skillsTitle = 'Skills';
  static const String stateManagementTitle = 'State Management';
  static const String toolsTitle = 'Tools/Version Control';
  static const String languagesTitle = 'Languages';
  static const String educationTitle = 'Education';
  static const String workExperienceTitle = 'Work Experience';
  static const String myProjectsTitle = 'My Projects';
  static const String livePreview = 'Live Preview (Mock up)';
  static const String technologiesUsed = 'Technologies Used:';
  static const String close = 'Close';

  // Overview Text
  static const String overviewDescription = '''
I'm excited to be part of a dynamic development team. In my last job, I played a key role in a team project, contributing to feature development. I enjoy working in fast-paced environments and adapting to changing needs.
''';

  // Languages
  static const String thai = 'Thai';
  static const String thaiLevel = 'Native';
  static const String english = 'English';
  static const String englishLevel = 'Intermediate';

  // Education
  static const String bachelorTitle = 'BACHELOR OF Business Administration';
  static const String bachelorPlace =
      'Rajamangala university of Technology Lanna Chiang Mai';
  static const String bachelorYear = '2013 – 2018';

  static const String highSchoolTitle = 'HIGH SCHOOL EDUCATION';
  static const String highSchoolPlace =
      'Navamindarajudis Phayap School, Chiang Mai';
  static const String highSchoolYear = '2010 – 2012';

  // Skills
  static List<SkillModel> skills = [
    SkillModel(name: 'Dart (Flutter)', icon: IconAssets.flutterIcon),
    SkillModel(name: 'JavaScript (Basic)', icon: IconAssets.javaScriptIcon),
    SkillModel(name: 'RESTful APIs', icon: IconAssets.apiIcon),
    SkillModel(name: 'Firebase', icon: IconAssets.firebaseIcon),
  ];

  // State Management
  static List<SkillModel> stateManagement = [
    SkillModel(name: 'Provider', icon: ''),
    SkillModel(name: 'Riverpod', icon: ''),
    SkillModel(name: 'GetX', icon: ''),
    SkillModel(name: 'BLoC (Learning)', icon: ''),
  ];

  // Tools
  static List<SkillModel> tools = [
    SkillModel(name: 'Git', icon: IconAssets.gitIcon),
    SkillModel(name: 'Figma', icon: IconAssets.figmaIcon),
    SkillModel(name: 'Slack', icon: IconAssets.slackIcon),
    SkillModel(name: 'Swagger', icon: IconAssets.swaggerIcon),
    SkillModel(name: 'VS Code', icon: IconAssets.vsCodeIcon),
    SkillModel(name: 'Postman', icon: IconAssets.postmanIcon),
  ];

  // Projects
  static List<Project> listProjects = [
    Project(
      backgroundColor: BringooColors.primary.shade100,
      projectName: 'E-Com App',
      title: 'Delivery Staff Management',
      description:
          'A sophisticated Flutter-based mobile application designed for delivery staff in Germany. This app streamlines the process of product picking and delivery, featuring',
      technologies: [
        'Flutter',
        'Google Maps API',
        'Geolocation',
        'Real-time Updates',
      ],
      imageUrl: 'assets/images/main_logo_green.png',
      icon: IconAssets.ecomProjectIcon,
      projectWidget: (audioService) => BringooMainPage(),
      themeData: BringooTheme.mainTheme,
      features: [
        FeaturedProject(
          title: 'Real-time Updates',
          description: 'Monitor orders and delivery status in real-time',
          icon: IconAssets.timeCheckIcon,
        ),
        FeaturedProject(
          title: 'Interactive Map Interface',
          description:
              'View store locations, rider positions, and customer destinations',
          icon: IconAssets.mapIcon,
        ),
        FeaturedProject(
          title: 'Order Picking System',
          description:
              'Efficient system for store staff to manage product picking',
          icon: IconAssets.cartCheckIcon,
        ),
        FeaturedProject(
          title: 'Optimized Routing',
          description: 'Smart delivery route optimization for riders',
          icon: IconAssets.routingIcon,
        ),
      ],
    ),
    Project(
      backgroundColor: Color(0XFFF0D6D5),
      projectName: 'Top Radio App',
      title: 'Live Radio Streaming & Listener Engagement',
      description:
          'A mobile application developed for 93.5 Top Radio FM, a national broadcasting station in Thailand. This app delivers live radio streaming with real-time DJ updates and a listener engagement system, designed to enhance the experience of modern radio audiences.',
      technologies: ['Flutter', 'Firebase Firestore', 'LINE API'],
      imageUrl: 'assets/images/main_logo_radio.png',
      icon: IconAssets.radioProjectIcon,
      projectWidget:
          (audioService) => TopRadioMainPage(audioService: audioService),
      themeData: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      features: [
        FeaturedProject(
          title: 'Live Radio Streaming',
          description:
              'Users can tune in to live radio broadcasts directly from the app',
          icon: IconAssets.headsetIcon,
        ),
        FeaturedProject(
          title: 'LINE Login Integration',
          description:
              'Simple and secure authentication using LINE for easy access',
          icon: IconAssets.lineIcon,
        ),
        FeaturedProject(
          title: 'Real-time DJ Schedule',
          description:
              'Displays the currently active DJ and the on-air time slot in real time',
          icon: IconAssets.timeCheckIcon,
        ),
        FeaturedProject(
          title: 'News & Events Feed',
          description:
              'Stay updated with the latest station announcements, events, and news',
          icon: IconAssets.newsIcon,
        ),
        FeaturedProject(
          title: 'Rewards & Lucky Draw System',
          description:
              'Users can participate in special events and earn rewards or prizes',
          icon: IconAssets.giftIcon,
        ),
      ],
    ),
  ];
}

class Project {
  final Color backgroundColor;
  final String projectName;
  final String title;
  final String description;
  final List<String> technologies;
  final String imageUrl;
  final String icon;
  final List<FeaturedProject> features;
  final Widget Function(AudioService) projectWidget;
  final ThemeData? themeData;

  Project({
    required this.backgroundColor,
    required this.projectName,
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageUrl,
    required this.icon,
    required this.features,
    required this.projectWidget,
    this.themeData,
  });
}

class SkillModel {
  final String name;
  final String icon;

  SkillModel({required this.name, required this.icon});
}

class FeaturedProject {
  final String title;
  final String description;
  final String icon;

  FeaturedProject({
    required this.title,
    required this.description,
    required this.icon,
  });
}
