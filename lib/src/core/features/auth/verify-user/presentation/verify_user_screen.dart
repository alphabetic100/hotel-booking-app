import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/strings/app_strings.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_app_bar.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_text_button.dart';
import 'package:hotel_booking_app/src/core/features/auth/verify-user/components/custom-number-keyboard/view/custom_number_keyboard.dart';
import 'package:hotel_booking_app/src/core/features/auth/verify-user/components/resend-timer/controller/timer_controller.dart';
import 'package:hotel_booking_app/src/core/features/auth/verify-user/components/resend-timer/view/resend_timer.dart';
import 'package:hotel_booking_app/src/core/features/auth/verify-user/components/verification-text-field/verification_text_field.dart';

class VerifyUserScreen extends StatelessWidget {
  VerifyUserScreen({super.key});
  final TimerController _timerController = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorTheme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: SizedBox(
        height: double.maxFinite,
        width: ScreenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Verification interface here
            SizedBox(
              height: ScreenSize.height * 0.5,
              width: ScreenSize.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Verify",
                        style: CustomStyle.blackTitleText,
                      ),
                      const HorizontalSpace(width: 10),
                      Text(
                        "Account",
                        style: CustomStyle.blueTitleText,
                      )
                    ],
                  ),
                  const VerticalSpace(height: 20),
                  Text(
                    verifyDescription,
                    style: CustomStyle.regularStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "example@gamil.com",
                    style: CustomStyle.regularStyle,
                    textAlign: TextAlign.center,
                  ),
                  const VerticalSpace(height: 30),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: VerificationTextField(),
                  ),
                  const VerticalSpace(height: 20),
                  ResendTimer(),
                  const VerticalSpace(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't recive code? "),
                      CustomTextButton(
                        title: "Resend again",
                        onTap: () {
                          if (_timerController.remainingTime.value > 0) {
                          } else {
                            _timerController.reStartTimer();
                          }
                        },
                      )
                    ],
                  ),
                  const VerticalSpace(height: 30),
                  CustomButton(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Verify",
                          style: CustomStyle.buttonTextStyl,
                        ),
                      )),
                ],
              ),
            ),
            //Custom Keyboard
            SizedBox(
              height: ScreenSize.height * 0.4,
              width: ScreenSize.width,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: CustomNumberKeyboard()),
            ),
          ],
        ),
      ),
    );
  }
}
