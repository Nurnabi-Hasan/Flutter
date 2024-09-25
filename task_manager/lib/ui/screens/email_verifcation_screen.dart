import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/ui/screens/otp_verification_screen.dart';
import 'package:task_manager/ui/utils/app_color.dart';
import '../widget/backgroud_Image.dart';

class EmailVerifcationScreen extends StatefulWidget {
  const EmailVerifcationScreen({super.key});

  @override
  State<EmailVerifcationScreen> createState() => _EmailVerifcationScreenState();
}

class _EmailVerifcationScreenState extends State<EmailVerifcationScreen> {
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
                        'Your Email Address',
                        style: textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'A 6 digit veification pin will send your  Mail address',
                        style: textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w400),

                      ),
                      const SizedBox( height: 18,),

                      _buildEmailVerificationForm(),

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

  Widget _buildEmailVerificationForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
        ),

        const SizedBox(height: 24),

        ElevatedButton(
          onPressed: _onTapVerifyEmailButton,
          child: const Text('Next'),
        ),
        const SizedBox(height: 16),

      ],
    );
  }

  void _onTapVerifyEmailButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpVerifcationScreen()));
  }
}
