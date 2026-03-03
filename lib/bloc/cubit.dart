import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Repostiry/Local/Home_Local_Repo.dart';
import 'package:news_app/Repostiry/Remot/Home_Remot_Repo.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/model/NewsData.dart';

import '../model/sourseResponse.dart';
@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeRemoteRepo homeRemoteRepo;
  HomeLocalRepo homeLocalRepo;

  HomeCubit(this.homeRemoteRepo, this.homeLocalRepo) : super(HomeInitState());

  List<Sources> sourses = [];
  List<Articles> articles = [];

  int selectedIndex = 0;

  ChangeSelected(int index) {
    selectedIndex = index;
    emit(ChangeSelectedSourse());
    GetNews();
  }

  GetSourse(String categoryId) async {
    emit(GetSoursesLodingState());

    try {
      sourses = await homeRemoteRepo.GetSourse(categoryId);

      emit(GetSoursesSuccessState());
      GetNews();
    } catch (e) {
      emit(GtSoursesErorrState());
      print('Something went wrong');
    }
  }

  GetNews() async {
    emit(GetNewsLodingState());

    try {
      articles = await homeRemoteRepo.GetNews(sourses[selectedIndex].id ?? '');

      print("News Count: ${articles.length}");
      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsErorrState());
      print('Something went wrong');
    }
  }
}
