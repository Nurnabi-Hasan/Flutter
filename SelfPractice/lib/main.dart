import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main (){
  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      theme: ThemeData(primarySwatch: Colors.grey),
      darkTheme: ThemeData(primarySwatch: Colors.red),

    );
  }
}

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("My App",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        backgroundColor: Colors.teal,
        actions:[

          TextButton(onPressed:(){}, child: Text("Skip",
            style: TextStyle(color: Colors.white70),))
        ],
      ),

      body:Container(
        padding:EdgeInsets.all(20) ,
            child: Column(

      ),
      )




      );
  }



}