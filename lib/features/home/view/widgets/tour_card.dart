import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/tours_response_model.dart';
import 'package:booking_yatch_agency/widgets/secondary_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class TourCard extends StatelessWidget {
  final Tour item;
  const TourCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      item.tittle,
                      style: AppFonts.h3b,
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: HtmlWidget(item.descriptions,
                            textStyle: AppFonts.h4),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SecondaryButton('Xem thêm', () {
                        Get.toNamed('/detail/', arguments: [item]);
                      }),
                    ],
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: item.imageLink,
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
