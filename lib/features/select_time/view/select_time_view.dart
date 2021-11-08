import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/features/select_time/controller/select_time_controller.dart';
import 'package:booking_yatch_agency/utils/format.dart';
import 'package:booking_yatch_agency/widgets/primary_button.dart';
import 'package:booking_yatch_agency/widgets/toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectTime extends StatelessWidget {
  SelectTime({Key? key}) : super(key: key);

  final globalController = Get.find<GlobalController>();
  final controller = Get.find<SelectTimeController>();

  @override
  Widget build(BuildContext context) {
    final businessTour = globalController.selectedBusinessTour.value;
    final trips = businessTour.trips;

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                floating: true,
                snap: true,
                title: Text('Chọn thời gian khởi hành'),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.black,
              ),
            ];
          },
          body: buildBody(trips),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBody(List<Trip> trips) {
    List<Widget> tripItems = [];

    for (int i = 0; i < trips.length; i++) {
      Widget tripItem = Obx(
        () => ToggleButton(
          AppFormats.datetime.format(trips[i].time ?? DateTime.now()),
          () {
            controller.setSelectedIndex(i);
            globalController.setTrip(trips[i]);
          },
          isSelected: i == controller.selectedIndex.value,
        ),
      );

      tripItems.add(tripItem);
    }

    return Container(
      margin: EdgeInsets.fromLTRB(30.w, 15.h, 30.w, 0.h),
      child: Column(
        children: tripItems,
      ),
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [AppBoxShadows.image],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            width: 120.h,
            child: PrimaryButton('Tiếp tục', () {
              globalController.initTicketTypesMap();
              Get.toNamed('/select-ticket');
            }, suffix: const Icon(Icons.navigate_next)),
          ),
        ],
      ),
    );
  }
}
