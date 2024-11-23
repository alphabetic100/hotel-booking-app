import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/features/chats/view/chat_screen.dart';
import 'package:hotel_booking_app/src/features/favorites/view/favorites_screen.dart';
import 'package:hotel_booking_app/src/features/home/view/home_screen.dart';
import 'package:hotel_booking_app/src/features/my-bookings/view/my_bookings.dart';
import 'package:hotel_booking_app/src/features/profile/view/profile_screen.dart';
import 'package:hotel_booking_app/src/home/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:hotel_booking_app/src/home/controller/home_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomePageController _pageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.scaffoldBackgroundColor,
      bottomNavigationBar: CustomNavBar(),
      body: PageView(
        controller: _pageController.controller,
        onPageChanged: (value) => _pageController.pageChange(value),
        children: const [
          HomeScreen(),
          FavoritesScreen(),
          MyBookings(),
          ChatScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
