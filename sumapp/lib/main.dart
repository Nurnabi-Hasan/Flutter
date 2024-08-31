import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home_Screen.dart';

void main(){
  runApp(sumApp());
}

class sumApp extends StatelessWidget {
  const sumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
