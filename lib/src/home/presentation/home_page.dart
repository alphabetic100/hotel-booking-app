import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/features/chats/view/chat_screen.dart';
import 'package:hotel_booking_app/src/features/favorites/view/favorites_screen.dart';
import 'package:hotel_booking_app/src/features/global/functions/fetch_profile_details.dart';
import 'package:hotel_booking_app/src/features/home/view/home_screen.dart';
import 'package:hotel_booking_app/src/features/all-rooms/view/all_rooms.dart';
import 'package:hotel_booking_app/src/features/profile/view/profile_screen.dart';
import 'package:hotel_booking_app/src/home/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:hotel_booking_app/src/home/controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController _pageController = Get.put(HomePageController());
  @override
  void initState() {
    fetchProfileDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.scaffoldBackgroundColor,
      bottomNavigationBar: CustomNavBar(),
      body: PageView(
        controller: _pageController.controller,
        onPageChanged: (value) => _pageController.pageChange(value),
        children: [
          const HomeScreen(),
          const FavoritesScreen(),
          const AllRooms(),
          const ChatScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
