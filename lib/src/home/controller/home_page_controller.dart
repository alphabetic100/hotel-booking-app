import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxInt currentPage = 0.obs;
  @override
  void onInit() {
    currentPage.value = 0;
    super.onInit();
  }

  final PageController controller = PageController();
  void pageChange(value) {
    currentPage.value = value;
  }

  void jumpInto(value) {
    controller.jumpToPage(value);
  }
}
