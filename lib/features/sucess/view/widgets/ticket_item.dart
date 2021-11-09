import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/core/models/ticket_response_model.dart';
import 'package:booking_yatch_agency/features/sucess/controller/success_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketItem extends StatelessWidget {
  TicketItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  final TicketType item;
  final globalController = Get.find<GlobalController>();
  final controller = Get.find<SuccessController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.circle, size: 8),
            SizedBox(width: 15.w),
            Text(
              item.name,
              style: AppFonts.h3.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Obx(
          () => Container(
            child: controller.isLoading.value
                ? buildTicketTypeListLoading()
                : buildTicketTypeList(),
          ),
        ),
      ],
    );
  }

  Widget buildTicketTypeListLoading() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      child: Shimmer.fromColors(
        baseColor: AppConstants.shimmerBaseColor,
        highlightColor: AppConstants.shimmerHighlightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 0.6.sw,
              width: 0.6.sw,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [AppBoxShadows.card],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTicketTypeList() {
    // ignore: invalid_use_of_protected_member
    List<Ticket> tickets = controller.ticketMap.value[item.id] ?? [];

    List<Widget> ticketTypeItemList = [];

    if (tickets.isNotEmpty) {
      for (int i = 0; i < tickets.length - 1; i++) {
        Widget ticketTypeItem = buildTicketTypeItem(tickets[i]);
        ticketTypeItemList.add(ticketTypeItem);
        ticketTypeItemList.add(SizedBox(height: 20.h));
      }
      Widget ticketTypeItem = buildTicketTypeItem(tickets.last);
      ticketTypeItemList.add(ticketTypeItem);
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.w),
      child: Column(
        children: ticketTypeItemList,
      ),
    );
  }

  Container buildTicketTypeItem(Ticket item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [AppBoxShadows.card],
      ),
      child: Column(
        children: [
          Text(item.nameCustomer, style: AppFonts.h4b),
          QrImage(
            data: item.qr,
            version: QrVersions.auto,
            size: 0.4.sw,
          ),
        ],
      ),
    );
  }
}
