import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/utils/asset_path.dart';

class BacgroundImage extends StatelessWidget {
  BacgroundImage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(AssetsPath.backgroundSvg,
         // height: screenSize.height,
            //width: screenSize.width,
          fit:BoxFit.cover),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
