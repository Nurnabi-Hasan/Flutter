import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class addNewProductScreen extends StatefulWidget {
  final Map? editList ;

  const addNewProductScreen({
    super.key,this.editList,
  });

  @override
  State<addNewProductScreen> createState() => _addNewProductScreenState();
}

class _addNewProductScreenState extends State<addNewProductScreen> {
  final TextEditingController _productNameTEController =  TextEditingController();
  final TextEditingController _productCodeTEController =  TextEditingController();
  final TextEditingController _productQtyTEController = TextEditingController();
  final TextEditingController _productUnitPriceTEController =  TextEditingController();
  final TextEditingController _productTotalPriceTEController =  TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inprogress = false;
  bool _isEdit = false;



  @override
  void initState() {
    super.initState();

    final editList = widget.editList;
      if(editList != null){
        _isEdit = true;
        final productname = editList['ProductName'];
        final productcode = editList['ProductCode'];
        final productquantity = editList['Qty'];
        final unitprice = editList['UnitPrice'];
        final totalprice = editList['TotalPrice'];

        _productNameTEController.text = productname;
        _productCodeTEController.text = productcode;
        _productQtyTEController.text = productquantity;
        _productUnitPriceTEController.text = unitprice;
        _productTotalPriceTEController.text = totalprice;
      }



  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(
            _isEdit?'Edit Product':'Add New Product'),
        titleSpacing: 20,
        elevation: 20,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildForm(),
        ),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
              controller: _productNameTEController,
              decoration: InputDecoration(
                label: Text('Product Name'),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a Valid value';
                }
              }),
          SizedBox(
            height: 8,
          ),
          TextFormField(
              controller: _productCodeTEController,
              decoration: InputDecoration(
                label: Text('Product Code'),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a Valid value';
                }
              }),
          SizedBox(
            height: 8,
          ),
          TextFormField(
              controller: _productQtyTEController,
              decoration: InputDecoration(
                label: Text('Quantity'),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a Valid value';
                }
              }),
          SizedBox(
            height: 8,
          ),
          TextFormField(
              controller: _productUnitPriceTEController,
              decoration: InputDecoration(
                label: Text('Unit Price'),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a Valid value';
                }
              }),
          SizedBox(
            height: 8,
          ),
          TextFormField(
              controller: _productTotalPriceTEController,
              decoration: InputDecoration(
                label: Text('Total Price'),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Enter a Valid value';
                }
              }),
          SizedBox(
            height: 16,
          ),
          _inprogress ? CircularProgressIndicator(color: Colors.blue.shade800,) : ElevatedButton(
            onPressed: _isEdit? onTapEditproduct : onTapAddProduct,
            child: Text(
                _isEdit?'Update' : 'Add Product'),
          ),
        ],
      ),
    );
  }

  void onTapAddProduct() {
    if (_formKey.currentState!.validate()) {
          addProduct();
    }
  }
  Future <void> addProduct()async {
    _inprogress = true;
    setState(() {});

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');

    Map<String, dynamic> requestBody = {

      "ProductName": _productNameTEController.text,
      "ProductCode": _productCodeTEController.text,
      "UnitPrice": _productUnitPriceTEController.text,
      "Qty": _productQtyTEController.text,
      "TotalPrice": _productTotalPriceTEController.text,
    };

    Response response = await post(uri,headers: {
      "Content-type": "application/json"
    },
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);

    if(response.statusCode == 200){
     clearTextfield();
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('New Product Added')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('an error occurred',style: TextStyle(color:  Colors.red.shade800),)));
    }
    _inprogress =false;
    setState(() {});
  }

  void onTapEditproduct() {
    if (_formKey.currentState!.validate()) {
      editProduct();
    }
  }
  Future <void> editProduct()async {
    _inprogress = true;
    setState(() {});

    final editlist = widget.editList;
    if(editlist == null){
      return ;
    }
    final id = editlist['_id'];

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/UpdateProduct/$id');

    Map<String, dynamic> requestBody = {
      "ProductName": _productNameTEController.text,
      "ProductCode": _productCodeTEController.text,
      "UnitPrice": _productUnitPriceTEController.text,
      "Qty": _productQtyTEController.text,
      "TotalPrice": _productTotalPriceTEController.text,
    };

    Response response = await post(uri,headers: {
      "Content-type": "application/json"
    },
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);

    if(response.statusCode == 200){
      clearTextfield();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product Updated')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('an error occurred',style: TextStyle(color:  Colors.red.shade800),)));
    }
    _inprogress =false;
    setState(() {});
  }


  void clearTextfield(){
    _productNameTEController.clear();
    _productCodeTEController.clear();
    _productQtyTEController.clear();
    _productUnitPriceTEController.clear();
    _productTotalPriceTEController.clear();
  }

  @override
  void dispose() {
    _productNameTEController.dispose();
    _productCodeTEController.dispose();
    _productQtyTEController.dispose();
    _productUnitPriceTEController.dispose();
    _productTotalPriceTEController.dispose();
    super.dispose();
  }
}
