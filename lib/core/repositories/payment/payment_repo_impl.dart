import 'package:booking_yatch_agency/core/models/data_response_model.dart';
import 'package:booking_yatch_agency/core/repositories/payment/payment_repo.dart';
import 'package:booking_yatch_agency/services/http_service.dart';
import 'package:booking_yatch_agency/services/http_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class PaymentRepoImpl implements PaymentRepo {
  late HttpService _httpService;

  PaymentRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
  }

  @override
  Future<String> getPayment(String orderId, String ip) async {
    try {
      final response =
          await _httpService.get('vn-pay?id-order=$orderId&ip=$ip');
      final parsedResponse = dataResponseFromJson(response.toString());
      return parsedResponse.data;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return '';
    }
  }
}
