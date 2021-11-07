import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String fontFamily = 'OpenSans';

class AppFonts {
  static final h1fs = 46.39.sp;
  static final h2fs = 37.11.sp;
  static final h3fs = 29.69.sp;
  static final h4fs = 23.75.sp;
  static final h5fs = 19.00.sp;
  static final h6fs = 15.20.sp;

  static final baseFont = TextStyle(
    color: AppColors.black,
    fontSize: h3fs,
    fontFamily: fontFamily,
  );

  static final h1b = baseFont.copyWith(
    fontSize: h1fs,
    fontWeight: FontWeight.bold,
  );

  static final h2b = baseFont.copyWith(
    fontSize: h2fs,
    fontWeight: FontWeight.bold,
  );

  static final h3b = baseFont.copyWith(
    fontSize: h3fs,
    fontWeight: FontWeight.bold,
  );

  static final h4b = baseFont.copyWith(
    fontSize: h4fs,
    fontWeight: FontWeight.bold,
  );

  static final h5b = baseFont.copyWith(
    fontSize: h5fs,
    fontWeight: FontWeight.bold,
  );

  static final h1 = baseFont.copyWith(
    fontSize: h1fs,
  );

  static final h2 = baseFont.copyWith(
    fontSize: h2fs,
  );

  static final h3 = baseFont.copyWith(
    fontSize: h3fs,
  );

  static final h4 = baseFont.copyWith(
    fontSize: h4fs,
  );

  static final h5 = baseFont.copyWith(
    fontSize: h5fs,
  );
}
