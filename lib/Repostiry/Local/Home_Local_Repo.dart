//Functions
//Local=> in your dives
import '../../model/NewsData.dart';
import '../../model/sourseResponse.dart';

abstract class HomeLocalRepo {
  Future<List<Sources>> GetSourse(String categoryId);

  Future<List<Articles>> GetNews(String sourseId);
}