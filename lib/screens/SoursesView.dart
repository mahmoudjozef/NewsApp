import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/api_maneger.dart';

import 'NewsScreen.dart';

class Soursesview extends StatefulWidget {
  Soursesview({super.key});

  @override
  State<Soursesview> createState() => _SoursesviewState();
}

class _SoursesviewState extends State<Soursesview> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiManager.getSourses(),
      builder: (context, snapshot) {
        //handeling data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        } else {
          var dataList = snapshot.data?.sources ?? [];
          return
            DefaultTabController(
            initialIndex: selectedIndex,
            length: dataList.length,
            child: Column(
              children: [
                //tabBar
                TabBar(
                  onTap: (value) {
                    selectedIndex = value;
                    setState(() {});
                  },
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.black,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: dataList
                      .map((e) => Tab(child: Text(e.name ?? "")))
                      .toList(),
                ),
                //body
                Expanded(
                  child: NewsScreen(sourceId: dataList[selectedIndex].id ?? ""),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
