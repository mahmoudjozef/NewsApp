import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/First_Screen.dart';
import 'package:news_app/screens/SoursesView.dart';

import '../model/Categers.dart';
import 'Widget/Drawer.dart';

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
    return Scaffold(
      drawer: AppDrawer(OnDrawerCliked: onDrawerCliked),
      appBar: AppBar(centerTitle: true, title: Text('Home')),
      body: selectedCategers != null
          ? Soursesview(categoryId: selectedCategers!.id)
          : FirstScreen(OnCliked: OnCliked),
    );
  }

  Categers? selectedCategers;

  onDrawerCliked() {
    selectedCategers = null;
    setState(() {});
  }

  OnCliked(Categers categers) {
    selectedCategers = categers;
    setState(() {});
  }
}
