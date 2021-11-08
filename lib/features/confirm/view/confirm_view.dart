import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/features/confirm/controller/confirm_controller.dart';
import 'package:booking_yatch_agency/features/confirm/view/widgets/customer_item.dart';
import 'package:booking_yatch_agency/features/confirm/view/widgets/payment_method.dart';
import 'package:booking_yatch_agency/utils/format.dart';
import 'package:booking_yatch_agency/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Confirm extends StatelessWidget {
  Confirm({Key? key}) : super(key: key);

  final globalController = Get.find<GlobalController>();
  final controller = Get.find<ConfirmController>();
  late BusinessTour businessTour;

  @override
  Widget build(BuildContext context) {
    businessTour = globalController.selectedBusinessTour.value;

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                floating: true,
                snap: true,
                title: Text('Xác nhận đặt tour'),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.black,
              ),
            ];
          },
          body: buildBody(),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBody() {
    final tourName = businessTour.idTourNavigation?.title.toString() ??
        AppConstants.defaultString;
    final agencyName =
        businessTour.idBusinessNavigation?.name ?? AppConstants.defaultString;
    final startTime = AppFormats.datetime
        .format(globalController.selectedTrip.value.time ?? DateTime.now());

    List<Widget> ticketTypeList = [];

    final List<TicketType> ticketTypes = businessTour.ticketTypes;

    if (ticketTypes.isNotEmpty) {
      for (int i = 0; i < ticketTypes.length - 1; i++) {
        var count = globalController.countCustomer(ticketTypes[i].id);
        if (count > 0) {
          var ticketTypeItem = CustomerItem(ticketTypes[i]);
          ticketTypeList.add(ticketTypeItem);
        }
      }
      var count = globalController.countCustomer(ticketTypes.last.id);
      if (count > 0) {
        var ticketTypeItem = CustomerItem(ticketTypes.last);
        ticketTypeList.add(ticketTypeItem);
      }
    }

    String total = AppFormats.vnd.format(globalController.getTotalPrice());

    return Container(
      margin: EdgeInsets.fromLTRB(30.w, 15.h, 30.w, 0.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Thông tin cơ bản', style: AppFonts.h3b),
        SizedBox(height: 5.h),
        buildItem('Tên tour', tourName),
        buildItem('Tên chủ tàu', agencyName),
        buildItem('Thời gian khởi hành', startTime),
        const Divider(),
        Text('Thông tin vé', style: AppFonts.h3b),
        SizedBox(height: 5.h),
        Column(
          children: ticketTypeList,
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Tổng: ', style: AppFonts.h3b),
            Text(total, style: AppFonts.h3b),
          ],
        ),
        SizedBox(height: 50.h),
        PaymentMethod()
      ]),
    );
  }

  Row buildItem(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          left,
          style: AppFonts.h4,
        ),
        Expanded(
          child: Text(
            right,
            style: AppFonts.h4b.copyWith(fontWeight: FontWeight.w500),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [AppBoxShadows.image],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => SizedBox(
                height: 40.h,
                width: 140.h,
                child: PrimaryButton(
                  'Đặt ngay',
                  () async {
                    await globalController.createOrder();
                    Get.offAllNamed('/success');
                  },
                  suffix: const Icon(Icons.navigate_next),
                  isLoading: globalController.createOrderLoading.value,
                ),
              )),
        ],
      ),
    );
  }
}
