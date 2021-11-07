import 'package:booking_yatch_agency/core/models/tours_response_model.dart';
import 'package:booking_yatch_agency/core/repositories/tours/tours_repo.dart';
import 'package:booking_yatch_agency/core/repositories/tours/tours_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late ToursRepo _toursRepo;

  HomeController() {
    _toursRepo = Get.find<ToursRepoImpl>();
    loadTours();
  }

  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  RxList<Tour> tours = RxList<Tour>();

  loadTours() async {
    isLoading.value = true;
    final result = await _toursRepo.getTour();
    isLoading.value = false;

    if (result.isNotEmpty) {
      tours.value = result;
    } else {
      debugPrint('No data received');
    }
  }

  setIndex(value) {
    index.value = value;
  }
}
