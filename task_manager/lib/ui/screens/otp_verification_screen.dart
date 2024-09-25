import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/set_password_screen.dart';
import 'package:task_manager/ui/utils/app_color.dart';
import '../widget/backgroud_Image.dart';

class OtpVerifcationScreen extends StatefulWidget {
  const OtpVerifcationScreen({super.key});

  @override
  State<OtpVerifcationScreen> createState() => _OtpVerifcationScreenState();
}

class _OtpVerifcationScreenState extends State<OtpVerifcationScreen> {
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
                        'Pin Verification',
                        style: textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'A 6 digit veification pin will send your  Mail address',
                        style: textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w400),

                      ),
                      const SizedBox( height: 18,),

                      _buildOtpVerificationForm(),

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

  Widget _buildOtpVerificationForm() {
    return Column(
      children: [
        PinCodeTextField(
          length: 6,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          appContext: context,
        ),

        const SizedBox(height: 24),

        ElevatedButton(
          onPressed: _onTapotpVerifyButton,
          child: const Text('Verify'),
        ),
        const SizedBox(height: 16),

      ],
    );
  }

  void _onTapotpVerifyButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SetPasswordScreen()));
  }
}
