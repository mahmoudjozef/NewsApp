import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';
import 'NewsScreen.dart';

class Soursesview extends StatelessWidget {
  final String categoryId;

  Soursesview({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()..GetSourse(categoryId),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var data = BlocProvider.of<HomeCubit>(context);
            return DefaultTabController(
              initialIndex: data.selectedIndex,
              length: data.sourses.length,
              child: Scaffold(
                body: Column(
                  children: [
                    TabBar(
                      onTap: (value) {
                        data.ChangeSelected(value);
                      },
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      labelColor: Colors.black,
                      indicatorColor: Colors.black,
                      tabs: data.sourses
                          .map((e) => Tab(child: Text(e.name ?? "")))
                          .toList(),
                    ),
                    Expanded(
                      child: data.articles.isEmpty
                          ? Center(child: (Text('No Data')))
                          : Newsscreen(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
