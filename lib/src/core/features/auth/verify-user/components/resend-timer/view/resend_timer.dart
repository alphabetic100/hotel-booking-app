import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/features/auth/verify-user/components/resend-timer/controller/timer_controller.dart';

class ResendTimer extends StatelessWidget {
  ResendTimer({super.key});
  final TimerController _controller = Get.put(TimerController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int minutes = _controller.remainingTime.value ~/ 60;
      int seconds = _controller.remainingTime.value % 60;
      return Text(
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
        style: CustomStyle.blackTitleText,
      );
    });
  }
}
