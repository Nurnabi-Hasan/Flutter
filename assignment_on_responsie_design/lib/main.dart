import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment_on_responsie_design/Home_screen.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
