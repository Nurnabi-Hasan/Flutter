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
  void initState() {
    super.initState();
    getProductList();
  }

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
            return  ProductItem(products:productList[index]);
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

  Future <void> getProductList() async{
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

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key, required this.products,
  });

  final Products products;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      title:Text(widget.products.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${widget.products.productCode}'),
           Text('Price: \$${widget.products.unitPrice}'),
           Text('Quantity: ${widget.products.qty}'),
           Text('Total Price: \$${widget.products.TotalPrice}'),
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
  }
}