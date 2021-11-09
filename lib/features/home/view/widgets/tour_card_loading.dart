import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TourCardLoading extends StatelessWidget {
  const TourCardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(40.w, 0.3.sh - 5.h, 40.w, 0.h),
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [AppBoxShadows.card],
              ),
              child: Shimmer.fromColors(
                baseColor: AppConstants.shimmerBaseColor,
                highlightColor: AppConstants.shimmerHighlightColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      color: Colors.white,
                      height: 20.h,
                      width: 0.6.sw,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      color: Colors.white,
                      height: 20.h,
                      width: 0.65.sw,
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: AppConstants.shimmerBaseColor,
                  highlightColor: AppConstants.shimmerHighlightColor,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0.h),
                    height: 0.3.sh,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [AppBoxShadows.image],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
