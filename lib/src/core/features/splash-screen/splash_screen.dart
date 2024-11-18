import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
              "Hotel Salauddin Max",
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
