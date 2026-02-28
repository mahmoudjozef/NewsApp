import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:google_fonts/google_fonts.dart';

import '../../theming/Ligth.dart';
import '../../theming/bloc/cubit.dart' show ThemeCubit;

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key, required this.OnDrawerCliked});

  Function OnDrawerCliked;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ThemeCubit>(context);
    return Container(
      width: MediaQuery.of(context).size.width * .70,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.white,
            child: Center(
              child: Text(
                'News',
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
          SizedBox(height: 20),
          //home
          InkWell(
            onTap: () {
              Navigator.pop(context);
              OnDrawerCliked();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Image.asset('assets/icons/Home.png', fit: BoxFit.cover),
                  SizedBox(width: 10),
                  Text(
                    'Go To Home',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: Colors.white, indent: 12, thickness: 1, endIndent: 12),
          //theme
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/roller-paint-brush.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Text(
                  'Theming',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Switch(
                  value: bloc.baseColor is LigthMode,
                  onChanged: (value) {
                    bloc.chnageTheme();
                  },
                ),
              ],
            ),
          ),
          Divider(color: Colors.white, indent: 12, thickness: 1, endIndent: 12),
          //language
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Image.asset('assets/icons/globe-alt.png', fit: BoxFit.cover),
                SizedBox(width: 10),
                Text(
                  'Language',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
