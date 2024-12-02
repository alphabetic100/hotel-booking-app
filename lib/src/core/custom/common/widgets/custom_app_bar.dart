import 'package:flutter/material.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/core/constants/utils/styles/custom_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.centerTitle,
    this.actions,
    this.ontapBackButton,
    this.backButton = true,
  });
  final String title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final VoidCallback? ontapBackButton;
  final bool backButton;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorTheme.scaffoldBackgroundColor,
      title: title.isNotEmpty
          ? Text(
              title,
              style: CustomStyle.titleStyle,
            )
          : null,
      centerTitle: centerTitle,
      actions: actions,
      leading: backButton
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 50,
                child: GestureDetector(
                  onTap: ontapBackButton ?? () => Navigator.of(context).pop(),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: ColorTheme.blue,
                      size: 30,
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
