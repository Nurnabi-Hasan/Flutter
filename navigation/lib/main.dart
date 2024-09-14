import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Home'),
        backgroundColor: Colors.grey,
      ) ,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Wellcome To Home Screen'),
            SizedBox(height: 24,),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Profile();
                  },
                ),
              );
              
            }, child: Text('Profile')),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SettingScreen();
                  },
                ),
              );

            }, child: Text('Setting')),

            SizedBox(height: 16,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return aboutScreen();
              }));
            }, child: Text('About')),
          ],
        ),
      ),

    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.grey,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome To Profile Screen'),
            SizedBox(height: 24,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SettingScreen();
              }));
            }, child: Text('Setting')),

            SizedBox(height: 16,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return aboutScreen();
              }));

            }, child: Text('About')),

            SizedBox(height: 16,),

            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Back')),

          ],
        ),
      ),


    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Welcome To Settings Screen'),
            SizedBox(height: 24,),
            ElevatedButton(onPressed: (){}, child: Text('Profile')),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: (){}, child: Text('About')),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: (){}, child: Text('Back')),

          ],
        ),
      ),

    );
  }
}

class aboutScreen extends StatelessWidget {
  const aboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Welcome To About Screen'),
            SizedBox(height: 24,),
            ElevatedButton(onPressed: (){}, child: Text('Profile')),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: (){}, child: Text('Seting')),
            SizedBox(height: 16,),
            ElevatedButton(onPressed: (){}, child: Text('Back')),

          ],
        ),
      ),

    );
  }
}
