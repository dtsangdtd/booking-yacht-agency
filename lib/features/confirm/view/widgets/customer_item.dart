import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/core/models/customer_model.dart';
import 'package:booking_yatch_agency/features/select_ticket/controller/select_ticket_controller.dart';
import 'package:booking_yatch_agency/utils/format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerItem extends StatelessWidget {
  CustomerItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  final TicketType item;
  final globalController = Get.find<GlobalController>();
  final controller = Get.find<SelectTicketController>();

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

    if (customers.isNotEmpty) {
      for (int i = 0; i < customers.length - 1; i++) {
        Widget customerItem = buildCustomerItem(i);
        customerItemList.add(customerItem);
        customerItemList.add(SizedBox(height: 2.h));
      }

      Widget customerItem = buildCustomerItem(customers.length - 1);
      customerItemList.add(customerItem);
    }

    return Container(
      margin: customers.isNotEmpty
          ? EdgeInsets.fromLTRB(20.w, 5.h, 10.w, 5.h)
          : const EdgeInsets.all(0),
      child: Column(
        children: customerItemList,
      ),
    );
  }

  Widget buildCustomerItem(int i) {
    List<Customer> customers = globalController.getCustomers(item.id);
    return Container(
      width: 1.sw,
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.circle, size: 5),
              SizedBox(width: 20.w),
              Text(customers[i].name, style: AppFonts.h4),
            ],
          ),
        ],
      ),
    );
  }

  Row buildTicketTitle() {
    var countCustomer = globalController.countCustomer(item.id);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name,
                style: AppFonts.h3.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          children: [
            Text(
              countCustomer.toString(),
              style: AppFonts.h4b,
            ),
            Text(
              ' x ',
              style: AppFonts.h4b,
            ),
            Text(
              AppFormats.vnd.format(item.price),
              style: AppFonts.h4b,
            ),
          ],
        ),
      ],
    );
  }
}
