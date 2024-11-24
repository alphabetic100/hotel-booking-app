import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';
import 'package:hotel_booking_app/src/features/splash-screen/welcome_page.dart';
import 'package:hotel_booking_app/src/home/presentation/home_page.dart';

class AuthChecker extends StatelessWidget {
  AuthChecker({super.key});
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: authService.isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: ColorTheme.scaffoldBackgroundColor,
            body: Center(
                child: CircularProgressIndicator(
              color: ColorTheme.blue,
            )),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text("An error occurred"));
        } else if (snapshot.hasData && snapshot.data == true) {
          return HomePage();
        } else {
          return const WelcomePage();
        }
      },
    );
  }
}
