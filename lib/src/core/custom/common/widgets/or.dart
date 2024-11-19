import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/custom/common/widgets/devider.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';

class XOr extends StatelessWidget {
  const XOr({super.key, this.orTitle});
  final String? orTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const XDivider()),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              "Or $orTitle",
              style: CustomStyle.regularStyle,
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const XDivider()),
        ],
      ),
    );
  }
}
