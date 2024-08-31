import 'dart:collection';
import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _tecontroler = TextEditingController(
    text: '1'
  );

  List<WaterTrack> WaterTrcList =[];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: const Text('Water Track'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text( getnoofglass().toString(),style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            const Text('Glases', style: TextStyle(fontSize: 18),),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  child:TextField(
                   controller: _tecontroler,
                    keyboardType: TextInputType.number,
                  ),
                ),
                TextButton(onPressed: (){_addNewWaterTrack();}, child: const Text('Add')),
              ],
            ),

            Expanded(
              child: ListView.separated(itemBuilder:(context, index){
                WaterTrack watertrac = WaterTrcList[index];
                return ListTile(

                  title: Text('${watertrac.dateTime.hour}:${watertrac.dateTime.hour}'),
                  subtitle: Text('${watertrac.dateTime.day}/${watertrac.dateTime.month}/${watertrac.dateTime.year}'),
                  leading: CircleAvatar(child: Text('${watertrac.noOfGlass}')),
                  trailing: IconButton(onPressed: (){removeWatertrack(index);},icon:const Icon(Icons.delete_outline),),
                );
              },
                  separatorBuilder: (contex, index){
                return const Divider();
                  },
                  itemCount:WaterTrcList.length)
            )
          ],

        ),

      ),
    );
  }
int getnoofglass(){

    int counter =0;
    for(WaterTrack t in WaterTrcList){
          counter += t.noOfGlass;
    }

    return counter;
}

void removeWatertrack(index){
    WaterTrcList.removeAt(index);
    setState(() { });
}

void _addNewWaterTrack(){

    if(_tecontroler.text.isEmpty){
      _tecontroler.text= '1';
    }
    final noOfGlass = int.tryParse(_tecontroler.text)??1;

    WaterTrack watertrack = WaterTrack(noOfGlass, DateTime.now());

    WaterTrcList.add(watertrack);
    _tecontroler.text='1';
    setState(() { });

}

}

class WaterTrack{
  final int noOfGlass;
  final DateTime dateTime;

  WaterTrack(this.noOfGlass, this.dateTime);
}