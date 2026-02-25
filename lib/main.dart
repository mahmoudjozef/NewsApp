import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/First_Screen.dart';
import 'package:news_app/screens/home_screen.dart';

import 'bloc/Observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      routes: {
              home_screen.routeNamed:(context)=>home_screen(),
      },
    );
  }
}
