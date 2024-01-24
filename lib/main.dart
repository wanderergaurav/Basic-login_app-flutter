import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/detail_page.dart';
import 'package:my_app/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class DashBoardScreen extends StatelessWidget{
  var nameController_1 = TextEditingController();
  var nameController_2 = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login')),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
        width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle, color: Colors.blue, size: 100,),
                ),
                TextField(
                  controller: nameController_1,
                  decoration: InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                    )
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: nameController_2,
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                    )
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                ElevatedButton(onPressed: () async{

                  //If successfully logged in (credentials are correct)
                  var sharedPref = await SharedPreferences.getInstance();
                  sharedPref.setBool(SplashScreenState.KEYLOGIN, true);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return HomePageScreen();
                      }));
                }, child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}