import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/features/auth/log-in/presentation/log_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: themeData,
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}
