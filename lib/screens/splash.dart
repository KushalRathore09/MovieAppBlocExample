import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState() ;
    startTime() ;
  }

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, _navigationPage);
  }

  void _navigationPage() async {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/movieDb.png',
        ),
      ),
    );
  }
}
