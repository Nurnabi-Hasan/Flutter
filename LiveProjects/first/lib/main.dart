import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
        home: Scaffold(
     appBar: AppBar(backgroundColor: Colors.blue,
         title:Text('Home Page'),
     ),


     body:Center(
       child: Text('Nuenabi hasan', textAlign: TextAlign.start),

     )


   ),



   );
  }

}
