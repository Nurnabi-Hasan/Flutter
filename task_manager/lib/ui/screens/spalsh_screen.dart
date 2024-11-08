import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/controler/auth_controller.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';

import 'package:task_manager/ui/utils/asset_path.dart';

import '../widget/backgroud_Image.dart';
import 'main_bottom_navbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoNextScreen();
  }

  Future<void> gotoNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    await AuthController.getAccessToken();
    if (AuthController.isLoggedIn()) {
      await AuthController.getUserData();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const MainBottomNavbarScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BacgroundImage(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsPath.logoSvg,
            ),
          ],
        ),
      ),
    ));
  }
}
