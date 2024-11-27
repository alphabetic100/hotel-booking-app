import 'package:get/get.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';
import 'package:hotel_booking_app/src/features/splash-screen/welcome_page.dart';
import 'package:hotel_booking_app/src/home/presentation/home_page.dart';

class SplashScreenController extends GetxController {
  final AuthService authService = AuthService();
  Future<void> simulateLoading() async {
    bool islogedIn = await authService.isLoggedIn();
    await Future.delayed(const Duration(seconds: 3), () {
      if (islogedIn) {
        Get.to(() => const HomePage());
      } else {
        Get.to(() => const WelcomePage());
      }
    });
  }
}
