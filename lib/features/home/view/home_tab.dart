import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class PrimaryTab extends StatelessWidget with PreferredSizeWidget {
  PrimaryTab({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 4);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SalomonBottomBar(
        currentIndex: controller.index.value,
        onTap: (i) => controller.setIndex(i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.explore_outlined),
            title: const Text("Khám phá"),
            selectedColor: AppColors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shield_outlined),
            title: const Text("Chế độ an toàn"),
            selectedColor: AppColors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.history),
            title: const Text("Lịch sử đặt tour"),
            selectedColor: AppColors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.menu),
            title: const Text("Tài khoản"),
            selectedColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
