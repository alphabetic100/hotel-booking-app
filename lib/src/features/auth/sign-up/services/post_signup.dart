import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/values/services/api_service.dart';
import 'package:hotel_booking_app/src/features/auth/sign-up/controller/loading_controller.dart';
import 'package:hotel_booking_app/src/features/auth/sign-up/data/sign_up_data.dart';
import 'package:hotel_booking_app/src/features/auth/sign-up/temp/sign_up_values.dart';

class PostSignup {
  final dio = Dio();
  final SignUpLoadingController loadingController =
      Get.put(SignUpLoadingController());
  Future<SignUpData?> createAccount() async {
    Map parameters = {
      "name": name,
      "email": signupEmail,
      "password": signUpPass,
      "phone": phone,
      "confirm_password": signUpPass,
    };
    try {
      loadingController.isLoading.value = true;
      final response = await dio.post(api + signUp, data: parameters);
      if (response.statusCode == 201) {
        final signupData = SignUpData.fromJson(response.data);
        return signupData;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      loadingController.isLoading.value = false;
    }
  }
}
