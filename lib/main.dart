import 'package:doctors/view/screens/dashboard_screen.dart';
import 'package:doctors/view/screens/home_screens/home_screen.dart';
import 'package:doctors/view/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'consts/colors.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs =await SharedPreferences.getInstance();
  final showHome = prefs.getBool("onBoarding")??false;
  runApp( MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({super.key, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors().mainColor,
        brightness: Brightness.dark,
        canvasColor:MyColors().canvasColor
      ),
      home: showHome == true ? const DashboardScreen() : const OnBoardingScreen(),
    );
  }
}
