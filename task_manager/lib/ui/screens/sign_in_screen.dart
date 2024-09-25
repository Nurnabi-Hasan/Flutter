import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/utils/app_color.dart';
import '../widget/backgroud_Image.dart';
import 'email_verifcation_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
    Navigator.push(context, MaterialPageRoute(builder: (contex)=> EmailVerifcationScreen()));
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

  void _ontapSingnUpScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen(),));
  }


  Widget _buildSignInForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Password',
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: _onTapLoginButton,
          child: const Text('Login'),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }

  void _onTapLoginButton() {
    //TODO: implement login page
  }
}
