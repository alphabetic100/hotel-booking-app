import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';

class BkashPayService {
  final bkash = FlutterBkash();
  bkashPayment(BuildContext context) async {
    try {
      final response = await bkash.pay(
        context: context,
        amount: 30,
        merchantInvoiceNumber: "invoice1234",
      );
      print(response.paymentId);
    } on BkashFailure catch (e) {
      throw Exception("something went wrong, error is : ${e.message}");
    }
  }
}
