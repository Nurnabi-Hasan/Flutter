
import 'package:crud/Screens/add_product_screen.dart';
import 'package:crud/util/util.dart';
import 'package:flutter/material.dart';

import 'Screens/product_list_screen.dart';

class crudApp extends StatelessWidget {
  const crudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: productListScreen(),

      theme: ThemeData(
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
        floatingActionButtonTheme: _actionButtonThemeData(),
      ),


    );
  }


  FloatingActionButtonThemeData _actionButtonThemeData(){
    return FloatingActionButtonThemeData(
      backgroundColor: AppColors.themeColor,
      foregroundColor: Colors.white,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      )

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
            borderRadius: BorderRadius.circular(4),
          )

      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme (){
    return InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          filled: true,
          fillColor: Colors.white,
          border: _inputBorder(),
          focusedBorder:_focusBorder(),
      errorBorder: _errorBorder(),
      enabledBorder: _enableBorder(),
      disabledBorder: _disableBorder(),
    );
  }

  OutlineInputBorder _inputBorder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          width: 2,
          color: AppColors.themeColor,
        )
    );
  }
  OutlineInputBorder _focusBorder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          width: 2,
          color: AppColors.themeColor,
        )
    );
  }
  OutlineInputBorder _errorBorder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          width: 2,
          color: Colors.red.shade900,
        )
    );
  }
  OutlineInputBorder _enableBorder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey,
        )
    );
  }
  OutlineInputBorder _disableBorder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          width: 2,
          color: Colors.white,
        )
    );
  }
}
