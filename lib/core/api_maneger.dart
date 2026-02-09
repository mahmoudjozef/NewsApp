import 'package:dio/dio.dart';
import 'package:news_app/model/NewsData.dart';

import '../model/sourseResponse.dart';

class apiManager {
  static final dio = Dio();

  static Future<SourseResponse?> getSourses() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines/sources?apiKey=013fe025a27443788bb8e50dde2465ab",
      );
      SourseResponse sourseResponse = SourseResponse.fromJson(response.data);
      return sourseResponse;
    } catch (e) {
      print('Something went wrong');
    }
  }

  static Future<NewsDataResponse?> getNewsData(String sourceId) async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=013fe025a27443788bb8e50dde2465ab&sources=$sourceId",
      );
      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(
        response.data,
      );
      return newsDataResponse;
    } catch (e) {
      print('Something went wrong');
    }
  }


}
