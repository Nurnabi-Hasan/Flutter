import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaquery = MediaQuery.of(context);

    if (mediaquery.size.width >= 1000) {
      return Padding(
        padding: const EdgeInsets.all(36.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'HUMMING \nBIRD.',
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Episodes',
                              style: TextStyle(fontSize: 16),
                            )),
                        TextButton(
                            onPressed: () {},
                            child:
                                Text('About', style: TextStyle(fontSize: 16))),
                      ],
                    )
                  ],
                ),
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 0.5,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: mediaquery.size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FLUTTER WEB.\nTHE BASICS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            'In this course we will go over the basic of using flutter Web for development. Topics will include Responsive Layout Deploying Font Change Hover Functionality Modals and more ',
                            style: TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Join Course'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent.shade400,
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          minimumSize: Size(190, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ],
                )
              ],
            ),
          )),
        ),
      );
    }

    if (mediaquery.size.width >= 640 && mediaquery.size.width < 1000) {
      return Padding(
        padding: const EdgeInsets.all(36.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'HUMMING \nBIRD.',
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Episodes',
                              style: TextStyle(fontSize: 16),
                            )),
                        TextButton(
                            onPressed: () {},
                            child:
                                Text('About', style: TextStyle(fontSize: 16))),
                      ],
                    )
                  ],
                ),
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 0.5,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'FLUTTER WEB.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'THE BASICS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'In this course we will go over the basic of using flutter Web for development. Topics will include Responsive Layout Deploying Font Change Hover Functionality Modals and more ',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Join Course'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent.shade400,
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          minimumSize: Size(190, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ],
                )
              ],
            ),
          )),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'HUMMING \nBIRD.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        backgroundColor: Colors.white,
        width: 250,
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade400,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SKILL UP NOW',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                    ),
                    Text('TAP HERE',style: TextStyle(color: Colors.white),)
                  ],
                )),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Episodes'),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('About'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                    child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.5,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'FLUTTER WEB.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'THE BASICS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'In this course we will go over the basic of using flutter Web for development. Topics will include Responsive Layout Deploying Font Change Hover Functionality Modals and more ',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.5,
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Join Course'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent.shade400,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                        minimumSize: Size(190, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ],
              )
            ],
                    ),
                  ),
          )),
    );
  }
}
