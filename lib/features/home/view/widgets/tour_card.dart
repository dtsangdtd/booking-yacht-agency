import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/utils/format.dart';
import 'package:booking_yatch_agency/widgets/secondary_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class TourCard extends StatelessWidget {
  final BusinessTour item;
  TourCard(this.item, {Key? key}) : super(key: key);

  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    final IdTourNavigation tour = item.idTourNavigation ?? IdTourNavigation();
    final List<TicketType> ticketTypes = item.ticketTypes;
    final IdBusinessNavigation business =
        item.idBusinessNavigation ?? IdBusinessNavigation();

    String getMinPrice() {
      double min = ticketTypes[0].price;
      for (var item in ticketTypes) {
        if (item.price < min) {
          min = item.price;
        }
      }
      return AppFormats.vnd.format(min);
    }

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
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      tour.title,
                      style: AppFonts.h3b,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Chủ tàu: ',
                        style:
                            AppFonts.h4.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(business.name, style: AppFonts.h4),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: HtmlWidget(tour.descriptions,
                            textStyle: AppFonts.h4),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Giá chỉ từ', style: AppFonts.h4b),
                          Row(
                            children: [
                              Text(getMinPrice(),
                                  style: AppFonts.h3b
                                      .copyWith(color: AppColors.primaryColor)),
                              Text('/người',
                                  style: AppFonts.h4
                                      .copyWith(color: AppColors.gray))
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SecondaryButton('Xem thêm', () {
                            globalController.setBusinessTour(item);
                            Get.toNamed('/detail');
                          }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: tour.imageLink,
                  imageBuilder: (context, imageProvider) => Container(
                    margin: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0.h),
                    height: 0.3.sh,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [AppBoxShadows.image],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Shimmer.fromColors(
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
                  errorWidget: (context, url, error) => Container(
                    margin: EdgeInsets.fromLTRB(30.w, 0, 30.w, 0.h),
                    height: 0.3.sh,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(AppConstants.defaultAssetImageUrl),
                        fit: BoxFit.cover,
                      ),
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
