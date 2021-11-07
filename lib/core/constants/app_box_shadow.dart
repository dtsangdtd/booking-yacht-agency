import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBoxShadows {
  static final BoxShadow card = BoxShadow(
    color: AppColors.gray.withOpacity(0.2),
    offset: Offset(0, 2.h),
    blurRadius: 20.r,
  );

  static final BoxShadow image = BoxShadow(
    color: AppColors.gray.withOpacity(0.6),
    offset: Offset(0, 3.h),
    blurRadius: 10.r,
  );
}
