import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/core/models/customer_model.dart';
import 'package:booking_yatch_agency/utils/format.dart';
import 'package:booking_yatch_agency/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketTypeItem extends StatelessWidget {
  TicketTypeItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  final TicketType item;
  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTicketTitle(),
          Obx(() => buildCustomerList()),
        ],
      ),
    );
  }

  Widget buildCustomerList() {
    List<Widget> customerItemList = [];
    final customers = globalController.getCustomers(item.id);

    for (int i = 0; i < customers.length; i++) {
      Widget customerItem = Container(
        height: 50.h,
        width: 50.w,
        color: Colors.red,
      );
      customerItemList.add(customerItem);
    }
    return Column(
      children: customerItemList,
    );
  }

  Row buildTicketTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name, style: AppFonts.h4b),
            Text(
              AppFormats.vnd.format(item.price),
              style: AppFonts.h4.copyWith(color: AppColors.gray),
            ),
          ],
        ),
        Row(
          children: [
            CircleButton(Icons.remove, () {
              globalController.removeLastCustomer(item.id);
            }),
            Obx(
              () => Text(globalController.countCustomer(item.id).toString(),
                  style: AppFonts.h4b),
            ),
            CircleButton(Icons.add, () {
              globalController.addCustomer(item.id, Customer());
            }),
          ],
        ),
      ],
    );
  }
}
