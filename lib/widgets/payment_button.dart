import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton(
    this.text,
    this.onPressed, {
    this.prefix = const SizedBox(),
    this.suffix = const SizedBox(),
    this.isLoading = false,
    this.isSelected = false,
    this.topIcon = Icons.paid,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Widget prefix;
  final Widget suffix;
  final bool isLoading;
  final bool isSelected;
  final IconData topIcon;

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? Colors.white : AppColors.black;
    final backgroundColor = isSelected ? AppColors.primaryColor : Colors.white;

    return ElevatedButton(
      onPressed: !isLoading ? onPressed : null,
      child: !isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                prefix,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(topIcon, color: textColor),
                    Text(
                      text,
                      style: AppFonts.h4b.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: textColor,
                  ),
                ),
                SizedBox(width: 20.w),
                Text('Vui lòng chờ', style: AppFonts.h4),
              ],
            ),
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
