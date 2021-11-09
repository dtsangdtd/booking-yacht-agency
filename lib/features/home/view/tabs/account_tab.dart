import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 0.1.sh),
        const Icon(Icons.engineering, size: 80),
        Text('Trang này đang trong quá trình hoàn thiện', style: AppFonts.h3),
      ],
    );
  }
}
