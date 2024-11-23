import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  RxBool isLoading = true.obs;
  Future<void> simulateLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
  }
}
