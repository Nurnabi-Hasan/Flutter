import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/ui/utils/app_color.dart';
import '../widget/backgroud_Image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                        'Join With Us',
                        style: textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox( height: 18,),

                      _buildSignUpForm(),

                      Center(
                        child: Column(
                          children: [
                            _buildSignInSection()
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }

  Widget _buildSignInSection() {
    return RichText(
        text: TextSpan(
            text: "Already have an Account? ",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: 'Sign In',
                style: const TextStyle(color: AppColors.themeColor),
                recognizer: TapGestureRecognizer()..onTap = _onTapSignInScreen,
              )
            ]));
  }

  void _onTapSignInScreen(){
    Navigator.pop(context);
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
        ),
        const SizedBox(height: 10,),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Fast Name',
          ),
        ),

        const SizedBox(height: 10,),

        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Last Name',
          ),
        ),

        const SizedBox(height: 10,),

        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Phone',
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

        const SizedBox(height: 24),

        ElevatedButton(
          onPressed: _onTapSignUpButton,
          child: const Text('Sign Up'),
        ),
        const SizedBox(height: 16),

      ],
    );
  }

  void _onTapSignUpButton() {
    //TODO: implement singup page
  }
}
