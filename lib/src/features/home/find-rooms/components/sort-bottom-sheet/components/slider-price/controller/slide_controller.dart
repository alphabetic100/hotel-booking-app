import 'package:get/get.dart';

class SlideController extends GetxController {
  RxInt startValue = 90.obs;
  RxInt endValue = 150.obs;
  slidlistener(int start, int end) {
    startValue.value = start;
    endValue.value = end;
  }
}
