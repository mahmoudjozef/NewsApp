import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/Categers.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  var categers = Categers.getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), centerTitle: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(
                "Good Morning\nHere is Some News For You.",
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),

              ListView.separated(
                //ياخد عدد ال items
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: index.isOdd
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                    children: [
                      //images
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(24),
                        child: Image.asset(categers[index].images),
                      ),
                      Column(
                        children: [
                          //title
                          Text(
                            categers[index].description,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 50),
                          //view all
                          Container(
                            margin: EdgeInsets.only(
                              right: 10,
                              bottom: 15,
                              left: 10,
                            ),
                            padding: EdgeInsets.only(
                              left: index.isEven ? 10 : 0,
                              right: index.isOdd ? 10 : 0,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //arrow
                                Visibility(
                                  visible: index.isOdd,
                                  child: Image.asset(
                                    'assets/images/arrow L.png',
                                  ),
                                ),
                                //
                                Text(
                                  'View All',
                                  style: GoogleFonts.inter(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                //arrow
                                Visibility(
                                  visible: index.isEven,
                                  child: Image.asset(
                                    'assets/images/arrow R.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemCount: categers.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
