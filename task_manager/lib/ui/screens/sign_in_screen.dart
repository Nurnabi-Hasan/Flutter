import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/login_model.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/controler/auth_controller.dart';
import 'package:task_manager/ui/screens/main_bottom_navbar_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/utils/app_color.dart';
import 'package:task_manager/ui/widget/showscakmessage.dart';
import '../widget/backgroud_Image.dart';
import 'email_verifcation_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  
  final GlobalKey <FormState> _formkey = GlobalKey <FormState> (); 
  
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  
  bool _inProgress = false;
  
  
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: BacgroundImage(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get Sterted With',
                    style: textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  _buildSignInForm(),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: _onTapForgotPassword,
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey),
                            )),
                        _buildSignupSection()
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ));
  }

  void _onTapForgotPassword() {
    Navigator.push(context,
        MaterialPageRoute(builder: (contex) => const EmailVerifcationScreen()));
  }

  Widget _buildSignupSection() {
    return RichText(
        text: TextSpan(
            text: "Don't have an Account? ",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            children: [
          TextSpan(
            text: 'Sign Up',
            style: const TextStyle(color: AppColors.themeColor),
            recognizer: TapGestureRecognizer()..onTap = _ontapSingnUpScreen,
          )
        ]));
  }

  void _ontapSingnUpScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        ));
  }

  Widget _buildSignInForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter Valid Email';
              }
            },

          ),

          const SizedBox(height: 10),

          TextFormField(
            controller: _passwordTEController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter Valid Password';
             }
            },
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: _onTapLoginButton,
            child: const Text('Login'),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  void _onTapLoginButton() {
    
    if(!_formkey.currentState!.validate()){
      return;
    }
    _signIn();

  }
  
  
  Future<void> _signIn()async{
    _inProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "email":_emailTEController.text.trim(),
      "password":_passwordTEController.text
    };

    final NetworkResponse response =await NetworkCaller.postProduct(url: Urls.Login, body:requestBody);
    _inProgress = false;
    setState(() {});

    if(response.isSuccess){
      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      await AuthController.saveAccessToken(loginModel.token!);
      await AuthController.saveUserdata(loginModel.data!);


      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainBottomNavbarScreen()),
              (predicate) => false);
    }
      else{
        showSnackMessage(context, response.errorMessage, true);
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
  
  
}
