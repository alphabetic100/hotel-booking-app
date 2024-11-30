import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/src/core/constants/utils/colors/colors.dart';
import 'package:hotel_booking_app/src/features/home/find-rooms/components/sort-bottom-sheet/components/drop-down-box/controller/values/price_selection_sort_controller.dart';

class DropDownBox extends StatelessWidget {
  DropDownBox({super.key});
  final PriceSelectionSortController priceSelectionSortController =
      Get.put(PriceSelectionSortController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ColorTheme.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => DropdownButton(
              isExpanded: true,
              value: priceSelectionSortController.selectedValue.value,
              items: <String>[
                priceSelectionSortController.initialValue,
                "\$-\$\$ Price lower to higher",
                "\$\$-\$ Price higher to lower"
              ].map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                priceSelectionSortController.selectedValue.value = value!;
              }),
        ),
      ),
    );
  }
}
