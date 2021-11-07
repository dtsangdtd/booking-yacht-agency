import 'package:booking_yatch_agency/core/constants/app_box_shadow.dart';
import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/features/detail/controller/detail_controller.dart';
import 'package:booking_yatch_agency/features/detail/view/widgets/schedule.dart';
import 'package:booking_yatch_agency/features/detail/view/widgets/schedule_loading.dart';
import 'package:booking_yatch_agency/features/detail/view/widgets/ticket_types.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Detail extends StatelessWidget {
  Detail({Key? key}) : super(key: key);

  final controller = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    BusinessTour item = Get.arguments[0];
    final IdTourNavigation tour = item.idTourNavigation ?? IdTourNavigation();
    controller.loadDestinationTours(tour.id);
    final List<TicketType> ticketTypes = item.ticketTypes;

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                floating: true,
                snap: true,
                title: Text('Chi tiết tour'),
                backgroundColor: Colors.white,
                foregroundColor: AppColors.black,
              ),
            ];
          },
          body: buildBody(tour, ticketTypes),
        ),
      ),
    );
  }

  Widget buildBody(IdTourNavigation tour, List<TicketType> ticketTypes) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.loadDestinationTours(tour.id);
      },
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20.h,
          ),
          CachedNetworkImage(
            imageUrl: tour.imageLink,
            imageBuilder: (context, imageProvider) =>
                buildImageBuilder(imageProvider),
            placeholder: (context, url) => buildPlaceholder(),
            errorWidget: (context, url, error) => buildErrorWidget(),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 30.h),
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [AppBoxShadows.card],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tour.title,
                  style: AppFonts.h2b,
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child:
                          HtmlWidget(tour.descriptions, textStyle: AppFonts.h4),
                    ),
                  ],
                ),
                const Divider(),
                TicketTypes(ticketTypes),
                const Divider(),
                Obx(
                  () => controller.isLoading.value
                      ? const ScheduleLoading()
                      : controller.destinationTours.isEmpty
                          ? const SizedBox()
                          : Schedule(),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Container buildErrorWidget() {
    return Container(
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
    );
  }

  Shimmer buildPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
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
    );
  }

  Container buildImageBuilder(ImageProvider<Object> imageProvider) {
    return Container(
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
    );
  }
}
