import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/email_verifcation_screen.dart';
import 'package:task_manager/ui/screens/set_password_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';

import 'package:task_manager/ui/utils/app_color.dart';
import 'package:task_manager/ui/widget/center-circular_progress_indicatore.dart';
import '../widget/backgroud_Image.dart';
import '../widget/showscakmessage.dart';

class OtpVerifcationScreen extends StatefulWidget {
  const OtpVerifcationScreen({super.key});

  static String? OTP;

  @override
  State<OtpVerifcationScreen> createState() => _OtpVerifcationScreenState();
}

class _OtpVerifcationScreenState extends State<OtpVerifcationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _verifyOTPInprogress =false;
  final TextEditingController _OTPTECOntroller = TextEditingController();

  String EmailAddress = EmailVerifcationScreen.emailAddress!;

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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
  }

  Widget _buildOtpVerificationForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          PinCodeTextField(
            controller: _OTPTECOntroller,
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

            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter Valid OTP';
              }
            },
          ),

          const SizedBox(height: 24),

          Visibility(
             visible: !_verifyOTPInprogress,
            replacement: CenteredCircularProgressIndicator(),
            child: ElevatedButton(
              onPressed: _onTapotpVerifyButton,
              child: const Text('Verify'),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _onTapotpVerifyButton() {
    if(_formKey.currentState!.validate()){
      _OtpVerify();
    }
  }

  Future <void> _OtpVerify()async{
    _verifyOTPInprogress = true;
    setState(() {});
    NetworkResponse response = await NetworkCaller.getProduct(url:Urls.VerifyOTP(EmailAddress, _OTPTECOntroller.text));
    OtpVerifcationScreen.OTP = _OTPTECOntroller.text;
    _verifyOTPInprogress = false;
    setState(() {});

    if(response.isSuccess){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SetPasswordScreen()));
    }else{
      showSnackMessage(context, response.errorMessage, true);
    }

  }


}
