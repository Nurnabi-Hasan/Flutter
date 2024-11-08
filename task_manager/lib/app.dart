import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/spalsh_screen.dart';
import 'package:task_manager/ui/utils/app_color.dart';


class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  static GlobalKey<NavigatorState> NavigatorKey = GlobalKey<NavigatorState>();

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManagerApp.NavigatorKey,

      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),

      theme: ThemeData(

        colorSchemeSeed: AppColors.themeColor,

        inputDecorationTheme: _inputDecoration(),
        elevatedButtonTheme: _elevatedButtonThemeData(),


      ),
    );
  }

  InputDecorationTheme _inputDecoration (){
return InputDecorationTheme(
  hintStyle: const TextStyle(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    border: _inputBorder(),
  enabledBorder: _inputBorder(),
  errorBorder: _inputBorder(),
  focusedBorder: _inputBorder(),
);
  }

  OutlineInputBorder _inputBorder (){
    return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
    );
  }

ElevatedButtonThemeData _elevatedButtonThemeData(){
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )

      ),
    );
}


}
