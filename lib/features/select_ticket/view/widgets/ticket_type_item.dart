import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/core/models/customer_model.dart';
import 'package:booking_yatch_agency/features/select_ticket/controller/select_ticket_controller.dart';
import 'package:booking_yatch_agency/utils/format.dart';
import 'package:booking_yatch_agency/widgets/circle_button.dart';
import 'package:booking_yatch_agency/widgets/primary_input_form.dart';
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
        customerItemList.add(SizedBox(height: 10.h));
      }

      Widget customerItem = buildCustomerItem(customers.length - 1);
      customerItemList.add(customerItem);
    }

    return Container(
      margin: customers.isNotEmpty
          ? EdgeInsets.fromLTRB(5.w, 10.h, 5.w, 10.h)
          : const EdgeInsets.all(0),
      child: Column(
        children: customerItemList,
      ),
    );
  }

  Container buildCustomerItem(int i) {
    return Container(
      padding: EdgeInsets.fromLTRB(25.w, 15.h, 25.w, 15.h),
      width: 1.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [AppBoxShadows.card],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          InputForm(
            'Tên khách hàng',
            onChanged: (value) {
              globalController.updateCustomer(item.id, i, name: value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppConstants.space +
                    'Tên khách hàng không được để trống';
              }
              return null;
            },
          ),
          SizedBox(height: 10.h),
          InputForm(
            'Số điện thoại',
            onChanged: (value) {
              globalController.updateCustomer(item.id, i, phone: value);
            },
          ),
        ],
      ),
    );
  }

  Row buildTicketTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name,
                style: AppFonts.h3.copyWith(fontWeight: FontWeight.w500)),
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
