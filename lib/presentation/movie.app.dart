import 'package:flutter/material.dart';
import 'package:movies_app/common/screenutil/screenutil.dart';
import 'package:movies_app/presentation/journeys/home/home.screen.dart';
import 'package:movies_app/presentation/themes/app_color.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

class MovieApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init();

    return MaterialApp(
      // Use MaterialApp widget with debugBanner as false.
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      // Define ThemeData of the app. Make vulcan as primary as well as scaffoldBackground color.
      // All our screens have vulcan as their background color. Also, give the text theme.
      theme: ThemeData(
        primaryColor: AppColor.vulcan,
        scaffoldBackgroundColor: AppColor.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}