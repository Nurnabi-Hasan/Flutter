import 'dart:convert';

import 'package:crud/Screens/add_product_screen.dart';
import 'package:crud/Screens/edit_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../util/util.dart';

class productListScreen extends StatefulWidget {
  const productListScreen({super.key});

  @override
  State<productListScreen> createState() => _productListScreenState();
}

class _productListScreenState extends State<productListScreen> {
  List productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: const Text(
          'Product List',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
        ),
        titleSpacing: 6,
      ),
      body:  RefreshIndicator(
        onRefresh: getProduct,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
              itemBuilder: (contex, index) {
                final product = productList[index] as Map;
                final id = product['_id'] as String;

               /*
                // for show the Total Price
              int? qty = int.tryParse(product['Qty']!);
                int? unitprice = int.tryParse(product['UnitPrice']!);
                 int totalPrice = qty! * unitprice!;
*/

                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  textColor: Colors.black,
                  tileColor: Colors.white,
                  title: Text('${product['ProductName']}'),
                  subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      Text('Product Code: ${product['ProductCode']}'),
                      Text('Quantity: ${product['Qty']}'),
                      Text('Unit Price: \$${product['UnitPrice']}'),

                     //  Text('Total Price: \$${int.tryParse(product['UnitPrice'] * int.tryParse(product['Qty']))}'),

                            Divider(),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    TextButton.icon(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (contex)=>editProductScreen()));}, label:Text('Edit'), icon: Icon(Icons.edit_note), style:TextButton.styleFrom(foregroundColor: Colors.green.shade900),),
    TextButton.icon(onPressed: (){deleteProduct(id); }, label:Text('Delete'), icon: Icon(Icons.delete_outline),style:TextButton.styleFrom(foregroundColor: Colors.red.shade900),)
  ],
)


                          ]
                      ),
                );
              },

              separatorBuilder: (contex, index) {
                return SizedBox(height: 10);
              },
              itemCount: productList.length),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (contex) => addNewProductScreen()));
        },
        child: Text(
          'Add',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }

  // Read Product Using Api

  Future<void> getProduct() async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonresponce = jsonDecode(response.body);
      final result = jsonresponce['data'] as List;
      productList = result;
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        'an error occurred',
        style: TextStyle(color: Colors.red.shade800),
      )));
    }
  }

// Read Product Using Api

  Future<void> deleteProduct(String id) async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$id');
    Response response = await get(uri);
    if (response.statusCode == 200) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Deleted')));

      setState(() {
        getProduct();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'an error occurred',
            style: TextStyle(color: Colors.red.shade800),
          )));
    }
  }


  void NavigateToaddPage()async{
    final route = MaterialPageRoute(builder: (context) => addNewProductScreen(),);

    await Navigator.push(context, route);

    getProduct();
  }

  void NavigateToeidtPage(Map product)async{
    final route = MaterialPageRoute(builder: (context) => addNewProductScreen(editList:product),);

    await Navigator.push(context, route);

    getProduct();
  }

}
