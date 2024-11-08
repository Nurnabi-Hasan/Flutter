import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/controler/auth_controller.dart';
import '../screens/sign_in_screen.dart';
import '../screens/update_profile_screen.dart';
import '../utils/app_color.dart';

class TM_App_Bar extends StatelessWidget implements PreferredSizeWidget {
  const TM_App_Bar({
    super.key, this.inProfileScreen = false,
  });
final bool inProfileScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(inProfileScreen == true){
          return ;
        }

        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen()));
      },
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.themeColor,
        title: Row(
          children: [
            const CircleAvatar(radius: 24,),
            const SizedBox(width: 16),
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthController.userData?.fullName ?? '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    AuthController.userData?.email ?? '',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () async{
                 await AuthController.clearUserData();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const SignInScreen()),
                          (predicate) => false);
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}