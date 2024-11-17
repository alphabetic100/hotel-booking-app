import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/values/colors/colors.dart';
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
    return Scaffold(
      backgroundColor: ColorTheme.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AnimationAsset.splashLoading),
            Text(
              "Hotel Salauddin Max",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Find your stay, Your way",
              style: TextStyle(fontSize: 25, color: Colors.yellow),
            )
          ],
        ),
      ),
    );
  }
}
