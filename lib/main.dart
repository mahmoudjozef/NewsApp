import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/WebViewScreen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/theming/bloc/cubit.dart';
import 'package:news_app/theming/bloc/states.dart';

import 'bloc/Observer.dart';
import 'di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
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
