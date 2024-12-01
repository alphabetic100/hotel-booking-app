import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';
import 'package:hotel_booking_app/src/features/splash-screen/welcome_page.dart';
import 'package:hotel_booking_app/src/features/splash-screen/controller/splash_screen_controller.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenController _screenController =
      Get.put(SplashScreenController());
  final WelcomePage welcomePage = const WelcomePage();
  final AuthService authService = AuthService();

  @override
  void initState() {
    _screenController.simulateLoading();

    super.initState();
  }

  @override
  void dispose() {
    _screenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: ColorTheme.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: ScreenSize.width * 0.7,
                height: ScreenSize.height * 0.2,
                child: Lottie.asset(AnimationAsset.splashLoading)),
            const Text(
              "The Grand Haven",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: nunito,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Find your stay, Your way",
              style: CustomStyle.yellowStyle,
            )
          ],
        ),
      ),
    );
  }
}
