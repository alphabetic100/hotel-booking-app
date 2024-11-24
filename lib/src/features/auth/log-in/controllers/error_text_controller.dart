import 'package:get/get.dart';

class LocalErrorTextController extends GetxController {
  RxString emailErrorText = "".obs;
  RxString passwordErrorText = "".obs;
}

class ApiErrorTextController extends GetxController {
  RxString massage = "".obs;
}
