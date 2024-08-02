import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          elevation: 50,
          titleSpacing: 5,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold,),
          
        ),

            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.yellow,
                    )),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.yellow,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ))

      ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            elevation: 7,
            shadowColor: Colors.green,
          )
        ),

          textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
           foregroundColor: Colors.green,
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

      themeMode: ThemeMode.dark,


    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {

  TextEditingController  _descriptionTEController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.brown,
        title: Text("My App"),
      ),

      /* body: SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisSize: MainAxisSize.max,

                  children: [
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
           Text('Nurnabi Hasan'),
                  ],
              ),

         ),*/

/*body: SingleChildScrollView(

  child: Row(

    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Hasan'),
          Text('Hasan'),

          Row(
            children: [
              Text('Nurnabi Hasan'),
              Text('Mehedi Hasan'),
              Text('Anis Hasan'),


            ],
          ),




          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),

        ],
      ),

      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),

        ],
      ),

      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),
          Text('Hasan'),

        ],
      ),



    ]

  ),

),
*/

      /* body: SingleChildScrollView(
     child: Column(
       children: [
         SizedBox(
           height: 100,
           width: 100,
      child: Center(
          child: Text('Box 1')
      ) ,
           ),
         SizedBox(
           height: 100,
           width: 100,
           child: Center(
               child: Text('Box 1')
           ) ,
         ),
         SizedBox(
           height: 100,
           width: 100,
           child: Center(
               child: Text('Box 1')
           ) ,
         ),
         SizedBox(
           height: 100,
           width: 100,
           child: Center(
               child: Text('Box 1')
           ) ,
         ),
         SizedBox(
           height: 100,
           width: 100,
           child: Center(
               child: Text('Box 1')
           ) ,
         ),
         SizedBox(
           height: 100,
           width: 100,
           child: Center(
               child: Text('Box 1')
           ) ,
         ),
         SizedBox(
           height: 100,
           width: 100,
           child: Center(
               child: Text('Box 1')
           ) ,
         ),
         SizedBox(
           height: 100,
           width: 100,
           child: Center(
               child: Text('Box 1')
           ) ,
         ),
         SizedBox(
           height: 100,
           width: 100,
           child: Center(
               child: Text('Box 1')
           ) ,
         ),
       ],

     ),
   ),
*/
      /* body: ListView(
       scrollDirection: Axis.horizontal,

       children: [
         SizedBox(
           height: 100,
           width: 100,
         ),
         SizedBox(
           height: 100,
           width: 100,
         ),
         SizedBox(
           height: 100,
           width: 100,
         ),
         SizedBox(
           height: 100,
           width: 100,
         ),
         SizedBox(
           height: 100,
           width: 100,
         ),
         SizedBox(
           height: 100,
           width: 100,
         ),
         SizedBox(
           height: 100,
           width: 100,
         ),
         SizedBox(
           height: 100,
           width: 100,
         ),
         SizedBox(
           height: 100,
           width: 100,
         ),
         SizedBox(
           height: 100,
           width: 100,
         ),
         SizedBox(
           height: 100,
           width: 100,
         ),

       ],


     ),

*/

/*
     body:  ListView.separated(
       itemCount: 100,
       itemBuilder:(context, index){
         return ListTile(
           tileColor: Colors.white,
            textColor: Colors.deepOrange,
           title: Text('Hasan'),
           subtitle:Text ('School Freind'),
             trailing: Icon(Icons.call, color: Colors.deepOrange, size: 20,),
           leading: Text((index+1).toString()),

           onTap: (){
             print('$index Pressed');
           },
           titleTextStyle: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
               color: Colors.amberAccent,
           ),
         );

       },
       separatorBuilder: (context, index){
         return Divider(
          // height: 20,
           color: Colors.grey.shade50,
            thickness: 2,
           //indent: 10,
         //  endIndent: 10,
         );
       },

     ),
*/

      /* body: GridView(
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
       crossAxisSpacing: 10,
         mainAxisSpacing: 10,
       ),
       children: [
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
         Text('Nurnab Hasan'),
       ],
     ),

      */

/*

     body: GridView.builder(
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 4,
           crossAxisSpacing: 10,
             mainAxisSpacing: 10,
         ),
         itemCount: 200,
         itemBuilder: (context, index){
           return Column(
             children: [
               Text(index.toString()),
               Center(child: Text('Hasan')),
             ],
           );
         }),
*/
/*
body: Center(
  child: Container(

    height: 100,
    width: 200,

    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(15),

child: Text('Nurnabi'),


alignment: Alignment.center,
decoration: BoxDecoration(
  color: Colors.deepOrange,



   //   borderRadius: BorderRadius.circular(15),
borderRadius: BorderRadius.only(
  topLeft: Radius.circular(50),
  bottomRight: Radius.circular(50),

),
    shape: BoxShape.rectangle,

  border: Border.all(color: Colors.black, width: 1),

  boxShadow:<BoxShadow>[
    BoxShadow(
        color: Colors.black26,
      offset: Offset(0,5),
       blurRadius: 7,
      spreadRadius: 2,
    ),
  ]

),
  ),
),
*/

      /* body:  ElevatedButton(
          onPressed: () {
            showDialog(
                barrierDismissible: false,
                barrierColor: Colors.black54,
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: Text('Do You Want to Exit ?'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Custom'),
                        Text('Dialog'),
                      ],
                    ),
                    actions: [
                      TextButton(onPressed: () {}, child: Text('No')),
                      TextButton(onPressed: () {}, child: Text('Yes')),
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  );
                });
          },
          child: Text('Aleart Dialogss'),
        )
    */

      /* body: ElevatedButton(
        onPressed:(){
          showModalBottomSheet(
              barrierColor: Colors.black54,
              isDismissible: false,
             // enableDrag: false,
              context: context, builder: (ctx){
            return SizedBox(
              height: 500,
              width: double.infinity,

              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Bottom Sheet'),
                  ),
                  Divider(
                   //height:2 ,
                    color: Colors.deepOrange,
                    endIndent: 15,
                    indent: 15,
                    thickness: 2,
                  ),
                  Column(
                    children: [

                      Text('Nurnabi Hasan'),
                      Text('Nurnabi Hasan'),
                      Text('Nurnabi Hasan'),
                      Text('Nurnabi Hasan'),
                      Text('Nurnabi Hasan'),
                      Text('Nurnabi Hasan'),
                      Text('Nurnabi Hasan'),
                    ],
                  )
                ],

              ),

            );

          });

        }, child:Text ("Botton Sheet"),

      )
*/

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              enabled: true,
              decoration: InputDecoration(
                  label: Text('Name'),
                  prefixIcon: Icon(Icons.account_circle),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 17),
                  hintText: 'Enter Your Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              enabled: true,
              decoration: InputDecoration(
                  label: Text('Phone or Email'),
                  prefixIcon: Icon(Icons.mail_outline_rounded),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 17),
                  hintText: 'Enter Your Phone or Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              obscureText: true,
              enabled: true,
              decoration: InputDecoration(
                  label: Text('Password'),
                  prefixIcon: Icon(Icons.key),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 17),
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(

              controller: _descriptionTEController,
              enabled: true,
              maxLines: 4,
              maxLength: 250,

              onChanged: (String Value){
                print(Value);
              },

              onTap: () {
                    print("Description Tapped");
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                  label: Text('Description'),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 17),
                  hintText: 'Write Description',
                  hintStyle: TextStyle(color: Colors.grey),
               ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    barrierColor: Colors.black54,
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text('Are You Sure ?'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('Create an Account')],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('No')),
                          TextButton(onPressed: () {}, child: Text('Yes')),
                        ],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      );
                    });
              },
              child: Text('Create Account'),
            ),

            SizedBox(height: 16,),

            ElevatedButton(onPressed: (){

           showDialog(
               barrierColor: Colors.black54,
               barrierDismissible: false,
               context: context, builder: (ctx){

             return AlertDialog(

               title: Text('Are You Sure ?'),
               content: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [Text('Clear all The Descriptions !!!')],
               ),
               actions: [
                 TextButton(onPressed: (){Navigator.pop(context);}, child: Text('No')),
                 TextButton(onPressed: (){
                 //  _descriptionTEController.text ='Nurnabi';
                  _descriptionTEController.clear();
                  Navigator.pop(context);
                   }, child: Text('Yes')),

               ],

             );

           });
            }, child: Text('Clear Description')),
            

          ],

        ),
      ),
    );
  }
}
