import 'package:injectable/injectable.dart';
import 'package:news_app/Repostiry/Local/Home_Local_Repo.dart';
import 'package:news_app/core/CashHelper.dart';
import 'package:news_app/model/NewsData.dart';
import 'package:news_app/model/sourseResponse.dart';

@Injectable(as: HomeLocalRepo)
class HomeLocalImpl implements HomeLocalRepo {
  @override
  Future<List<Articles>> GetNews(String sourseId) async {
    var data = await CashHelper.getNews();
    return data?.articles ?? [];
  }

  @override
  Future<List<Sources>> GetSourse(String categoryId) async {
    var data = await CashHelper.getSourse();
    return data?.sources ?? [];
  }
}
