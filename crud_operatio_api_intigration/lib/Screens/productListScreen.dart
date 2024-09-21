import 'dart:convert';
import 'package:crud_operatio_api_intigration/Screens/addNewProductScreen.dart';
import 'package:crud_operatio_api_intigration/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class productListScreen extends StatefulWidget {
  const productListScreen({super.key});



  @override
  State<productListScreen> createState() => _productListScreenState();
}

class _productListScreenState extends State<productListScreen> {

  List <Product> productList = [];




  bool _inprogress = false;




  void initState() {
    super.initState();
    getProduct();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        elevation: 20,
        titleSpacing: 20,
        actions: [
          IconButton(onPressed: (){
            getProduct();
          }, icon: Icon(Icons.refresh_outlined)),
        ],
      ),

      body: _inprogress?Center(child: CircularProgressIndicator(color: Colors.blue,),) : Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            itemCount: productList.length,
            itemBuilder: (contex, index) {
              final item = productList[index] as Map;
              final id = item['_id'] as String;
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textColor: Colors.black,
                tileColor: Colors.grey,
                title: Text('${product.productName}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product Code: ${product.productCode}'),
                    Text('Quantity: ${product.productQuantity}'),
                    Text('Unit Price: \$${product.unitPrice}'),
                    Text('Total Price: \$${item[product.totalPrice]}'),

                    Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(onPressed: () {},
                          icon: Icon(Icons.edit,),
                          label: Text('Edit'),),
                        TextButton.icon(onPressed: () {deleterProduct(id);},
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
              return SizedBox(height: 16);
            },
          )
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const addNewProductScreen();
            }),
          );
         getProduct();
        },
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        elevation: 50,
        backgroundColor: Colors.blue.shade800,
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

      for(var item in jsonresponce['data']){
        Product product = Product(
            productID: item['_id'],
            productName: item['ProductName'],
            productCode: item['ProductCode'],
            productQuantity: item['Qty'],
            unitPrice: item['UnitPrice'],
            totalPrice: item['TotalPrice']);

        productList.add(product);
      }

      }
    _inprogress = false;
    setState(() {});
    }

  Future<void> deleterProduct(String id) async {

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct/$id');
    Response response = await get(uri);
      if (response.statusCode == 200) {

      }
    setState(() { });
  }



}


