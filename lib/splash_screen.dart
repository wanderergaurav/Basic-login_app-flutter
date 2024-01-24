import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/detail_page.dart';
import 'package:my_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  static const String KEYLOGIN = "login";

  @override

  void initState(){
    super.initState();

    whereToGo();
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child:  Center(child: Icon(Icons.account_circle, size: 120, color: Colors.white,))
      ),
    );
  }

  void whereToGo() async {

    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedPref.getBool('KEYLOGIN');

    Timer(Duration(seconds: 2),(){

      if(isLoggedIn != null){
        if(isLoggedIn){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => DashBoardScreen(),));
        } else{
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => DashBoardScreen(),));
        }
      } else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashBoardScreen()));
      }


    });
  }
}