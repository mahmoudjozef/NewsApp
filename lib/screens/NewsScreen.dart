import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import '../theming/bloc/cubit.dart';
import 'WebViewScreen.dart';
import 'Widget/ShowBootomSheet.dart';

class Newsscreen extends StatelessWidget {
  Newsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = BlocProvider
        .of<HomeCubit>(context)
        .articles;
    var bloc = BlocProvider.of<ThemeCubit>(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) {
                                  return Container(
                                    height:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height * .5,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          child: Image.network(
                                            data[index].urlToImage ?? '',
                                            fit: BoxFit.cover,
                                            height: 200,
                                            width: double.infinity,
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        Text(data[index].description ?? ''),
                                        SizedBox(height: 12),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 50,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                            ),

                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  WebViewScreen.routeName,
                                                  arguments: data[index].url);
                                            },
                                            child: Text(
                                              'View Full Articel.',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Image.network(
                              data[index].urlToImage ?? '',
                              fit: BoxFit.cover,
                              height: 200,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Text(data[index].title ?? ''),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data[index].author
                                ?.split(' ')
                                .first ?? ''),
                            Text(
                              data[index].publishedAt?.substring(0, 10) ?? '',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
