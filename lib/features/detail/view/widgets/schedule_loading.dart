import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ScheduleLoading extends StatelessWidget {
  const ScheduleLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppConstants.shimmerBaseColor,
      highlightColor: AppConstants.shimmerHighlightColor,
      child: Column(children: [
        const Divider(),
        Container(
          color: Colors.white,
          height: 20.h,
        ),
        SizedBox(height: 10.h),
        Container(
          color: Colors.white,
          height: 20.h,
        ),
        SizedBox(height: 10.h),
        Container(
          color: Colors.white,
          height: 20.h,
        ),
      ]),
    );
  }
}
