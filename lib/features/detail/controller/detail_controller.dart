import 'package:booking_yatch_agency/core/models/destination_tours_response_model.dart';
import 'package:booking_yatch_agency/core/repositories/tour_detail/tour_detail_repo.dart';
import 'package:booking_yatch_agency/core/repositories/tour_detail/tour_detail_repo_impl.dart';
import 'package:booking_yatch_agency/utils/delay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class DetailController extends GetxController {
  late TourDetailRepo _tourDetailRepo;

  DetailController() {
    _tourDetailRepo = Get.find<TourDetailRepoImpl>();
  }

  RxBool isLoading = false.obs;

  RxList<DestinationTour> destinationTours = RxList<DestinationTour>();

  loadDestinationTours(String tourId) async {
    isLoading.value = true;

    final result = await _tourDetailRepo.getDestinationTours(tourId);

    if (result.isNotEmpty) {
      destinationTours.value = result;
    } else {
      debugPrint('No data received');
    }

    Delay.range(() {
      isLoading.value = false;
    });
  }
}
