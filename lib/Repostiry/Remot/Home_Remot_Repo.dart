//Functions
//Remote=> Data  هتيجي من بره عن بعد
import 'package:injectable/injectable.dart';
import 'package:news_app/model/NewsData.dart';
import 'package:news_app/model/sourseResponse.dart';

abstract class HomeRemoteRepo {
  Future<List<Sources>> GetSourse(String categoryId);

  Future<List<Articles>> GetNews(String sourseId);
}
