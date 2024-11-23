import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  var remainingTime = 120.obs;
  Timer? _timer;
  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  void reStartTimer() {
    _timer?.cancel();
    remainingTime.value = 120;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        _timer?.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
