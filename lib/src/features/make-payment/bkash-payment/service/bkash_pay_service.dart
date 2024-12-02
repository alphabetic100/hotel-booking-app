import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';
import 'package:get/get.dart';

class BkashPayService extends GetxController {
  final bkash = FlutterBkash();
  RxBool isLoading = false.obs;
  bkashPayment(BuildContext context, double amount) async {
    try {
      isLoading.value = true;
      final response = await bkash.pay(
        context: context,
        amount: amount,
        merchantInvoiceNumber: "invoice1234",
      );
      isLoading.value = false;
      print(response.paymentId);
    } on BkashFailure catch (e) {
      throw Exception("something went wrong, error is : ${e.message}");
    } finally {
      isLoading.value = false;
    }
  }
}
