import 'package:booking_yatch_agency/core/models/tours_response_model.dart';
import 'package:booking_yatch_agency/core/repositories/tours/tours_repo.dart';
import 'package:booking_yatch_agency/services/http_service.dart';
import 'package:booking_yatch_agency/services/http_service_impl.dart';
import 'package:flutter/rendering.dart';
import 'package:get/instance_manager.dart';

class ToursRepoImpl implements ToursRepo {
  late HttpService _httpService;

  ToursRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
  }

  @override
  Future<List<Tour>> getTour() async {
    try {
      final response = await _httpService.get('tours?status=1');
      final parsedResponse = toursResponseFromJson(response.toString());
      return parsedResponse.data;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return const [];
    }
  }
}
