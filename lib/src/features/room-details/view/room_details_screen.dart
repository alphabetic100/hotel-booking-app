import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_app_bar.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/core/custom/custom_tile_widget.dart';
import 'package:hotel_booking_app/src/features/booking/presentation/booking_summary.dart';
import 'package:hotel_booking_app/src/features/home/components/date-picker/controller/date_picker_controller.dart';
import 'package:hotel_booking_app/src/features/home/controller/guest_and_room_controller.dart';
import 'package:hotel_booking_app/src/features/room-details/controller/detail_loading_controller.dart';
import 'package:hotel_booking_app/src/features/room-details/service/model/room_details.dart';
import 'package:hotel_booking_app/src/features/room-details/service/room_details_service.dart';

class RoomDetailsScreen extends StatefulWidget {
  const RoomDetailsScreen(
      {super.key, required this.roomNumber, required this.image});
  final String roomNumber;
  final String image;

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  final RoomDetailsService service = RoomDetailsService();
  final DetailLoadingController loadingController =
      Get.put(DetailLoadingController());
  final GuestAndRoomController guestAndRoomController =
      GuestAndRoomController();
  final DatePickerController datePickerController =
      Get.put(DatePickerController());
  RoomDetails? roomData;
  Future fetchRoomData() async {
    roomData = await service.getRoomDetails(widget.roomNumber);
  }

  @override
  void initState() {
    super.initState();
    fetchRoomData();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);

    return Scaffold(
        backgroundColor: ColorTheme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          centerTitle: true,
          title: "Room Details",
          actions: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.share,
                color: ColorTheme.blue,
              ),
            ),
            const HorizontalSpace(width: 10),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.favorite_border,
                color: ColorTheme.blue,
              ),
            ),
            const HorizontalSpace(width: 15),
          ],
        ),
        body: Obx(() {
          if (loadingController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorTheme.blue,
              ),
            );
          }
          if (roomData == null) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorTheme.blue,
              ),
            );
          } else {
            return Column(
              children: [
                Container(
                  height: ScreenSize.height * 0.35,
                  width: ScreenSize.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.image), fit: BoxFit.fill),
                  ),
                ),
                const VerticalSpace(height: 20),
                Expanded(
                    child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        //center part of the screen
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.roomNumber,
                                style: CustomStyle.blackTitleText,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorTheme.blue,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Transform.rotate(
                                      angle: -pi * 0.0,
                                      child: const Icon(
                                        CupertinoIcons.paperplane_fill,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const VerticalSpace(height: 10),
                          Row(
                            children: [
                              CustomTileWidget(
                                child: Text(
                                  "${roomData!.data!.roomData!.discountPercentage}% OFF",
                                  style: CustomStyle.blueTextStyle,
                                ),
                              ),
                              const HorizontalSpace(width: 15),
                              CustomTileWidget(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: ColorTheme.yellow,
                                    ),
                                    Text(
                                      "${roomData!.data!.roomData!.rating!.substring(0, 3)}(reviews)",
                                      style: CustomStyle.blueTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpace(height: 15),
                          Text(
                            "Description",
                            style: CustomStyle.blackStyle,
                          ),
                          SizedBox(
                            height: ScreenSize.height * 0.1,
                            width: ScreenSize.width,
                            child: Text(
                              roomData!.data!.roomData!.description!,
                              style: CustomStyle.regularStyle,
                            ),
                          ),
                          const VerticalSpace(height: 10),
                          Text(
                            "Contact info:",
                            style: CustomStyle.blackStyle,
                          ),
                          //Receptionist profile
                          ListTile(
                            leading: const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(image1),
                            ),
                            title: Text(
                              roomData!.data!.roomData!.receptionist!.name!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "rule",
                              style: CustomStyle.regularStyle,
                            ),
                            trailing: SizedBox(
                              width: ScreenSize.width * 0.25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            ColorTheme.blue)),
                                    icon: Icon(
                                      Icons.call_outlined,
                                      color: ColorTheme.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            ColorTheme.blue)),
                                    icon: Icon(
                                      Icons.email,
                                      color: ColorTheme.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const VerticalSpace(height: 10),
                          Text(
                            "Gallery",
                            style: CustomStyle.blackStyle,
                          ),
                          const VerticalSpace(height: 10),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    roomData!.data!.roomData!.gallery!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(18),
                                        image: const DecorationImage(
                                            image: AssetImage(image1),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const VerticalSpace(height: 10)
                        ],
                      ),
                    ),
                  ),
                )),
                //Bottom bar
                Container(
                  height: ScreenSize.height * 0.1,
                  width: ScreenSize.width,
                  color: ColorTheme.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 10,
                      bottom: 5,
                      top: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${roomData!.data!.roomData!.currentPrice} USD",
                              style: CustomStyle.titleStyle,
                            ),
                            Text(
                              "/night",
                              style: CustomStyle.blackStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: ScreenSize.width * 0.4,
                          child: CustomButton(
                              onTap: () {
                                var data = roomData!.data!.roomData!;
                                print(datePickerController.checkInDate.value);
                                if (datePickerController.checkInDate.value !=
                                        "DD/MM/YY" &&
                                    datePickerController.checkOutDate.value !=
                                        "DD/MM/YY") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => BookingSummary(
                                            roomNumber:
                                                data.roomNumber.toString(),
                                            currentPrice:
                                                data.currentPrice.toString(),
                                            bookingDate: DateTime.now()
                                                .toString()
                                                .substring(0, 10),
                                            checkIN: datePickerController
                                                .checkInDate.value,
                                            checkOUt: datePickerController
                                                .checkOutDate.value,
                                            guests: guestAndRoomController
                                                .guests.value
                                                .toString(),
                                            rooms: guestAndRoomController
                                                .room.value
                                                .toString(),
                                          )));
                                } else {
                                  Get.defaultDialog(
                                    title: "Allert",
                                    titleStyle:
                                        const TextStyle(color: Colors.red),
                                    middleText:
                                        "Please select your check-in and check-out date from home",
                                    middleTextStyle:
                                        const TextStyle(color: Colors.black),
                                    onCancel: () {},
                                    onConfirm: () {
                                      Get.back();
                                    },
                                  );
                                }
                              },
                              child: Center(
                                child: Text(
                                  "Book now",
                                  style: CustomStyle.buttonTextStyl,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        }));
  }
}
