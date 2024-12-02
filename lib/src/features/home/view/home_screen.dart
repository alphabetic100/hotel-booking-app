import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/home/components/date-picker/controller/date_picker_controller.dart';
import 'package:hotel_booking_app/src/features/home/components/date-picker/view/check-in-and-out/Check_in_and_out.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/view/searched_room_screen.dart';
import 'package:hotel_booking_app/src/features/home/controller/guest_and_room_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GuestAndRoomController _guestAndRoomController =
      Get.put(GuestAndRoomController());

  final DatePickerController datePickerController =
      Get.put(DatePickerController());

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
            Positioned(
              top: 0,
              child: Container(
                height: ScreenSize.height * 0.4,
                width: ScreenSize.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/image5.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: ScreenSize.height * 0.6,
                width: ScreenSize.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpace(height: 20),
                        Text(
                          "Welcome to your next",
                          style: CustomStyle.titleStyle,
                        ),
                        Text(
                          "Adventure!",
                          style: CustomStyle.titleStyle,
                        ),
                        const VerticalSpace(height: 20),
                        Text(
                          "Discover the Perfect Stay with WanderStay",
                          style: CustomStyle.yellowStyle,
                        ),
                        const VerticalSpace(height: 25),
                        const Text(
                          "Where?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // Location Selection Text Field Here
                        //
                        Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextField(
                              onChanged: (value) {},
                              onSubmitted: (value) {},
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                  hintText: "EX: Dhaka",
                                  hintStyle: CustomStyle.textFieldTitle,
                                  prefixIcon: Icon(
                                    Icons.location_on_outlined,
                                    color: ColorTheme.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  )),
                            )),
                        //Check in Check out
                        CheckInAndOut(),
                        const VerticalSpace(height: 20),
                        // select Guests And Room
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Guests",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const VerticalSpace(height: 10),
                                Obx(() {
                                  return SizedBox(
                                    width: ScreenSize.width * 0.4,
                                    //Room
                                    child: TextField(
                                      onChanged: (value) {
                                        try {
                                          int temp = int.parse(value);
                                          _guestAndRoomController.guests.value =
                                              temp;
                                        } catch (e) {
                                          _guestAndRoomController.guests.value =
                                              1;
                                        }
                                      },
                                      controller:
                                          _guestAndRoomController.gController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(2),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          prefixIcon: GestureDetector(
                                            onTap: () {
                                              _guestAndRoomController
                                                  .guestDecrement();
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: ColorTheme.grey,
                                            ),
                                          ),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              _guestAndRoomController
                                                  .guestIncrement();
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: ColorTheme.grey,
                                            ),
                                          ),
                                          hintText:
                                              "${_guestAndRoomController.guests.value}",
                                          hintStyle: CustomStyle.textFieldTitle,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          )),
                                    ),
                                  );
                                })
                              ],
                            ),
                            //rooms
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Room",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const VerticalSpace(height: 10),
                                Obx(() {
                                  return SizedBox(
                                    width: ScreenSize.width * 0.4,
                                    //Room
                                    child: TextField(
                                      onChanged: (value) {
                                        try {
                                          int temp = int.parse(value);
                                          _guestAndRoomController.room.value =
                                              temp;
                                        } catch (e) {
                                          _guestAndRoomController.room.value =
                                              1;
                                        }
                                      },
                                      controller:
                                          _guestAndRoomController.rController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(2),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          prefixIcon: GestureDetector(
                                            onTap: () {
                                              _guestAndRoomController
                                                  .roomDecrement();
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: ColorTheme.grey,
                                            ),
                                          ),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              _guestAndRoomController
                                                  .roomIncrement();
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: ColorTheme.grey,
                                            ),
                                          ),
                                          hintText:
                                              "${_guestAndRoomController.room.value}",
                                          hintStyle: CustomStyle.textFieldTitle,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          )),
                                    ),
                                  );
                                })
                              ],
                            ),
                          ],
                        ),
                        const VerticalSpace(height: 20),
                        CustomButton(
                            onTap: () {
                              if (datePickerController.checkInDate.value !=
                                      "DD/MM/YY" &&
                                  datePickerController.checkOutDate.value !=
                                      "DD/MM/YY" &&
                                  datePickerController.checkInDate.value !=
                                      datePickerController.checkOutDate.value) {
                                String checkIn = datePickerController
                                    .checkInDate.value
                                    .replaceAll("/", "-");
                                String checkOut = datePickerController
                                    .checkOutDate.value
                                    .replaceAll("/", "-");
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SearchedRoomScreen(
                                          checkIn: checkIn,
                                          checkOut: checkOut,
                                        )));
                              } else {
                                String errorMassage = "";
                                if (datePickerController.checkInDate.value ==
                                    datePickerController.checkInDate.value) {
                                  errorMassage =
                                      "Check-in and check-out date is not valid, please select some valid data";
                                }
                                Get.defaultDialog(
                                  title: "Error",
                                  titleStyle:
                                      const TextStyle(color: Colors.red),
                                  middleText: errorMassage,
                                  onConfirm: () {
                                    Get.back();
                                  },
                                );
                              }
                            },
                            child: Center(
                              child: Text(
                                "FIND",
                                style: CustomStyle.buttonTextStyl,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
