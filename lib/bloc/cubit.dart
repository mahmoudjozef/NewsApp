import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/model/NewsData.dart';

import '../model/sourseResponse.dart';

class HomeCubit extends Cubit<HomeState> {
  List<Sources> sourses = [];
  List<Articles> articles = [];

  int selectedIndex = 0;

  HomeCubit() : super(HomeInitState());
  Dio dio = Dio();

  ChangeSelected(int index) {
    selectedIndex = index;
    emit(ChangeSelectedSourse());
  }


  GetSourse(String categoryId) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=013fe025a27443788bb8e50dde2465ab&category=$categoryId',
      );
      SourseResponse sourseResponse = SourseResponse.fromJson(response.data);
      sourses = sourseResponse.sources ?? [];
      emit(GetSoursesSuccessState());
      GetNews();
    } catch (e) {
      emit(GtSoursesErorrState());
      print('Something went wrong');
    }
  }

  GetNews() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=013fe025a27443788bb8e50dde2465ab&sources=${sourses[selectedIndex].id}",
      );
      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(
        response.data,
      );
      articles = newsDataResponse.articles ?? [];
      emit(GetNewsSuccessState());
      GetNews();
    } catch (e) {
      emit(GetNewsErorrState());
      print('Something went wrong');
    }
  }
}
