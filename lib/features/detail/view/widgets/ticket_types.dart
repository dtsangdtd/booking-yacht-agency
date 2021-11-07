import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/utils/format_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketTypes extends StatelessWidget {
  const TicketTypes(
    this.ticketTypes, {
    Key? key,
  }) : super(key: key);

  final List<TicketType> ticketTypes;

  @override
  Widget build(BuildContext context) {
    List<Widget> ticketTypeWidgets = [];

    ticketTypes.sort((a, b) => a.price.compareTo(b.price));

    for (var item in ticketTypes) {
      var name = item.name;
      var price = AppFormats.vnd.format(item.price);
      Widget ticketTypeWidget = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: AppFonts.h4),
          Text(price, style: AppFonts.h4b),
        ],
      );

      ticketTypeWidgets.add(ticketTypeWidget);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.loyalty,
              size: 20,
            ),
            SizedBox(width: 10.w),
            Text('Loại vé', style: AppFonts.h3b),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: ticketTypeWidgets,
          ),
        ),
      ],
    );
  }
}
