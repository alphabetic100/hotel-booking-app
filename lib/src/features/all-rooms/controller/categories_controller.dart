import 'package:get/get.dart';

class CategoriesController extends GetxController {
  RxInt currentIndex = 0.obs;
  void changeIndex(int value) {
    currentIndex.value = value;
  }
}
