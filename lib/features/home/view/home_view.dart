import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/features/authen/controller/authen_controller.dart';
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
  final authenController = Get.find<AuthenController>();

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.h, left: 10.w),
                        height: 40.h,
                        child: Image.asset(
                          'lib/core/assets/images/logo.png',
                        ),
                      ),
                      PopupMenuButton(
                        child: buildAvatarImage(),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Text("Đăng xuất"),
                            value: 0,
                          )
                        ],
                        onSelected: (result) {
                          if (result == 0) {
                            authenController.signOut();
                          }
                        },
                      ),
                    ],
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

  Container buildAvatarImage() {
    return Container(
      margin: EdgeInsets.only(right: 20.h),
      child: Container(
        height: 60.w,
        width: 60.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(authenController.user.value['PhotoUrl'] ??
                  AppConstants.defaultNetworkImageUrl)),
        ),
      ),
    );
  }
}
