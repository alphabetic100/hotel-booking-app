import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/controllers/error_text_controller.dart';

class EmailTextField extends StatelessWidget {
  EmailTextField({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
  });
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final LocalErrorTextController controller = Get.put(LocalErrorTextController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              errorText: controller.emailErrorText.value.isEmpty
                  ? null
                  : controller.emailErrorText.value,
              hintText: "Email Address",
              hintStyle: CustomStyle.textFieldTitle,
              prefixIcon: Icon(
                Icons.mail_outline,
                color: ColorTheme.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              )),
        ));
  }
}
