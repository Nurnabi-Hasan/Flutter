import 'package:flutter/material.dart';
import 'package:watertracker/HomeScreen.dart';


class Watertracker extends StatelessWidget {
  const Watertracker({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
