import 'dart:convert';

import 'package:crud/util/util.dart';
import 'add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class editProductScreen extends StatefulWidget {
  final Map? editList;


  const editProductScreen({super.key, this.editList});

  @override
  State<editProductScreen> createState() => _editProductScreenState();
}

class _editProductScreenState extends State<editProductScreen> {
  TextEditingController _productNameTeControler = TextEditingController();
  TextEditingController _productCodeTeControler = TextEditingController();
  TextEditingController _productqtyTeControler = TextEditingController();
  TextEditingController _productunitpriceTeControler = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEdit= false;

  @override
  void initState() {
        super.initState();

   /*     final eidtlist = widget.editList;
        if(eidtlist != null){
          _isEdit = true;
          final productName = eidtlist['ProductName'];
          final productCode = eidtlist['ProductCode'];
          final productQty = eidtlist['Qty'];
          final unitPrice = eidtlist['UnitPrice'];

          _productNameTeControler.text = productName;
          _productCodeTeControler= productCode;
          _productqtyTeControler = productQty;
          _productunitpriceTeControler = unitPrice;


        }

    */
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: const Text(
          'Add New Product',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
        ),
        titleSpacing: 6,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Product',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              ),
              const SizedBox(
                height: 24,
              ),
              _buildForm()
            ],
          ),
        ),
      ),
    );
  }

  // Add Product Form
  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
              controller: _productNameTeControler,
              decoration: const InputDecoration(
                labelText: 'Product Name',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a Valid value';
                }
              }),
          const SizedBox(height: 10),
          TextFormField(
              controller: _productCodeTeControler,
              decoration: const InputDecoration(
                labelText: 'Product Code',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a Valid value';
                }
              }),
          const SizedBox(height: 10),
          TextFormField(
              controller: _productqtyTeControler,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Product Quantity',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a Valid value';
                }
              }),
          const SizedBox(height: 10),
          TextFormField(
              controller: _productunitpriceTeControler,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Unit Price',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a Valid value';
                }
              }),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {_onTapEditProduct();},
              child: const Text(
                'Save Product',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              )),
        ],
      ),
    );
  }

  void _onTapEditProduct(){
    if(_formKey.currentState!.validate()){
      editProduct();
    }
  }

  Future<void> editProduct()async{

    final editlist = widget.editList;
    if(editlist != null){
      return ;

    }
    final id = editlist!['_id'];

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/UpdateProduct/$id');

    Map <String, dynamic> requestBody ={
      "ProductName": _productNameTeControler.text,
      "ProductCode": _productCodeTeControler.text,
      "Qty": _productqtyTeControler.text,
      "UnitPrice": _productunitpriceTeControler.text,
    };

    Response response = await post(uri,headers: {
      "Content-type": "application/json"
    },
      body: jsonEncode(requestBody),
    );
//print(response.statusCode);

    if(response.statusCode == 200){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product Updated')));
      clearTextField();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('an error occurred',style: TextStyle(color:  Colors.red.shade800),)));
    }

    setState(() {});
  }


  void clearTextField() {
    _productNameTeControler.clear();
    _productCodeTeControler.clear();
    _productqtyTeControler.clear();
    _productunitpriceTeControler.clear();
  }


  @override
  void dispose() {
    _productNameTeControler.dispose();
    _productCodeTeControler.dispose();
    _productqtyTeControler.dispose();
    _productunitpriceTeControler.dispose();
    super.dispose();
  }

}


