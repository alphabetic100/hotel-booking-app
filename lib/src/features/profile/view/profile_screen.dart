import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';
import 'package:hotel_booking_app/src/core/custom/common/custom_tile_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_details_page_mockup.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/auth/service/auth_service.dart';
import 'package:hotel_booking_app/src/features/auth/sign-up/presentation/sign_up_screen.dart';
import 'package:hotel_booking_app/src/features/favorites/view/favorites_screen.dart';
import 'package:hotel_booking_app/src/features/my-bookings/view/my_bookings.dart';
import 'package:hotel_booking_app/src/features/profile/components/edit_profile_view.dart';
import 'package:hotel_booking_app/src/features/profile/components/recently_visited_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      backgroundColor: ColorTheme.scaffoldBackgroundColor,
      body: SizedBox(
        height: ScreenSize.height,
        width: ScreenSize.width,
        child: Stack(
          children: [
            //top of the profile screen
            Positioned(
              child: Container(
                  height: ScreenSize.height * 0.3,
                  width: ScreenSize.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    color: ColorTheme.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Md Nazmlu Hasan",
                          style: CustomStyle.whiteTitleStyle,
                        ),
                        const VerticalSpace(height: 5),
                        Text(
                          "example@gmail.com",
                          style: CustomStyle.yellowStyle,
                        ),
                      ],
                    ),
                  )),
            ),
            // Profile Image Box
            Positioned(
              top: ScreenSize.height * 0.23,
              right: ScreenSize.width * 0.1,
              child: Container(
                height: ScreenSize.height * 0.15,
                width: ScreenSize.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: ColorTheme.scaffoldBackgroundColor,
                  // image: DecorationImage(
                  //     image: AssetImage("assets/images/image1.png"),
                  //     fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: ColorTheme.grey.withOpacity(0.2),
                      offset: const Offset(-1, -2),
                      spreadRadius: 3,
                      blurRadius: 7,
                    )
                  ],
                ),
              ),
            ),
            //Bottom part of Profile screen
            Positioned(
                top: ScreenSize.height * 0.38,
                bottom: 0,
                child: SizedBox(
                  width: ScreenSize.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Recently Visited Button
                        CustomTileButton(
                          width: ScreenSize.width,
                          title: "Recently visited",
                          prefixIcon: Icons.history,
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const CustomDetailsPageMockup(
                                boady: RecentlyVisitedScreen(),
                              );
                            }));
                          },
                        ),
                        // Favorite Button
                        CustomTileButton(
                          width: ScreenSize.width,
                          title: "Favorite",
                          prefixIcon: Icons.favorite_border,
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const CustomDetailsPageMockup(
                                boady: FavoritesScreen(),
                              );
                            }));
                          },
                        ),
                        //All Bookings Button
                        CustomTileButton(
                          width: ScreenSize.width,
                          title: "All bookings",
                          prefixIcon: Icons.all_inclusive,
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const CustomDetailsPageMockup(
                                boady: MyBookings(),
                              );
                            }));
                          },
                        ),
                        // Edit Profile Button
                        CustomTileButton(
                          tileColor: ColorTheme.blue,
                          width: ScreenSize.width,
                          title: "Edit profile details",
                          iconColor: ColorTheme.white,
                          textStyle: TextStyle(
                            color: ColorTheme.white,
                            fontFamily: openSans,
                          ),
                          prefixIcon: Icons.edit,
                          onTap: () {
                            Get.bottomSheet(EditProfileView(
                              screenHeight: ScreenSize.height,
                              screenWidth: ScreenSize.width,
                            ));
                          },
                        ),
                        // LogOut Button
                        CustomTileButton(
                          tileColor: Colors.red,
                          height: 40,
                          width: ScreenSize.width * 0.4,
                          title: "Log out",
                          iconColor: ColorTheme.white,
                          textStyle: TextStyle(
                            color: ColorTheme.white,
                            fontFamily: openSans,
                          ),
                          prefixIcon: Icons.logout,
                          onTap: () {
                            authService.removeToken();
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUpScreen();
                            }), (route) => false);
                          },
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
