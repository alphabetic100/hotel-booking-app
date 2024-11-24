import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/themes/app_theme.dart';
import 'package:hotel_booking_app/src/features/splash-screen/splash_screen.dart';

void main()  {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.themeData,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
