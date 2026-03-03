import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Repostiry/Remot/Home_Remot_Repo.dart';
import 'package:news_app/model/NewsData.dart';
import 'package:news_app/model/sourseResponse.dart';
@Injectable(as: HomeRemoteRepo)
class HomeRemotImpl implements HomeRemoteRepo {
  Dio dio = Dio();

  @override
  Future<List<Articles>> GetNews(String sourseId) async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=013fe025a27443788bb8e50dde2465ab&sources=${sourseId}",
      );

      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(
        response.data,
      );
      return newsDataResponse.articles??[];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Sources>> GetSourse(String categoryId) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=013fe025a27443788bb8e50dde2465ab&category=$categoryId',
      );
      SourseResponse sourseResponse = SourseResponse.fromJson(response.data);
      return sourseResponse.sources??[];
    } catch (e) {
      rethrow;
    }
  }
}
