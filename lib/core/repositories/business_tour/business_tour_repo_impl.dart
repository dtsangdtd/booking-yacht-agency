import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/services/http_service.dart';
import 'package:booking_yatch_agency/services/http_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'business_tour_repo.dart';

class BusinessTourRepoImpl extends BusinessTourRepo {
  late HttpService _httpService;

  BusinessTourRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
  }

  @override
  Future<List<BusinessTour>> getBusinessTours(String query) async {
    try {
      final response = await _httpService.get('business-tours?query=$query');
      final parsedResponse = businessToursResponseFromJson(response.toString());
      return parsedResponse.data;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return const [];
    }
  }
}
