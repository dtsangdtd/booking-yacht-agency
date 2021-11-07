import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/features/detail/controller/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Schedule extends StatelessWidget {
  Schedule({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(DetailController());

  List<Widget> getLocationItems() {
    List<Widget> locationItems = [];

    final destinationTours = controller.destinationTours;

    Widget divider = Container(
      width: 1,
      height: 25,
      margin: EdgeInsets.only(left: 18.w),
      color: AppColors.gray,
    );

    if (destinationTours.isNotEmpty) {
      for (int i = 0; i < destinationTours.length - 1; i++) {
        String name = destinationTours[i].destination?.name ?? '';
        String address = destinationTours[i].destination?.address ?? '';
        Widget item = buildLocationItem(i + 1, name, address);
        locationItems.add(item);
        locationItems.add(divider);
      }

      String name = destinationTours.last.destination?.name ?? '';
      String address = destinationTours.last.destination?.address ?? '';
      locationItems
          .add(buildLocationItem(destinationTours.length, name, address));
    }

    return locationItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.today,
              size: 20,
            ),
            SizedBox(width: 10.w),
            Text('Lịch trình', style: AppFonts.h3b),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getLocationItems(),
          ),
        ),
      ],
    );
  }

  Row buildLocationItem(int index, String text, String description) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Chặng $index: " + text, style: AppFonts.h4),
              Text(
                description,
                style: AppFonts.h5.copyWith(
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
