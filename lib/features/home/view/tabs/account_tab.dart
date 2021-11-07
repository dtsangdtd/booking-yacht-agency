import 'package:booking_yatch_agency/features/authen/controller/authen_controller.dart';
import 'package:booking_yatch_agency/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);

  final controller = Get.find<AuthenController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryButton(
        'Đăng xuất',
        () {
          controller.signOut(context);
        },
      ),
    );
  }
}
