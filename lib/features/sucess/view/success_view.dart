import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/features/confirm/controller/confirm_controller.dart';
import 'package:booking_yatch_agency/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Success extends StatelessWidget {
  Success({Key? key}) : super(key: key);

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
                title: Text('Thanh toán thành công'),
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
    return Container(
      margin: EdgeInsets.fromLTRB(30.w, 15.h, 30.w, 0.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Thanh toán thànhhhhhhhhhhhhhhhh Cônggggggggggggggggg',
            style: AppFonts.h3b),
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
          SizedBox(
            height: 40.h,
            width: 180.h,
            child: PrimaryButton(
              'Trở về màn hình chính',
              () {
                Get.offAllNamed('/home');
              },
            ),
          ),
        ],
      ),
    );
  }
}
