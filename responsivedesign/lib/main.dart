import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*
void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  /*  MediaQueryData mediaQuery = MediaQuery.of(context);

    print(mediaQuery.size);

    if (mediaQuery.size.width < 200) {

      return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            backgroundColor: Colors.blue,
          ),

        body: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('My Name is Nurnabi Hasan'),
            Text('My Name is Nurnabi Hasan'),
            Text('My Name is Nurnabi Hasan'),
            Text('My Name is Nurnabi Hasan'),
          ],
        ),

      );
    }else{
      return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.red,
        ),

        body: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [

            Text('Nurnabi Hasan'),
          ],
        ),

      );

    }
    */

    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation Builder'),
        backgroundColor: Colors.pink,
      ),
/*
      body: OrientationBuilder(
        builder:(context, Orientation orientation) {
          print(orientation);

if(orientation == Orientation.portrait){
  return Column(
    children: [
      Text('Nurnabi')
    ],
  );
}
else
  {
    return Column(
      children: [
        Text('Hasan')
      ],
    );
  }
    },

    )
        */

    body: LayoutBuilder (
        builder: (context, BoxConstraints contraints){

          if(contraints.maxWidth <600){
            return Text('This is a Phone');
          }else if(contraints.maxWidth >600 && contraints.maxWidth<1000){
            return Text('This is Tablet');
          }
          else
            {
              return Text('This Is Laptop');

            }
    }
    )
    );
  }
}
*/

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Counter App'),
      ),

      body:Center(
        child: Text('Counter $counter'),
      ),

      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: (){counter++; setState(() {
          });}, child: Icon(Icons.add),),

          SizedBox(width: 20,),

          FloatingActionButton(onPressed: (){counter--; setState(() {

          });}, child: Icon(Icons.remove),)
        ],
      )


    );
  }
}