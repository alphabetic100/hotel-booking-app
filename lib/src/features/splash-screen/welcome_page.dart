import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/strings/app_strings.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_text_button.dart';
import 'package:hotel_booking_app/src/features/auth/log-in/presentation/log_in_screen.dart';
import 'package:hotel_booking_app/src/features/auth/sign-up/presentation/sign_up_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: ColorTheme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: ScreenSize.height * 0.05,
            right: -40,
            child: Transform.rotate(
              angle: pi * 18,
              child: Container(
                height: ScreenSize.height * 0.2,
                width: ScreenSize.height * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorTheme.yellow,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Transform.rotate(
                    angle: pi * -18,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorTheme.blue,
                          image: const DecorationImage(
                              image: AssetImage("assets/images/image1.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: ScreenSize.height * 0.5,
            left: -40,
            child: Transform.rotate(
              angle: -18,
              child: Container(
                height: ScreenSize.height * 0.2,
                width: ScreenSize.height * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorTheme.yellow,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Transform.rotate(
                    angle: 18,
                    child: Container(
                        decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorTheme.blue,
                      image: const DecorationImage(
                          image: AssetImage("assets/images/image2.png"),
                          fit: BoxFit.cover),
                    )),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: ScreenSize.height * 0.25,
            left: ScreenSize.width * 0.2,
            right: ScreenSize.width * 0.15,
            child: ClipOval(
              child: Container(
                height: ScreenSize.height * 0.3,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/images/welcome.png"),
                      fit: BoxFit.cover),
                  color: ColorTheme.blue,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              child: SizedBox(
                width: ScreenSize.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        welcomeTitle,
                        style: CustomStyle.titleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const VerticalSpace(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        welcomeDescription,
                        style: CustomStyle.regularStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const VerticalSpace(height: 20),
                    CustomButton(
                        onTap: () {
                          //TODO: check user is allready loged in or not
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                        },
                        child: Center(
                          child: Text(
                            "Start Exploring",
                            style: CustomStyle.buttonTextStyl,
                          ),
                        )),
                    const VerticalSpace(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Allready have an account? "),
                        CustomTextButton(
                          title: "Login",
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LogInScreen()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
