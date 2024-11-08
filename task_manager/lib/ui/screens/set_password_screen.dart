import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/otp_verification_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/app_color.dart';
import 'package:task_manager/ui/widget/center-circular_progress_indicatore.dart';
import 'package:task_manager/ui/widget/showscakmessage.dart';
import '../widget/backgroud_Image.dart';
import 'email_verifcation_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  String EmailAddress = EmailVerifcationScreen.emailAddress!;
  String Otp = OtpVerifcationScreen.OTP!;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _setPasswordInprogress =false;
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEcontroller = TextEditingController();

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
                        'Set Password',
                        style: textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Set 8 Digit Password',
                        style: textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w400),

                      ),
                      const SizedBox( height: 18,),

                      _buildSetPasswordForm(),

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

  Widget _buildSetPasswordForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _passwordTEController,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter Password';
              }
            },
          ),

          const SizedBox(height: 10),

          TextFormField(
            controller: _confirmPasswordTEcontroller,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintText: 'Confirm Password',
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter Password';
              }
            },
          ),
          const SizedBox(height: 24),

          Visibility(
            visible: !_setPasswordInprogress,
            replacement: CenteredCircularProgressIndicator(),
            child: ElevatedButton(
              onPressed: _onTapSetPasswordButton,
              child: const Text('Confirm'),
            ),
          ),
          const SizedBox(height: 16),

        ],
      ),
    );
  }

  void _onTapSetPasswordButton() {
  if(_formKey.currentState!.validate()){
    _setPassword();
  }
  }

  Future<void> _setPassword()async{
    _setPasswordInprogress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "email":EmailAddress,
      "OTP": Otp,
      "password":_confirmPasswordTEcontroller.text
    };


    final NetworkResponse response =await NetworkCaller.postProduct(url: Urls.SetPassword, body:requestBody);
    _setPasswordInprogress = false;
    setState(() {});

    if(response.isSuccess){
      _clearTextFields();
      showSnackMessage(context, 'Password Changed');
    }
    else{
      showSnackMessage(context, response.errorMessage, true);
    }
  }
  void _clearTextFields() {
    _confirmPasswordTEcontroller.clear();
    _passwordTEController.clear();
  }

  @override
  void dispose() {
    _confirmPasswordTEcontroller.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

}
