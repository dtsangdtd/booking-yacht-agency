import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/features/confirm/controller/confirm_controller.dart';
import 'package:booking_yatch_agency/widgets/payment_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({
    Key? key,
  }) : super(key: key);

  final globalController = Get.find<GlobalController>();
  final controller = Get.find<ConfirmController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phương Thức Thanh Toán', style: AppFonts.h3b),
        SizedBox(height: 10.h),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  height: 60.h,
                  child: PaymentButton(
                    'Tiền mặt',
                    () {
                      controller.setSelectedIndex(0);
                      globalController.setPaymentMethod(0);
                    },
                    isSelected: controller.selectedIndex.value == 0,
                    topIcon: Icons.paid,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  height: 60.h,
                  child: PaymentButton(
                    'Thẻ tín dụng',
                    () {
                      controller.setSelectedIndex(1);
                      globalController.setPaymentMethod(1);
                    },
                    isSelected: controller.selectedIndex.value == 1,
                    topIcon: Icons.credit_card,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
