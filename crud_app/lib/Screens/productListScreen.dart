import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'addNewProducts.dart';

class productListScreen extends StatefulWidget {
  const productListScreen({super.key});



  @override
  State<productListScreen> createState() => _productListScreenState();
}

class _productListScreenState extends State<productListScreen> {

  List productList = [];

  bool _inprogress = false;

  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        title: Text('Product List'),
        elevation: 20,
        titleSpacing: 20,
        actions: [
          IconButton(onPressed: (){
            getProduct();
          }, icon: Icon(Icons.refresh_outlined), color: Colors.white,),
        ],
      ),

      body: _inprogress?Center(child: CircularProgressIndicator(color: Colors.deepPurple.shade900,),) : RefreshIndicator(
        onRefresh: getProduct,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemCount: productList.length,
              itemBuilder: (contex, index) {
                final product = productList[index] as Map;
                final id = product['_id'] as String;
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
                      Text('Total Price: \$${product['TotalPrice']}'),

                      Divider(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(onPressed: () {
                            NavigateToeidtPage(product);
                          },
                            icon: Icon(Icons.edit,),
                            label: Text('Edit'),),


                          TextButton.icon(onPressed: () {deleteProduct(id);},
                            icon: Icon(Icons.delete, color: Colors.red.shade800,),
                            label: Text('Delete', style: TextStyle(
                                color: Colors.red.shade800),),),
                        ],
                      )

                    ],
                  ),

                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height:8);
              },
            )
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {NavigateToaddPage();},
        child: Text('Add', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),//Icon(Icons.add, color: Colors.white,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        elevation: 50,
        backgroundColor: Colors.deepPurple.shade900,
      ),

    );
  }

  Future<void> getProduct() async {
    _inprogress= true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonresponce = jsonDecode(response.body);
      final Products = jsonresponce['data'] as List;
      setState(() {
        productList = Products;
      });
      }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('an error occured')));
    }
    _inprogress =false;
    setState(() {});
    }

  Future<void> deleteProduct(String id) async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$id');

    Response response = await get(uri);
    if (response.statusCode == 200) {

      setState(() {
        getProduct();
      });

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('an error occured')));
    }
    setState(() {});
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
