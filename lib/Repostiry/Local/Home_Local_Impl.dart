import 'package:injectable/injectable.dart';
import 'package:news_app/Repostiry/Local/Home_Local_Repo.dart';
import 'package:news_app/model/NewsData.dart';
import 'package:news_app/model/sourseResponse.dart';
@Injectable(as: HomeLocalRepo)
class HomeLocalImpl implements HomeLocalRepo{
  @override
  Future<List<Articles>> GetNews(String sourseId) {
    // TODO: implement GetNews
    throw UnimplementedError();
  }

  @override
  Future<List<Sources>> GetSourse(String categoryId) {
    // TODO: implement GetSourse
    throw UnimplementedError();
  }
  

}