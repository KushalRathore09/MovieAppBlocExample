import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/Home.dart';
import 'package:movie_app/screens/detail.dart';
import 'package:movie_app/screens/search.dart';
import 'package:movie_app/screens/splash.dart';
import 'package:movie_app/utils/colors.dart';

import 'bloc/simple_bloc_observer.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(statusBarColor: AppColors.PrimaryColor.withOpacity(1));
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: AppColors.PrimaryColor.withOpacity(1)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie DB',
      theme: ThemeData(
          primarySwatch: MaterialColor(0XFF0EA4A0, AppColors.color),
      ),
      routes: {
        "/home" : (context) => HomeScreen() ,
        "/search" : (context) => SearchScreen(),
        "/detail" : (context) => DetailScreen()
      },
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: SplashScreen(),
    );
  }
}