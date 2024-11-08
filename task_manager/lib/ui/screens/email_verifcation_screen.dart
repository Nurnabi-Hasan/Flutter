import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/otp_verification_screen.dart';
import 'package:task_manager/ui/utils/app_color.dart';
import 'package:task_manager/ui/widget/showscakmessage.dart';
import '../widget/backgroud_Image.dart';

class EmailVerifcationScreen extends StatefulWidget {
  const EmailVerifcationScreen({super.key});

  static String? emailAddress;

  @override
  State<EmailVerifcationScreen> createState() => _EmailVerifcationScreenState();
}

class _EmailVerifcationScreenState extends State<EmailVerifcationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _verifyemailInprogress =false;
  final TextEditingController _emailTECOntroller = TextEditingController();


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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            controller: _emailTECOntroller,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            validator: (String? value){
              if(value?.isEmpty ?? true){
                return 'Enter Valid Email';
              }
            },
          ),
          const SizedBox(height: 24),

          Visibility(
            visible: !_verifyemailInprogress,
            replacement: CircularProgressIndicator(),
            child: ElevatedButton(
              onPressed: _onTapVerifyEmailButton,
              child: const Text('Next'),
            ),
          ),
          const SizedBox(height: 16),

        ],
      ),
    );
  }

  void _onTapVerifyEmailButton() {
    if(_formKey.currentState!.validate()){
      _emailVerify();
    }

    //Navigator.push(context, MaterialPageRoute(builder: (context)=> const OtpVerifcationScreen()));
  }

    Future <void> _emailVerify()async{
    _verifyemailInprogress = true;
    setState(() {});
     NetworkResponse response = await NetworkCaller.getProduct(url:Urls.VerifyEmail(_emailTECOntroller.text.trim()));
     EmailVerifcationScreen.emailAddress = _emailTECOntroller.text.trim();
     _verifyemailInprogress = false;
     setState(() {});
     
     if(response.isSuccess){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OtpVerifcationScreen()));
     }else{
       showSnackMessage(context, response.errorMessage, true);
    }
    
}
  @override
  void dispose() {
    _emailTECOntroller.dispose();
    super.dispose();
  }

}
