import 'package:flutter/material.dart';
import 'package:watertrsckerapp/HomeScreen.dart';

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Homescreen(),
    );
  }
}
