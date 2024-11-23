import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/strings/app_strings.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_app_bar.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_text_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/email_text_field.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/or.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/pass_text_field.dart';
import 'package:hotel_booking_app/src/features/auth/sign-up/presentation/sign_up_screen.dart';
import 'package:hotel_booking_app/src/home/presentation/home_page.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: ColorTheme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
                    style: CustomStyle.blackTitleText,
                  ),
                  const HorizontalSpace(width: 10),
                  Text(
                    "Back",
                    style: CustomStyle.blueTitleText,
                  )
                ],
              ),
              const VerticalSpace(height: 20),
              Text(
                loginPageDes,
                style: CustomStyle.regularStyle,
                textAlign: TextAlign.center,
              ),
              const VerticalSpace(height: 30),
              const EmailTextField(),
              const VerticalSpace(height: 30),
              const PassTextField(),
              const VerticalSpace(height: 25),
              SizedBox(
                width: ScreenSize.width,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextButton(
                    title: "Forgot ?",
                    onTap: () {},
                  ),
                ),
              ),
              const VerticalSpace(height: 35),
              CustomButton(
                onTap: () {
                  //TODO: navigate to home page
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Center(
                  child: Text("Continue", style: CustomStyle.buttonTextStyl),
                ),
              ),
              const VerticalSpace(height: 20),
              const XOr(
                orTitle: "continue with",
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
              VerticalSpace(height: ScreenSize.height * 0.20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Does not have an account? "),
                  CustomTextButton(
                    title: "Singup",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
