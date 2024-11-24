import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/controllers/error_text_controller.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/controllers/hide_pass_controller.dart';

class PassTextField extends StatelessWidget {
  PassTextField({
    super.key,
    required this.onChanged,
    required this.onSubmitted,
  });
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final LocalErrorTextController controller = Get.put(LocalErrorTextController());
  final HidePassController hidePass = Get.put(HidePassController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          keyboardType: TextInputType.emailAddress,
          obscureText: hidePass.hidePassword.value,
          decoration: InputDecoration(
              errorText: controller.passwordErrorText.value.isEmpty
                  ? null
                  : controller.passwordErrorText.value,
              hintText: "Password",
              hintStyle: CustomStyle.textFieldTitle,
              prefixIcon: Transform.rotate(
                angle: pi * 0.7,
                child: Icon(
                  Icons.key_outlined,
                  color: ColorTheme.grey,
                ),
              ),
              suffixIcon: Obx(
                () => GestureDetector(
                    onTap: () => hidePass.hidePassword.value =
                        !hidePass.hidePassword.value,
                    child: hidePass.hidePassword.value
                        ? Icon(
                            Icons.visibility_off_outlined,
                            color: ColorTheme.grey,
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: ColorTheme.grey,
                          )),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              )),
        ));
  }
}
