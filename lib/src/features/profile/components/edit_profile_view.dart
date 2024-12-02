import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/profile/edit-profile/image_picker_service.dart';
import 'package:hotel_booking_app/src/features/profile/edit-profile/local-service/image_service.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });
  final double screenHeight;
  final double screenWidth;
  final ImagePickerService imagePickerService = Get.put(ImagePickerService());
  final ImageService service = ImageService();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.5,
      width: screenWidth,
      decoration: BoxDecoration(
        color: ColorTheme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth,
              child: Text(
                "Edit Profile Details",
                style: CustomStyle.titleStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const VerticalSpace(height: 10),
            Text(
              "enter the name",
              style: CustomStyle.yellowStyle,
            ),
            const VerticalSpace(height: 10),
            //to change user name
            TextField(
              keyboardType: TextInputType.name,
              onChanged: (value) {},
              onSubmitted: (value) {},
              decoration: InputDecoration(
                  hintText: "Name!",
                  hintStyle: CustomStyle.textFieldTitle,
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                    color: ColorTheme.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  )),
            ),
            const VerticalSpace(height: 10),
            Text(
              "Update your picture",
              style: CustomStyle.yellowStyle,
            ),
            const VerticalSpace(height: 10),
            // profile picture updater
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    //image from gallery
                    GestureDetector(
                      onTap: () async {
                        await imagePickerService.selectFromGallery();
                      },
                      child: Container(
                        height: 50,
                        width: ScreenSize.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: ColorTheme.white,
                          boxShadow: [
                            BoxShadow(
                              color: ColorTheme.blue.withOpacity(0.4),
                              blurRadius: 4,
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: ColorTheme.grey,
                            ),
                            Text(
                              "Gallery",
                              style: CustomStyle.regularStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                    const VerticalSpace(height: 15),
                    // Image from camera
                    GestureDetector(
                      onTap: () async {
                        await imagePickerService.takePhoto();
                      },
                      child: Container(
                        height: 50,
                        width: ScreenSize.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: ColorTheme.white,
                          boxShadow: [
                            BoxShadow(
                              color: ColorTheme.blue.withOpacity(0.4),
                              blurRadius: 4,
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.camera,
                              color: ColorTheme.grey,
                            ),
                            Text(
                              "Camera",
                              style: CustomStyle.regularStyle,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Obx(() {
                  return Container(
                    height: ScreenSize.height * 0.15,
                    width: ScreenSize.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.green,
                      image: imagePickerService.isLoading.value ||
                              imagePickerService.tempImagePath.value.isEmpty
                          ? null
                          : DecorationImage(
                              image: FileImage(
                                  File(imagePickerService.tempImagePath.value)),
                              fit: BoxFit.cover,
                            ),
                    ),
                    child: imagePickerService.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : null,
                  );
                }),
              ],
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                  onTap: () {
                    if (imagePickerService.tempImagePath.value.isNotEmpty) {
                      imagePickerService.saveImagePath(
                          imagePickerService.tempImagePath.value);
                      Get.back();
                    }
                  },
                  child: Center(
                    child: Text(
                      "Save",
                      style: CustomStyle.buttonTextStyl,
                    ),
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
