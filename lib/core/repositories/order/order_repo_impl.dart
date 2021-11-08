import 'package:booking_yatch_agency/core/models/data_response_model.dart';
import 'package:booking_yatch_agency/core/models/order_request_model.dart';
import 'package:booking_yatch_agency/core/models/ticket_request_model.dart';
import 'package:booking_yatch_agency/core/repositories/order/order_repo.dart';
import 'package:booking_yatch_agency/services/http_service.dart';
import 'package:booking_yatch_agency/services/http_service_impl.dart';
import 'package:flutter/rendering.dart';
import 'package:get/instance_manager.dart';

class OrderRepoImpl implements OrderRepo {
  late HttpService _httpService;

  OrderRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
  }

  @override
  Future<DataResponse> createOrder(OrderRequest model) async {
    try {
      final response = await _httpService.post('orders', model);
      final parsedResponse = dataResponseFromJson(response.toString());
      return parsedResponse;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return DataResponse();
    }
  }

  @override
  Future<DataResponse> createTicket(TicketRequest model) async {
    try {
      final response = await _httpService.post('ticket', model);
      final parsedResponse = dataResponseFromJson(response.toString());
      return parsedResponse;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return DataResponse();
    }
  }
}
