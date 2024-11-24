import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_app_bar.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_text_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/email_text_field.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/or.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/pass_text_field.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/strings/app_strings.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/controllers/error_text_controller.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/controllers/validation_checker.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/presentation/log_in_screen.dart';
import 'package:hotel_booking_app/src/features/auth/sign-up/temp/sign_up_values.dart';
import 'package:hotel_booking_app/src/features/auth/verify-user/presentation/verify_user_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final LocalErrorTextController errorTextController =
      Get.put(LocalErrorTextController());


  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return SizedBox(
      height: ScreenSize.height,
      width: ScreenSize.width,
      child: Scaffold(
        appBar: const CustomAppBar(),
        backgroundColor: ColorTheme.scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create",
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
                  createAccuntDes,
                  style: CustomStyle.regularStyle,
                  textAlign: TextAlign.center,
                ),
                const VerticalSpace(height: 30),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: CustomStyle.textFieldTitle,
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        color: ColorTheme.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      )),
                ),
                const VerticalSpace(height: 30),
                //
                //Email Text Field
                EmailTextField(
                  onChanged: (String value) {
                    bool isValid = emailValidationChecker(value);
                    if (!isValid) {
                      errorTextController.emailErrorText.value =
                          "Enter a valid email address";
                    } else {
                      errorTextController.emailErrorText.value = "";
                      signupEmail = value;
                    }
                  },
                  onSubmitted: (String value) {
                    bool isValid = emailValidationChecker(value);
                    if (!isValid) {
                      errorTextController.emailErrorText.value =
                          "Enter a valid email address";
                    } else {
                      errorTextController.emailErrorText.value = "";
                      signupEmail = value;
                    }
                  },
                ),
                const VerticalSpace(height: 30),
                //
                //Password Text Field
                PassTextField(
                  onChanged: (String value) {
                    bool isValid = passwordValidationChecker(value);
                    if (!isValid) {
                      errorTextController.passwordErrorText.value =
                          "Enter a valid email address";
                    } else {
                      errorTextController.passwordErrorText.value = "";
                      signUpPass = value;
                    }
                  },
                  onSubmitted: (String value) {
                    bool isValid = passwordValidationChecker(value);
                    if (!isValid) {
                      errorTextController.passwordErrorText.value =
                          "The passwor must be a minumum lengh to 8";
                    } else {
                      errorTextController.passwordErrorText.value = "";
                      signUpPass = value;
                    }
                  },
                ),
                const VerticalSpace(height: 35),
                CustomButton(
                  onTap: ()  {
                    //TODO: create account logic
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VerifyUserScreen()));
                  },
                  child: Center(
                    child: Text("Continue", style: CustomStyle.buttonTextStyl),
                  ),
                ),
                const VerticalSpace(height: 20),
                const XOr(
                  orTitle: "signup with",
                ),
                const VerticalSpace(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        "https://i.pinimg.com/736x/39/21/6d/39216d73519bca962bd4a01f3e8f4a4b.jpg",
                      ),
                    ),
                    HorizontalSpace(width: 10),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/736x/fb/4c/fc/fb4cfc050d8ea70455dfe540b8f2b9a9.jpg"),
                    )
                  ],
                ),
                VerticalSpace(height: ScreenSize.height * 0.15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Allready have an account? "),
                    CustomTextButton(
                      title: "Login",
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LogInScreen()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
