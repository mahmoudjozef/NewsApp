import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/api_maneger.dart';
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
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is GetNewsLodingState || state is GetSoursesLodingState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(child: CircularProgressIndicator()),
                  backgroundColor: Colors.transparent,
                ),
              );
            }
          },
          builder: (context, state) {
            var Bloc = BlocProvider.of<HomeCubit>(context);
            return DefaultTabController(
              length: Bloc.sourses.length,
              initialIndex: Bloc.selectedIndex,
              child: Column(
                children: [
                  //tabBar
                  TabBar(
                    onTap: (value) {
                      Bloc.ChangeSelected(value);
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
                    tabs: Bloc.sourses
                        .map((e) => Tab(child: Text(e.name ?? "")))
                        .toList(),
                  ),
                  //body
                  Expanded(child: NewsScreen()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
