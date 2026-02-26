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
    GetNews();
  }

  GetSourse(String categoryId) async {
    emit(GetSoursesLodingState());   // ✅ ضيف دي

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
    emit(GetNewsLodingState());   // ✅ ضيف دي

    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=013fe025a27443788bb8e50dde2465ab&sources=${sourses[selectedIndex].id}",

      );

      NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(
        response.data,
      );

      articles = newsDataResponse.articles ?? [];
      print("News Count: ${articles.length}");
      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsErorrState());
      print('Something went wrong');
    }
  }

// GetNews() async {
//   try {
//     Response response = await dio.get(
//       "https://newsapi.org/v2/everything?q=bitcoin&apiKey=013fe025a27443788bb8e50dde2465ab&sources=${sourses[selectedIndex].id}",
//     );
//     NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(
//       response.data,
//     );
//     articles = newsDataResponse.articles ?? [];
//     emit(GetNewsSuccessState());
//   } catch (e) {
//     emit(GetNewsErorrState());
//     print('Something went wrong');
//   }
// }
}
