import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxInt currentPage = 0.obs;
  final PageController controller = PageController();
  void pageChange(value) {
    currentPage.value = value;
    print(currentPage.value);
  }

  void jumpInto(value) {
    currentPage.value = value;
    controller.jumpToPage(value);
  }
}
