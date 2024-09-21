import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/products.dart';
import 'addProductScreen.dart';
import 'editProductScreen.dart';



class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});



  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List <Products> productList=[];

  bool _inprogess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
        actions: [
          IconButton(onPressed: (){
            getProductList();
          }, icon: Icon(Icons.refresh)),
        ],

      ),
      body: _inprogess? Center(child: CircularProgressIndicator(),) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final item = productList[index] as Map;
            final id= item['_id'];
            return  ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              tileColor: Colors.white,
              //title:Text(productList[index].productName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //  Text('Product Code: ${productList[index].productCode}'),
                  Text('Price: \$${item['unitPrice']}'),
                  //Text('Quantity: ${productList[index].qty}'),
                  //Text('Total Price: \$${productList[index].TotalPrice}'),
                  const Divider(),
                  ButtonBar(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const EditProductScreen();
                            }),
                          );
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() {

                          });

                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const AddNewProductScreen();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );


  }

  Future <void> getProductList() asyncpr{
    _inprogess =true;
    setState(() {});

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);

    if(response.statusCode==200){
        productList.clear();
      Map<String, dynamic> jsonresponse = jsonDecode(response.body);

      for(var item in jsonresponse['data']){
        Products products = Products(
            id: item['_id'] ?? '',
            productName: item['ProductName'] ?? '',
            productCode: item['ProductCode'] ?? '',
            createdDate: item['CreatedDate'] ?? '',
            img: item['Img'] ?? '',
            qty: item['Qty'] ?? '',
            unitPrice: item['UnitPrice'] ?? '',
            TotalPrice: item['TotalPrice'] ?? '');

        productList.add(products);

      }
    }
    _inprogess = false;
    setState(() {});

  }

}

