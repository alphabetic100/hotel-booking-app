import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';
import 'package:hotel_booking_app/src/features/room-details/view/room_details_screen.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList(
      {super.key, required this.roomNumber, required this.addedDate});
  final String roomNumber;
  final String addedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return RoomDetailsScreen(
              roomNumber: roomNumber,
              image: image1,
            );
          }));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("$imageAsst/image1.png"),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
            ),

            //room number
            SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Room N.",
                    style: CustomStyle.blackStyle,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    roomNumber,
                    style: CustomStyle.titleStyle,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
