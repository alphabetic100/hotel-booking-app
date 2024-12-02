import 'dart:io';

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
import 'package:hotel_booking_app/src/features/all-rooms/view/all_rooms.dart';
import 'package:hotel_booking_app/src/features/global/functions/clear_profile_data.dart';
import 'package:hotel_booking_app/src/features/global/functions/fetch_profile_details.dart';
import 'package:hotel_booking_app/src/features/profile/components/edit_profile_view.dart';
import 'package:hotel_booking_app/src/features/profile/components/recently_visited_screen.dart';
import 'package:hotel_booking_app/src/features/profile/edit-profile/image_picker_service.dart';
import 'package:hotel_booking_app/src/features/profile/edit-profile/local-service/image_service.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AuthService authService = AuthService();
  final ImagePickerService imagePickerService = Get.put(ImagePickerService());
  final ImageService imageService = ImageService();

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
                          profileData.data.name,
                          style: CustomStyle.whiteTitleStyle,
                        ),
                        const VerticalSpace(height: 5),
                        Text(
                          profileData.data.email,
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
                child: Obx(
                  () => Container(
                    height: ScreenSize.height * 0.15,
                    width: ScreenSize.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: ColorTheme.scaffoldBackgroundColor,
                      image: imagePickerService.imagePath.value.isEmpty
                          ? null
                          : DecorationImage(
                              image: FileImage(
                                  File(imagePickerService.imagePath.value)),
                              fit: BoxFit.cover,
                            ),
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
                )),
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

                        CustomTileButton(
                          width: ScreenSize.width,
                          title: "All Rooms",
                          prefixIcon: Icons.all_inclusive,
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const CustomDetailsPageMockup(
                                boady: AllRooms(),
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
                            Get.defaultDialog(
                              title: "Worning",
                              titleStyle: CustomStyle.redTitleStyle,
                              middleText: "Are you sure you want to log out?",
                              middleTextStyle: CustomStyle.regularStyle,
                              textCancel: "No",
                              textConfirm: "Yes",
                              onConfirm: () async {
                                authService.removeToken();
                                await imageService.removeToken();
                                clearProfileDetails();
                                Navigator.pushAndRemoveUntil(Get.context!,
                                    MaterialPageRoute(builder: (context) {
                                  return SignUpScreen(
                                    appbarBackButton: false,
                                  );
                                }), (route) => false);
                              },
                            );
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
