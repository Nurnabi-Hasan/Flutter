import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp( myApp());
}

class  myApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homeactivity(),
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch:Colors.blueGrey),
      debugShowCheckedModeBanner: false,

    );
  }

}
class Homeactivity extends StatelessWidget{

  mySnackbar(message, context){

    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          backgroundColor: Colors.amber,
          toolbarHeight: 60,
          titleSpacing: 30,
          elevation:0,
          toolbarOpacity: 1,
          //centerTitle: true,

          actions: [
            IconButton(onPressed: (){mySnackbar("i am search", context);}, icon: Icon(Icons.search) ),
            IconButton(onPressed: (){mySnackbar("i am Setting", context);}, icon: Icon(Icons.settings) ),
            IconButton(onPressed: (){mySnackbar("i am Notifacation", context);}, icon: Icon(Icons.notifications)),

          ],


        ),

        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
          onPressed: () {
            mySnackbar("I am Snack bar", context);
          },
        ),

        bottomNavigationBar: BottomNavigationBar(
            currentIndex:1,
            backgroundColor: Colors.amber,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.messenger_outline_outlined),label: "Inbox",),
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),

            ],
            onTap: (int index){
              if(index == 0){
                mySnackbar("I am inbox", context);

              }
              if(index==1){
                mySnackbar("I am Home", context);
              }
              if(index == 2){
                mySnackbar("I am Profile", context);
              }
            }

        ),

        drawer: Drawer(
            child: ListView(
              children: [

                DrawerHeader(
                  padding: EdgeInsets.all(0),
                  child: UserAccountsDrawerHeader(

                    accountName: Text("Nurnabi Hasan",style: TextStyle(color: Colors.pink),),
                    accountEmail: Text("info@gmail.com"),
                    currentAccountPicture:Image.network('https://picsum.photos/250?image=9'),

                  ),
                ),

                ListTile(
                  title: Text("About"),
                  leading: (Icon(Icons.info_outline_rounded)),
                  onTap:() {

                  },
                ),

                ListTile(
                  title: Text("Contact"),
                  leading: (Icon(Icons.contact_page)),
                  onTap: (){
                    mySnackbar("i am contact", context);
                  },
                ),


                ListTile(
                  title: Text("Email"),
                  leading: (Icon(Icons.email)),
                  onTap: (){
                    mySnackbar("iam Email", context);
                  },
                ),

                ListTile(
                  title: Text("Phone"),
                  leading: (Icon(Icons.phone)),
                  onTap: (){
                    mySnackbar("i am phone", context);
                  },
                ),

              ],
            )


        ),

        endDrawer: Drawer(
            child: ListView(
              children: [

                DrawerHeader(
                  padding: EdgeInsets.all(0),
                  child: UserAccountsDrawerHeader(

                    accountName: Text("Nurnabi Hasan",style: TextStyle(color: Colors.pink),),
                    accountEmail: Text("info@gmail.com"),
                    currentAccountPicture:Image.network('https://picsum.photos/250?image=9'),

                  ),
                ),

                ListTile(
                  title: Text("About"),
                  leading: (Icon(Icons.info_outline_rounded)),
                  onTap:() {

                  },
                ),

                ListTile(
                  title: Text("Contact"),
                  leading: (Icon(Icons.contact_page)),
                  onTap: (){
                    mySnackbar("i am contact", context);
                  },
                ),


                ListTile(
                  title: Text("Email"),
                  leading: (Icon(Icons.email)),
                  onTap: (){
                    mySnackbar("iam Email", context);
                  },
                ),

                ListTile(
                  title: Text("Phone"),
                  leading: (Icon(Icons.phone)),
                  onTap: (){
                    mySnackbar("i am phone", context);
                  },
                ),

              ],
            )


        ),
        body:
        Center(

          child: ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
            child: Text('Go to Next Activity'),
          ),
        )

    );
  }
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title:Text('About'),

          actions: [

            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homeactivity()),
              );
            }, icon:Icon(Icons.arrow_back))
          ],
        ),
        body:
        Center(
          /* child: GestureDetector(
      // child: Image.network('https://www.google.com/search?sca_esv=60fec118eeb925b4&sxsrf=ADLYWIKYF5fzB02xmdvQejrqfLpvhw5M2w:1720187860291&q=Image+.&udm=2&fbs=AEQNm0Aa4sjWe7Rqy32pFwRj0UkWd8nbOJfsBGGB5IQQO6L3J_86uWOeqwdnV0yaSF-x2joZDvir2QxhZkTA8rK1etu4ohtqlTKXOQ56HmFa2r_epihwR_PH604agZ_mF9OnxB6ktSiXCB-ycCgoofBB2RNpThBeheFFcPldiIykQJs90YsauqipYeOBQzV8YBjdgycrb3uc&sa=X&ved=2ahUKEwin--6Sh5CHAxWi9DgGHXonAtAQtKgLegQIDxAB&biw=1366&bih=679&dpr=1#vhid=0E5dDA82VanW3M&vssid=mosaic'),
       child: Image.asset('assets/images.jpeg',
         height: 200,
         width: 300,
         fit:BoxFit.cover,),

       onTap: (){

       },
       onDoubleTap: (){

       },
       onLongPress: (){

       },
     )*/

          child: InkWell(
            onTap: (){
              print('Pressd');
            },
            onLongPress: (){
              print('Pressed Long');
            },
            onDoubleTap: (){
              print('Double Tap');
            },
            // child: Image.asset('assets/images.jpeg'),
            child: Text('Home'),
          ),


        )


    );
  }}
