import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/api_maneger.dart';
import 'package:news_app/screens/First_Screen.dart';
import 'package:news_app/screens/NewsScreen.dart';
import 'package:news_app/screens/SoursesView.dart';

class home_screen extends StatefulWidget {
  home_screen({super.key});

  static const String routeNamed = '/';

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FirstScreen());
  }
}
