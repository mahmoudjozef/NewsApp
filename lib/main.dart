import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/screens/WebViewScreen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/theming/bloc/cubit.dart';
import 'package:news_app/theming/bloc/states.dart';

import 'bloc/Observer.dart';
import 'core/internet_checker.dart';
import 'di.dart';
import 'model/News_adpater.dart';
import 'model/sourse_adpater.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InternetConnectivity().initialize();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
   Hive.initFlutter();
Hive.registerAdapter(SourseResponseAdapter());// typeId: 0
Hive.registerAdapter(SourcesAdapter());// typeId: 1
Hive.registerAdapter(NewsDataResponseAdapter());// typeId: 2
Hive.registerAdapter(ArticlesAdapter());// typeId: 3
Hive.registerAdapter(SourceAdapter());// typeId: 4

  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          return MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        home_screen.routeNamed: (context) => home_screen(),
        WebViewScreen.routeName: (context) => WebViewScreen(),
      },
    );
  }
}
