import 'package:booking_yatch_agency/core/models/destination_tours_response_model.dart';
import 'package:booking_yatch_agency/core/repositories/tour_detail/tour_detail_repo.dart';
import 'package:booking_yatch_agency/services/http_service.dart';
import 'package:booking_yatch_agency/services/http_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourDetailRepoImpl extends TourDetailRepo {
  late HttpService _httpService;

  TourDetailRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
  }

  @override
  Future<List<DestinationTour>> getDestinationTours(String idTour) async {
    try {
      final response =
          await _httpService.get('desination-tours?id-tour=$idTour');
      final parsedResponse =
          destinationToursResponseFromJson(response.toString());
      return parsedResponse.data;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return const [];
    }
  }
}
