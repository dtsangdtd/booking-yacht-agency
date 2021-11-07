import 'package:booking_yatch_agency/features/home/controller/home_controller.dart';
import 'package:booking_yatch_agency/features/home/view/tabs/account_tab.dart';
import 'package:booking_yatch_agency/features/home/view/tabs/search_tab.dart';
import 'package:booking_yatch_agency/features/home/view/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  final List<Widget> tabs = [
    Search(),
    Account(),
    Account(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                backgroundColor: Colors.white,
                titleSpacing: 0,
                title: Container(
                  margin: EdgeInsets.only(top: 5.h, left: 10.w),
                  height: 40.h,
                  child: Image.asset(
                    'lib/core/assets/images/logo.png',
                  ),
                ),
                bottom: PrimaryTab(),
              ),
            ];
          },
          body: Obx(
            () => tabs[controller.index.value],
          ),
        ),
      ),
    );
  }
}
