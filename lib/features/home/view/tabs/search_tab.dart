import 'package:booking_yatch_agency/features/authen/controller/authen_controller.dart';
import 'package:booking_yatch_agency/features/home/controller/home_controller.dart';
import 'package:booking_yatch_agency/features/home/view/widgets/tour_card.dart';
import 'package:booking_yatch_agency/features/home/view/widgets/tour_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  Search({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<HomeController>();
  final authenController = Get.find<AuthenController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.loadBusinessTours();
      },
      child: Obx(
        () {
          return controller.isLoading.isTrue
              ? buildTourCardsLoading()
              : buildTourCards();
        },
      ),
    );
  }

  Container buildTourCards() {
    return Container(
      child: controller.businessTours.isEmpty
          ? const Center(child: Text('Không tìm thấy tour'))
          : ListView.separated(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              itemCount: controller.businessTours.length,
              itemBuilder: (BuildContext context, int index) {
                return TourCard(controller.businessTours[index]);
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 20.h,
              ),
            ),
    );
  }

  ListView buildTourCardsLoading() {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20.h),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return const TourCardLoading();
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20.h,
      ),
    );
  }
}
