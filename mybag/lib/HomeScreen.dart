import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<addIteam> iteamList = [];

  int calculateTotal() {
    return iteamList.fold(0, (sum, item) => sum + item.qty * item.unitprice);
  }

  @override
  Widget build(BuildContext context) {
    if (iteamList.isEmpty) {
      _addItemToList();
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'My Bag',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemBuilder: (contex, index) {
                  addIteam additeam = iteamList[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset(additeam.image),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${additeam.productName}'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Color: ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text('${additeam.color}'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Size: ',
                                        style: TextStyle(color: Colors.grey)),
                                    Text('${additeam.size}'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (additeam.qty > 1) {
                                          additeam.qty--;
                                        }
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                    Text(
                                      '${additeam.qty}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          additeam.qty++;
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.add)),
                                  ],
                                )
                              ],
                            ),
                            Flexible(
                              child: FractionallySizedBox(
                                widthFactor: 1,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_vert_outlined),
                                ),
                                Text('\$' +
                                    '${additeam.unitprice * additeam.qty}'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: iteamList.length)),
        Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Cost: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$' + '${calculateTotal()}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'CHECK OUT',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  void _addItemToList() {
    addIteam item1 = addIteam(
        image: 'assets/shirt1.jpg',
        productName: 'T-Shirt',
        color: 'Blue',
        size: 'M',
        unitprice: 30,
        qty: 1);
    addIteam item2 = addIteam(
        image: 'assets/shirtred.jpg',
        productName: 'T_shirt',
        color: 'Red',
        size: 'L',
        unitprice: 25,
        qty: 1);
    addIteam item3 = addIteam(
        image: 'assets/tshirtblue.jpg',
        productName: 'T_shirt',
        color: 'Black',
        size: 'M',
        unitprice: 35,
        qty: 1);

    iteamList.add(item1);
    iteamList.add(item2);
    iteamList.add(item3);
  }
}

class addIteam {
  final String image;
  final String productName;
  final String color;
  final String size;
  final int unitprice;
  int qty;

  addIteam(
      {required this.image,
      required this.productName,
      required this.color,
      required this.size,
      required this.unitprice,
      required this.qty}) {}
}
