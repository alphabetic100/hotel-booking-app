import 'package:get/get.dart';

class PaymentMathodController extends GetxController {
  RxBool isSelected = false.obs;
  void select() {
    isSelected.value = !isSelected.value;
  }
}
