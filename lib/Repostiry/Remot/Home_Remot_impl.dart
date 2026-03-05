import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Repostiry/Remot/Home_Remot_Repo.dart';
import 'package:news_app/core/CashHelper.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/model/NewsData.dart';
import 'package:news_app/model/sourseResponse.dart';

@Injectable(as: HomeRemoteRepo)
class HomeRemotImpl implements HomeRemoteRepo {
  Dio dio = Dio();
  AppConstants constants;

  HomeRemotImpl(this.constants);

  @override
  Future<List<Articles>> GetNews(String sourseId) async {
    try {
      Response response = await dio.get(
        "${AppConstants.BaseURL}/v2/everything?q=bitcoin&apiKey=${AppConstants.APIKuy}&sources=${sourseId}",
      );

      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(
        response.data,
      );
     await CashHelper.saveNews(newsDataResponse);
      return newsDataResponse.articles ?? [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Sources>> GetSourse(String categoryId) async {
    try {
      Response response = await dio.get(
        '${AppConstants.BaseURL}/v2/top-headlines/sources?apiKey=${AppConstants.APIKuy}&category=$categoryId',
      );
      SourseResponse sourseResponse = SourseResponse.fromJson(response.data);
     await CashHelper.saveSourse(sourseResponse);
      return sourseResponse.sources ?? [];
    } catch (e) {
      rethrow;
    }
  }
}
