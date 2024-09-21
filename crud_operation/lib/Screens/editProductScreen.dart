import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<EditProductScreen> {
  final TextEditingController _productNameTEController =
  TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildNewProductForm(),
      ),
    );
  }

  Widget _buildNewProductForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: const InputDecoration(
                hintText: 'Name', labelText: 'Product Name'),
          ),

         SizedBox(height: 16,),

          TextFormField(
            controller: _unitPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Unit Price', labelText: 'Unit Price'),

          ),

          SizedBox(height: 16,),

          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Total Price', labelText: 'Total Price'),
          ),

          SizedBox(height: 16,),

          TextFormField(
            controller: _imageTEController,
            decoration: const InputDecoration(
                hintText: 'Image', labelText: 'Product Image'),
          ),

          SizedBox(height: 16,),

          TextFormField(
            controller: _codeTEController,
            decoration: const InputDecoration(
                hintText: 'Product code', labelText: 'Product Code'),
          ),

          SizedBox(height: 16,),

          TextFormField(
            controller: _quantityTEController,
            decoration: const InputDecoration(
                hintText: 'Quantity', labelText: 'Quantity'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
            ),
            onPressed: _onTapEditProductButton,
            child: const Text('SAVE'),
          )
        ],
      ),
    );
  }

  void _onTapEditProductButton() {
addEditProduct();
setState(() {});

  }

  Future <void> addEditProduct() async{
    //_inprogress = true;
    //setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/UpdateProduct/6395ce12187245c05d68da82');
    Map<String, dynamic> requestBody = {
      "ProductName": _productNameTEController.text,
      "ProductCode": _codeTEController.text,
      "Img": _imageTEController.text,
      "UnitPrice": _unitPriceTEController.text,
      "Qty": _quantityTEController.text,
      "TotalPrice": _totalPriceTEController.text,
    };

    Response response= await post(uri,
      body: jsonEncode(requestBody),
    );
    if(response.statusCode == 200){
      //clearTextfield();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('New Product Added')));

    }
    //_inprogress = false;
    setState(() {});
  }


  @override
  void dispose() {
    _productNameTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _unitPriceTEController.dispose();
    _imageTEController.dispose();
    _codeTEController.dispose();
    super.dispose();
  }
}