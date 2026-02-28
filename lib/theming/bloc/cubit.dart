import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/theming/BaseColor.dart';
import 'package:news_app/theming/Dark.dart';
import 'package:news_app/theming/Ligth.dart' show LigthMode;
import 'package:news_app/theming/bloc/states.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInit());

BaseColor baseColor = LigthMode();

  chnageTheme() {
emit(ThemeInit());
baseColor = baseColor is LigthMode ? DarkMode() : LigthMode();
    emit(ChangeTheme());
  }
}
