import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/home/controller/home_page_controller.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});
  final HomePageController _pageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => GNav(
            selectedIndex: _pageController.currentPage.value,
            onTabChange: (value) => _pageController.jumpInto(value),
            iconSize: 20,
            textSize: 15,
            activeColor: ColorTheme.blue,
            padding:
                const EdgeInsets.only(top: 20, bottom: 30, left: 10, right: 10),
            style: GnavStyle.oldSchool,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                iconColor: ColorTheme.grey,
                text: "Home",
                textStyle: CustomStyle.titleStyle,
              ),
              GButton(
                icon: Icons.favorite_border_outlined,
                iconColor: ColorTheme.grey,
                text: "Favorite",
                textStyle: CustomStyle.titleStyle,
              ),
              GButton(
                icon: Icons.home_outlined,
                iconColor: ColorTheme.grey,
                text: '''My Bookings''',
                textStyle: CustomStyle.titleStyle,
              ),
              GButton(
                icon: Icons.chat_outlined,
                iconColor: ColorTheme.grey,
                text: "Chats",
                textStyle: CustomStyle.titleStyle,
              ),
              GButton(
                icon: Icons.person_outline,
                iconColor: ColorTheme.grey,
                text: "Profile",
                textStyle: CustomStyle.titleStyle,
              )
            ]));
  }
}
