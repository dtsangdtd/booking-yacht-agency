import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
    this.text,
    this.onPressed, {
    this.prefix = const SizedBox(),
    this.suffix = const SizedBox(),
    this.isLoading = false,
    this.isActive = true,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Widget prefix;
  final Widget suffix;
  final bool isLoading;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isLoading && isActive ? onPressed : null,
      child: !isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefix,
                Text(
                  text,
                  style: AppFonts.h4b.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                suffix
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20.w),
                Text(
                  'Vui lòng chờ',
                  style: AppFonts.h4.copyWith(color: Colors.white),
                ),
              ],
            ),
      style: ElevatedButton.styleFrom(
        primary: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }
}
