import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Styling App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter Text Styling',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Experiment with Text Styles',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('You Clicked The Button')));
                },
                child: Text('Click Me')),
            SizedBox(
              height: 16,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'Flutter!',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ]))
          ],
        ),
      ),
    );
  }
}
