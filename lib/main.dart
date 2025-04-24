import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/portfolio/portfolio_page.dart';
import 'package:portfolio/themes/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          title: 'Flutter Demo',
          theme: BringooTheme.mainTheme,
          // darkTheme: ThemeData.dark(),
          home: const PortfolioHomePage(),
        );
      },
    );
  }
}
