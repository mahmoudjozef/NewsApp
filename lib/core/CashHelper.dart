import 'package:hive/hive.dart';
import 'package:news_app/model/NewsData.dart';
import 'package:news_app/model/sourseResponse.dart';

class CashHelper {
  static const String _sourseNamed = 'sourse';
  static const String _NewsNamed = 'News';

  //SourseBox
  static Future<Box<SourseResponse>> _openSourseBox() async {
    if (Hive.isBoxOpen(_sourseNamed)) {
      return Hive.box<SourseResponse>(_sourseNamed);
    } else {
      return Hive.openBox<SourseResponse>(_sourseNamed);
    }
  }

  static Future<void> saveSourse(SourseResponse sourse) async {
    final box = await _openSourseBox();
    await box.put('sourse', sourse);
  }

  static Future<SourseResponse?> getSourse() async {
    final box = await _openSourseBox();
    return box.get('sourse');
  }

  static Future<void> deleteSourse() async {
    final box = await _openSourseBox();
    box.delete('sourse');
  }

  //NewsBox
  static Future<Box<NewsDataResponse>> _openNewsBox() async {
    if (Hive.isBoxOpen(_NewsNamed)) {
      return Hive.box<NewsDataResponse>(_NewsNamed);
    } else {
      return Hive.openBox<NewsDataResponse>(_NewsNamed);
    }
  }

  static Future<void> saveNews(NewsDataResponse news) async {
    final box = await _openNewsBox();
    box.put('news', news);
  }

  static Future<NewsDataResponse?> getNews() async {
    final box = await _openNewsBox();
    return box.get('news');
  }

  static Future<void> deleteNews() async {
    final box = await _openNewsBox();
    box.delete('news');
  }
}
