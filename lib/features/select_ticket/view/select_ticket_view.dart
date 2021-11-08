import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/features/select_ticket/controller/select_ticket_controller.dart';
import 'package:booking_yatch_agency/features/select_ticket/view/widgets/ticket_type_item.dart';
import 'package:booking_yatch_agency/utils/format.dart';
import 'package:booking_yatch_agency/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectTicket extends StatelessWidget {
  SelectTicket({Key? key}) : super(key: key);

  final globalController = Get.find<GlobalController>();
  final controller = Get.find<SelectTicketController>();

  @override
  Widget build(BuildContext context) {
    final businessTour = globalController.selectedBusinessTour.value;
    final List<TicketType> ticketTypes = businessTour.ticketTypes;

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                floating: true,
                snap: true,
                title: Text('Chọn số vé'),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.black,
              ),
            ];
          },
          body: buildBody(ticketTypes),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBody(List<TicketType> ticketTypes) {
    List<Widget> ticketTypeList = [];

    if (ticketTypes.isNotEmpty) {
      for (int i = 0; i < ticketTypes.length - 1; i++) {
        var ticketTypeItem = TicketTypeItem(ticketTypes[i]);
        ticketTypeList.add(ticketTypeItem);
        ticketTypeList.add(const Divider());
      }
      var ticketTypeItem = TicketTypeItem(ticketTypes.last);
      ticketTypeList.add(ticketTypeItem);
    }

    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Container(
          margin: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 20.h),
          child: Column(
            children: [
              Column(
                children: ticketTypeList,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTotal() {
    String total = AppFormats.vnd.format(globalController.total());
    return Text('Total: $total', style: AppFonts.h3b);
  }

  Widget buildBottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [AppBoxShadows.image],
          ),
          child: Column(
            children: [
              Obx(() => buildTotal()),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                    width: 120.h,
                    child: PrimaryButton('Tiếp tục', () {
                      if (controller.formKey.currentState!.validate()) {}
                    }, suffix: const Icon(Icons.navigate_next)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
