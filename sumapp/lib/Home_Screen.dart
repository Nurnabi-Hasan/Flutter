


import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _firsttecontroller = TextEditingController();
  TextEditingController _secondtecontroller = TextEditingController();
  double _result=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('SumApp'),
          titleTextStyle: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize:22
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(

                controller: _firsttecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      )
                  ),
                  hintText: 'Enter First Number',
                  hintStyle: TextStyle(color: Colors.grey),
                  label: Text('Enter First Number'),
                ),
              ),

              SizedBox(height: 24,),

              TextField(
                controller: _secondtecontroller,
                decoration: InputDecoration(

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      )
                  ),
                  hintText: 'Enter Second Number',
                  hintStyle: TextStyle(color: Colors.grey),
                  label: Text('Enter Second Number'),
                ),
              ),

              SizedBox(height: 24,),

              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){_add();}, child: Text('+',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
                  TextButton(onPressed: (){_sub();}, child: Text('-',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
                  TextButton(onPressed: (){_multi();}, child: Text('*',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
                  TextButton(onPressed: (){_divide();}, child: Text('/',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
                  TextButton(onPressed: (){_modulas();}, child: Text('%',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),

                ],
              ),

              Text('Result : $_result', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),

            ],
          ),
        )
    );
  }
  void _add(){
    double frstNumber = double.tryParse(_firsttecontroller.text) ?? 0;
    double secondNumber = double.tryParse(_secondtecontroller.text) ?? 0;
     _result = frstNumber+secondNumber;
    setState(() {});
  }
  void _sub(){
    double frstNumber = double.tryParse(_firsttecontroller.text) ?? 0;
    double secondNumber = double.tryParse(_secondtecontroller.text) ?? 0;
    _result = frstNumber-secondNumber;
    setState(() {});
  }

  void _multi(){
    double frstNumber = double.tryParse(_firsttecontroller.text) ?? 0;
    double secondNumber = double.tryParse(_secondtecontroller.text) ?? 0;
    _result = frstNumber*secondNumber;
    setState(() {});
  }

  void _divide(){
    double frstNumber = double.tryParse(_firsttecontroller.text) ?? 0;
    double secondNumber = double.tryParse(_secondtecontroller.text) ?? 0;
    _result = frstNumber/secondNumber;
    setState(() {});
  }
  void _modulas(){
    double frstNumber = double.tryParse(_firsttecontroller.text) ?? 0;
    double secondNumber = double.tryParse(_secondtecontroller.text) ?? 0;
    _result = frstNumber%secondNumber;
    setState(() {});
  }
  }

