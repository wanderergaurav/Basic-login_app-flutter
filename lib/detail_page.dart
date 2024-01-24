import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      body: Container(
        color: Colors.blue.shade100,
        child: Center(child: Icon(Icons.home, color: Colors.white.withOpacity(0.5), size: 100,)),
      )
    );
  }
}