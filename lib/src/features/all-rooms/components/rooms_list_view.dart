import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/features/all-rooms/func/dynamic_height.dart';

class RoomsListView extends StatefulWidget {
  const RoomsListView({super.key});

  @override
  _RoomsListViewState createState() => _RoomsListViewState();
}

class _RoomsListViewState extends State<RoomsListView> {
  final ScrollController _controller1 = ScrollController();
  final ScrollController _controller2 = ScrollController();
  bool _isController1Scrolling = false;
  bool _isController2Scrolling = false;

  @override
  void initState() {
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
    return Row(
      children: [
        SizedBox(
          width: Get.width * 0.45,
          child: ListView.builder(
            controller: _controller1,
            itemCount: 10,
            itemBuilder: (context, index) {
              double height = dynamicHeight(index, ScreenSize.height);
              return Padding(
                padding: const EdgeInsets.only(top: 8, right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    height: height,
                    width: 10,
                    color: Colors.red,
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
            itemCount: 10,
            itemBuilder: (context, index) {
              double height = dynamicHeight(index, ScreenSize.height);
              return Padding(
                padding: const EdgeInsets.only(top: 8, left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    height: height,
                    width: 10,
                    color: Colors.yellow,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
