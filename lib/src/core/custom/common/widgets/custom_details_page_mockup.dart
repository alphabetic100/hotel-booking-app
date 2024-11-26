import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/custom_app_bar.dart';

class CustomDetailsPageMockup extends StatelessWidget {
  const CustomDetailsPageMockup({super.key, required this.boady});
  final Widget boady;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorTheme.scaffoldBackgroundColor,
        appBar: const CustomAppBar(),
        body: boady,
      ),
    );
  }
}
