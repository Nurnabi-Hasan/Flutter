
import 'package:flutter/material.dart';

import 'Screens/productListScreen.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: productListScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 50,
          titleSpacing: 5,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,),

        ),

        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                )),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white,
                )),

            enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                )) ,

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                ))

        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              elevation: 7,
              shadowColor: Colors.green,
            )
        ),

        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
                elevation: 20,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              // backgroundColor: Colors.grey

              // shadowColor: Colors.green,

            )
        ),

      ),

      darkTheme: ThemeData(

        brightness: Brightness.dark
        ,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          elevation: 50,
          titleSpacing: 5,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold,),

        ),

        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.green,
                )),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white,
                ))

        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              elevation: 7,
              shadowColor: Colors.pink,
            )
        ),

        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: Colors.pink,
                elevation: 20,
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
              // backgroundColor: Colors.grey

              // shadowColor: Colors.green,

            )
        ),
      ),

    );
  }
}
