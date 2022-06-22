import 'dart:async';

import 'package:ecomappv2/presentation/management/management_shelf.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    Navigator.of(context).pushReplacementNamed(Routes.onBoardRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
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
                color: ColorManager.darkGrey,
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
