import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/controler/auth_controller.dart';
import 'package:task_manager/ui/widget/showscakmessage.dart';
import 'package:task_manager/ui/widget/tm_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;
  XFile? _selectedImage;

  TextEditingController _emailTEControler = TextEditingController();
  TextEditingController _fNameTEControler = TextEditingController();
  TextEditingController _lNameTEControler = TextEditingController();
  TextEditingController _phoneTEControler = TextEditingController();
  TextEditingController _passwordTEControler = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUserdata();
  }

  void setUserdata(){
    _emailTEControler.text = AuthController.userData?.email ?? '';
    _fNameTEControler.text = AuthController.userData?.firstName ?? '';
    _lNameTEControler.text = AuthController.userData?.lastName ?? '';
    _phoneTEControler.text = AuthController.userData?.mobile ?? '';
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_App_Bar(
        inProfileScreen: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48,),

                Text(
                    'Update Profile',
                    style: Theme
                        .of(context)
                        .textTheme
                        .displaySmall
                ),
                const SizedBox(height: 18,),

                _buildUpdateForm(),

              ]),
        ),
      ),
    );
  }

  Widget _buildUpdateForm() {
    return Form(
      key: _formKey,

      child: Column(
        children: [
          _buildPhotoPicker(),
      const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: false,
            controller: _emailTEControler,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 10,),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _fNameTEControler,
            decoration: const InputDecoration(
              hintText: 'Fast Name',
            ),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter First Name';
              }
              return null;
            },
          ),

          const SizedBox(height: 10,),

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _lNameTEControler,
            decoration: const InputDecoration(
              hintText: 'Last Name',
            ),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter Last Name';
              }
              return null;
            },
          ),

          const SizedBox(height: 10,),

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _phoneTEControler,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Phone',
            ),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter valid Phone';
              }
              return null;
            },
          ),

          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _passwordTEControler,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: _onTapUpdateButton,
            child: const Text('Update'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _onTapUpdateButton() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _updateProfile();

  }

  Widget _buildPhotoPicker() {
    return GestureDetector(
      onTap: pickImage,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              alignment: Alignment.center,
              child: const Text('Photo', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),),
            ),
            const SizedBox(width: 8),
            Text(_selectedImageTitle()),
          ],
        ),

      ),
    );
  }

  String _selectedImageTitle(){
    if(_selectedImage !=null){
      return _selectedImage!.name;
    }
    return 'Select Photo';
  }

  Future <void> pickImage()async{
    ImagePicker _imagePicker = ImagePicker();
    XFile? PickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(PickedImage !=null){
      _selectedImage= PickedImage;
      setState(() {});
    }
  }


  Future<void> _updateProfile() async {
    _inProgress = true;
    setState(() {});

    Map<String, dynamic> requstBody = {
      "email": _emailTEControler.text.trim(),
      "firstName": _fNameTEControler.text.trim(),
      "lastName": _lNameTEControler.text.trim(),
      "mobile": _phoneTEControler.text.trim(),

    };

    if(_passwordTEControler.text.isNotEmpty){
      requstBody["password"] = _passwordTEControler.text;
    }
    if(_selectedImage !=null){
      List<int> imageBytes = await _selectedImage!.readAsBytes();
      String convertedImage = base64Encode(imageBytes);
      requstBody["photo"] = convertedImage;
    }


    NetworkResponse response = await NetworkCaller.postProduct(
        url: Urls.UpdateProfile, body: requstBody);

    _inProgress = false;
    setState(() {});

    if (response.isSuccess) {

      showSnackMessage(context, 'Profile Updated Successfully');
    } else {
      showSnackMessage(context, response.errorMessage, true);
    }
  }

  @override
  void dispose() {
    _emailTEControler.dispose();
    _fNameTEControler.dispose();
    _lNameTEControler.dispose();
    _phoneTEControler.dispose();
    _passwordTEControler.dispose();
    super.dispose();
  }



}
