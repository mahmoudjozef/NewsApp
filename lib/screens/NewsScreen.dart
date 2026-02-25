import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var Bloc = BlocProvider.of<HomeCubit>(context);
    Bloc.GetNews();
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            //body
            child: Column(
              children: [
                //image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),

                  child: Image.network(
                    Bloc.articles[index].urlToImage ?? '',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),

                //title
                Text(
                  Bloc.articles[index].title ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //author and date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "By ${Bloc.articles[index].author?.split(" ").first}",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffA0A0A0),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${Bloc.articles[index].publishedAt?.substring(0, 10)}",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffA0A0A0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: Bloc.articles.length,
      ),
    );
  }
}
