import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
    this.text,
    this.onPressed, {
    this.prefix = const SizedBox(),
    this.suffix = const SizedBox(),
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Widget prefix;
  final Widget suffix;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !isLoading ? onPressed : null,
      child: !isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefix,
                Text(
                  text,
                  style: AppFonts.h4b.copyWith(
                    color: AppColors.primaryColor,
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
                Text('Vui lòng chờ', style: AppFonts.h4),
              ],
            ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }
}
