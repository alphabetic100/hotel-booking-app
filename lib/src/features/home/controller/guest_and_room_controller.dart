import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestAndRoomController extends GetxController {
  final TextEditingController gController = TextEditingController();
  final TextEditingController rController = TextEditingController();
  RxInt guests = 1.obs;
  RxInt room = 1.obs;
  void guestIncrement() {
    if (guests.value < 100) {
      guests.value++;
      gController.text = guests.value.toString();
    }
  }

  void guestDecrement() {
    if (guests.value > 1) {
      guests.value--;
      gController.text = guests.value.toString();
    }
  }

  void roomIncrement() {
    if (room.value < 100) {
      room.value++;
      rController.text = room.value.toString();
    }
  }

  void roomDecrement() {
    if (room.value > 1) {
      room.value--;
      rController.text = room.value.toString();
    }
  }
}
