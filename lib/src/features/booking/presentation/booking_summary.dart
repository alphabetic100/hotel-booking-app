import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/screen_size.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';
import 'package:hotel_booking_app/src/core/constants/values/static_values.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_app_bar.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_button.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_spacing.dart';
import 'package:hotel_booking_app/src/features/booking/components/booking_details_item.dart';
import 'package:hotel_booking_app/src/features/booking/controller/payment_mathod_controller.dart';
import 'package:hotel_booking_app/src/features/booking/func/amount_calculator.dart';
import 'package:hotel_booking_app/src/features/make-payment/bkash-payment/service/bkash_pay_service.dart';

class BookingSummary extends StatelessWidget {
  BookingSummary({
    super.key,
    required this.roomNumber,
    required this.currentPrice,
    required this.bookingDate,
    required this.checkIN,
    required this.checkOUt,
    required this.guests,
    required this.rooms,
  });
  final String roomNumber;
  final String currentPrice;
  final String bookingDate;
  final String checkIN;
  final String checkOUt;
  final String guests;
  final String rooms;
  final PaymentMathodController mathodController =
      Get.put(PaymentMathodController());
  final BkashPayService bkashPayService = Get.put(BkashPayService());

  @override
  Widget build(BuildContext context) {
    int amount = amountCalculator(int.parse(currentPrice), int.parse(rooms));
    double totalAmount =
        totalAmountCalculator(int.parse(currentPrice), int.parse(rooms), 10);
    return Scaffold(
      backgroundColor: ColorTheme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        centerTitle: true,
        title: "Booking Summary",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpace(height: 20),
            SizedBox(
              height: Get.height * 0.1,
              child: Row(
                children: [
                  Container(
                    height: Get.height * 0.1,
                    width: Get.height * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                            image: AssetImage(image1), fit: BoxFit.cover)),
                  ),
                  const HorizontalSpace(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        roomNumber,
                        style: CustomStyle.blackStyle,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$$currentPrice USD",
                            style: CustomStyle.blueTextStyle,
                          ),
                          const Text("/Night",
                              style: TextStyle(color: Colors.black)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const VerticalSpace(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    BookingDetailsItem(
                        label: "Booking Date", value: bookingDate),
                    BookingDetailsItem(label: "Check-In", value: checkIN),
                    BookingDetailsItem(label: "Check-Out", value: checkOUt),
                    BookingDetailsItem(label: "Guests", value: guests),
                    BookingDetailsItem(label: "Rooms", value: rooms),
                    const VerticalSpace(height: 20),
                    const Divider(
                      color: Colors.black,
                      thickness: 1.5,
                    ),
                    const VerticalSpace(height: 20),
                    BookingDetailsItem(
                      label: "Amount x $rooms",
                      value: "$amount\$",
                    ),
                    const BookingDetailsItem(label: "Tax", value: "10%"),
                    BookingDetailsItem(label: "Total", value: "$totalAmount\$"),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Select your payment mathod:",
                  style: CustomStyle.blackStyle,
                ),
                const VerticalSpace(height: 10),
                GestureDetector(
                    onTap: () => mathodController.select(),
                    child: Obx(
                      () => Container(
                        height: 60,
                        width: ScreenSize.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: mathodController.isSelected.value
                                ? Colors.pinkAccent.withOpacity(0.1)
                                : Colors.white,
                            border: Border.all(
                              color: mathodController.isSelected.value
                                  ? const Color(0xFFED0A80)
                                  : Colors.grey,
                              width: 2,
                            ),
                            image: const DecorationImage(
                                image: AssetImage("$imageAsst/Bkash-logo.png"),
                                filterQuality: FilterQuality.high)),
                      ),
                    )),
                const VerticalSpace(height: 10)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CustomButton(
                    onTap: () async {
                      mathodController.isSelected.value
                          ? await bkashPayService.bkashPayment(
                              context, totalAmount)
                          : Get.defaultDialog(
                              title: "Allert",
                              titleStyle: const TextStyle(color: Colors.red),
                              middleText: "Please select your payment mathode",
                              onConfirm: () => Get.back(),
                            );
                    },
                    child: Center(
                        child: Obx(() => bkashPayService.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: ColorTheme.white,
                                ),
                              )
                            : Text(
                                "Continue to payment",
                                style: CustomStyle.buttonTextStyl,
                              )))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
