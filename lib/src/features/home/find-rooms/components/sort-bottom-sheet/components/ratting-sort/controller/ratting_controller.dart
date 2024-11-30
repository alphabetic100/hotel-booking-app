import 'package:get/get.dart';

class RattingController extends GetxController {
  RxInt selectedIndex = 0.obs;
  selectionChecker(int index) {
    selectedIndex.value = index;
  }
}
