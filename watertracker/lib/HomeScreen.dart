import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController _tecontroler = TextEditingController(text: '1');
  List<WaterTrack> WaterTrackerList = [];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaquery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Water Tracker',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade500,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(


              width: mediaquery.size.width,
              height: 170
              ,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 3.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You Drunk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _getnoofglass().toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900),
                  ),
                  Text(
                    'Glasses of Water!',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (contex, index) {
                      WaterTrack watertrac = WaterTrackerList[index];

                    return Padding(
                        padding: const EdgeInsets.only(right: 4, left: 4),
                        child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            color: Colors.blue,
                          ),
                          child: ListTile(
                            title: Text('You Drink ${watertrac.noOfGlasses} Glasses of Water at a Time'),
                            subtitle: Text(
                                '${DateTime.now().day}/ ${DateTime.now().month}/${DateTime.now().year} - ${DateTime.now().hour}:${DateTime.now().minute}'),
                            leading: CircleAvatar(
                              child: Icon(Icons.water_drop_outlined, color: Colors.blue,),
                              backgroundColor: Colors.white,

                            ),
                            trailing: IconButton(

                              onPressed: () {

                                showDialog(
                                  barrierDismissible: false,
                                  barrierColor: Colors.black54,
                                  context: context,
                                  builder: (ctx)
                                {
                                  return AlertDialog(
                                    elevation: 20,
                                    title: Text('Are You Sure ?'),
                                    content: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Delete This Item')
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('No')),
                                      TextButton(
                                          onPressed: () {
                                            _remove(index);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Yes')),
                                    ],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)),
                                  );
                                });
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: WaterTrackerList.length)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              barrierColor: Colors.black54,
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  elevation: 20,
                  title: Text('Add Number of glasses'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                _decrementNoofglass();
                              },
                              icon: Icon(Icons.remove)),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              controller: _tecontroler,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: 'No. Of Glass',
                                  labelText: 'Quantity',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.indigoAccent,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                _incrementNoofglass();
                              },
                              icon: Icon(Icons.add)),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          _addWaterTrack();
                        },
                        child: Text('ADD')),
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addWaterTrack() {
    if (_tecontroler.text.isEmpty) {
      _tecontroler.text = '1';
    }
    int noofglass = int.tryParse(_tecontroler.text) ?? 1;

    WaterTrack waterTrack =
        WaterTrack(noOfGlasses: noofglass, dateTime: DateTime.now());

    WaterTrackerList.add(waterTrack);
    _tecontroler.text = '1';
    setState(() {});
    Navigator.pop(context);
  }


  int _getnoofglass() {
    int counter = 0;
    for (WaterTrack t in WaterTrackerList) {
      counter += t.noOfGlasses;
    }
    setState(() {});
    return counter;
  }

  void _incrementNoofglass() {
    int value = int.tryParse(_tecontroler.text) ?? 1;
    setState(() {});
    value++;
    _tecontroler.text = (value).toString();
  }

  void _decrementNoofglass() {
    int value = int.tryParse(_tecontroler.text) ?? 1;
    setState(() {});
    // value--;
    if (value > 1) {
      value--;
    } else {}
    _tecontroler.text = (value).toString();
  }

  void _remove(index) {
    WaterTrackerList.removeAt(index);
    setState(() {});
  }
}

class WaterTrack {
  final int noOfGlasses;
  final DateTime dateTime;

  WaterTrack({required this.noOfGlasses, required this.dateTime});
}
