import 'package:ecomappv2/presentation/management/color_management.dart';
import 'package:ecomappv2/presentation/management/image_management.dart';
import 'package:ecomappv2/presentation/management/management_shelf.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const Center(
              child: Image(
                image: AssetImage(ImageManagement.appLogo),
              ),
            ),
            Text(
              "data",
              style: getRegularStyle(
                color: ColorManager.primary,
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
