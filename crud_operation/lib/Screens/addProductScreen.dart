import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEController =
  TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inprogress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildNewProductForm(),
        ),
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
            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a Valid value';
              }
            },
          ),

         SizedBox(height: 16,),

          TextFormField(
            controller: _unitPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Unit Price', labelText: 'Unit Price'),

            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a Valid value';
              }
            },

          ),

          SizedBox(height: 16,),

          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Total Price', labelText: 'Total Price'),

            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a Valid value';
              }
            },

          ),

          SizedBox(height: 16,),

          TextFormField(
            controller: _imageTEController,
            decoration: const InputDecoration(
                hintText: 'Image', labelText: 'Product Image'),

            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a Valid value';
              }
            },

          ),

          SizedBox(height: 16,),

          TextFormField(
            controller: _codeTEController,
            decoration: const InputDecoration(
                hintText: 'Product code', labelText: 'Product Code'),

            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a Valid value';
              }
            },
          ),

          SizedBox(height: 16,),

          TextFormField(
            controller: _quantityTEController,
            decoration: const InputDecoration(
                hintText: 'Quantity', labelText: 'Quantity'),

            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a Valid value';
              }
            },
          ),

          const SizedBox(height: 16),


          _inprogress ? CircularProgressIndicator() : ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
            ),
            onPressed: _onTapAddProductButton,
            child: const Text('Add Product'),
          )
        ],
      ),
    );
  }

  void _onTapAddProductButton() {
    if(_formKey.currentState!.validate()){

      addNewProduct();
    }
  }

  Future <void> addNewProduct() async{
    _inprogress = true;
    setState(() {});
  Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
  Map<String, dynamic> requestBody = {
    "ProductName": _productNameTEController.text,
    "ProductCode": _codeTEController.text,
    "Img": _imageTEController.text,
    "UnitPrice": _unitPriceTEController.text,
    "Qty": _quantityTEController.text,
    "TotalPrice": _totalPriceTEController.text,
  };

  Response response= await post(uri, headers: {
    "Content-type": "application/json"
  },
  body: jsonEncode(requestBody),
  );
  if(response.statusCode == 200){
   clearTextfield();
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('New Product Added')));
    
  }
  _inprogress = false;
  setState(() {});
  }

  void clearTextfield(){
    _productNameTEController.clear();
    _quantityTEController.clear();
    _totalPriceTEController.clear();
    _unitPriceTEController.clear();
    _imageTEController.clear();
    _codeTEController.clear();

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