import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YatchInfo extends StatelessWidget {
  const YatchInfo(
    this.item, {
    Key? key,
  }) : super(key: key);

  final BusinessTour item;

  @override
  Widget build(BuildContext context) {
    final IdBusinessNavigation business =
        item.idBusinessNavigation ?? IdBusinessNavigation();

    return Column(children: [
      Row(
        children: [
          const Icon(
            Icons.directions_boat,
            size: 20,
          ),
          SizedBox(width: 10.w),
          Text('Thông tin tàu', style: AppFonts.h3b),
        ],
      ),
      SizedBox(height: 10.h),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Chủ tàu', style: AppFonts.h4),
            Text(business.name, style: AppFonts.h4),
          ],
        ),
      ),
    ]);
  }
}
