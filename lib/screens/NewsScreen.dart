import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/api_maneger.dart';
import 'package:news_app/model/NewsData.dart';

class NewsScreen extends StatelessWidget {
  String sourceId;

  NewsScreen({required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiManager.getNewsData(sourceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          } else {
            var articles = snapshot.data?.articles ?? [];
            if (articles.isEmpty) {
              return Center(child: Text('No Data'));
            }
            return ListView.builder(
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
                          articles[index].urlToImage ?? '',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),

                      //title
                      Text(
                        articles[index].title ?? '',
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
                            "By ${articles[index].author?.split(" ").first}",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffA0A0A0),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${articles[index].publishedAt?.substring(0, 10)}",
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
              itemCount: articles.length,
            );
          }
        },
      ),
    );
  }
}
