import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputForm extends StatelessWidget {
  const InputForm(
    this.text, {
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  final String text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 35.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
      ),
      hintText: text,
      hintStyle: AppFonts.h4.copyWith(color: AppColors.gray),
    );

    if (prefixIcon != null) {
      decoration = decoration.copyWith(
        contentPadding: const EdgeInsets.all(0),
        prefixIcon: Container(
          padding: EdgeInsets.only(left: 15.w),
          child: prefixIcon,
        ),
      );
    }

    if (suffixIcon != null) {
      decoration = decoration.copyWith(
        contentPadding: const EdgeInsets.all(0),
        suffixIcon: suffixIcon,
      );
    }

    return TextFormField(
      controller: controller,
      style: AppFonts.h4.copyWith(color: AppColors.black),
      decoration: decoration,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }
}
