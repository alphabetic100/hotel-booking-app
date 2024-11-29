import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';
import 'package:hotel_booking_app/src/features/all-rooms/components/grid_components.dart';
import 'package:hotel_booking_app/src/features/all-rooms/controller/loading_controller.dart';
import 'package:hotel_booking_app/src/features/all-rooms/func/dynamic_height.dart';
import 'package:hotel_booking_app/src/features/all-rooms/func/odd_even_list.dart';
import 'package:hotel_booking_app/src/features/all-rooms/service/get_all_room_details.dart';
import 'package:hotel_booking_app/src/features/all-rooms/service/model/all_room_data.dart';
import 'package:hotel_booking_app/src/features/room-details/view/room_details_screen.dart';

class RoomsListView extends StatefulWidget {
  const RoomsListView({super.key});

  @override
  RoomsListViewState createState() => RoomsListViewState();
}

class RoomsListViewState extends State<RoomsListView> {
  final ScrollController _controller1 = ScrollController();
  final ScrollController _controller2 = ScrollController();
  bool _isController1Scrolling = false;
  bool _isController2Scrolling = false;
  final AllRoomLoadingController loadingController =
      Get.put(AllRoomLoadingController());

  final AllRoomService service = AllRoomService();
  final OddEvenList oddEvenList = OddEvenList();

  AllRoomData? roomData;
  Future fetchAllRoomData() async {
    roomData = await service.getAllRoomData();
    await oddEvenList.oddEvenChecker(roomData);
  }

  @override
  void initState() {
    fetchAllRoomData();
    super.initState();

    _controller1.addListener(() {
      if (!_isController2Scrolling) {
        _isController1Scrolling = true;
        _controller2.jumpTo(_controller1.offset);
        _isController1Scrolling = false;
      }
    });

    _controller2.addListener(() {
      if (!_isController1Scrolling) {
        _isController2Scrolling = true;
        _controller1.jumpTo(_controller2.offset);
        _isController2Scrolling = false;
      }
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (loadingController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: ColorTheme.grey,
          ),
        );
      } else {
        return Row(
          children: [
            SizedBox(
              width: Get.width * 0.45,
              child: ListView.builder(
                controller: _controller1,
                itemCount: oddEvenList.eveList.length,
                itemBuilder: (context, index) {
                  double height = dynamicHeight(index, ScreenSize.height);
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, right: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: height,
                        width: 10,
                        decoration: BoxDecoration(
                            color: ColorTheme.scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                color: ColorTheme.grey,
                                blurRadius: 4,
                                offset: const Offset(0.0, 0.0),
                                spreadRadius: 5,
                              )
                            ]),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return RoomDetailsScreen(
                                image: image1,
                                roomNumber: roomData!
                                    .data[oddEvenList.eveList[index]]
                                    .roomNumber,
                              );
                            }));
                          },
                          child: GridComponents(
                            index: oddEvenList.eveList[index],
                            roomNumber: roomData!
                                .data[oddEvenList.eveList[index]].roomNumber,
                            currentPrice: roomData!
                                .data[oddEvenList.eveList[index]].currentPrice,
                            oldPrice: roomData!
                                .data[oddEvenList.eveList[index]].oldPrice,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: Get.width * 0.45,
              child: ListView.builder(
                controller: _controller2,
                itemCount: oddEvenList.oddList.length,
                itemBuilder: (context, index) {
                  double height = dynamicHeight(index, ScreenSize.height);
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, left: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: height,
                        width: 10,
                        decoration: BoxDecoration(
                            color: ColorTheme.scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                color: ColorTheme.grey,
                                blurRadius: 4,
                                offset: const Offset(0.0, 0.0),
                                spreadRadius: 5,
                              )
                            ]),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return RoomDetailsScreen(
                                roomNumber: roomData!
                                    .data[oddEvenList.oddList[index]]
                                    .roomNumber,
                                image: image1,
                              );
                            }));
                          },
                          child: GridComponents(
                            index: oddEvenList.oddList[index],
                            roomNumber: roomData!
                                .data[oddEvenList.oddList[index]].roomNumber,
                            currentPrice: roomData!
                                .data[oddEvenList.oddList[index]].currentPrice,
                            oldPrice: roomData!
                                .data[oddEvenList.oddList[index]].oldPrice,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
    });
  }
}
