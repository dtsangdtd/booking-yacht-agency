import 'package:booking_yatch_agency/core/models/ticket_response_model.dart';
import 'package:booking_yatch_agency/core/repositories/ticket/ticket_repo.dart';
import 'package:booking_yatch_agency/services/http_service.dart';
import 'package:booking_yatch_agency/services/http_service_impl.dart';
import 'package:flutter/rendering.dart';
import 'package:get/instance_manager.dart';

class TicketRepoImpl implements TicketRepo {
  late HttpService _httpService;

  TicketRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
  }

  @override
  Future<List<Ticket>> getTickets(String orderId, String ticketTypeId) async {
    try {
      final response = await _httpService
          .get('ticket?id-order=$orderId&id-ticket-type=$ticketTypeId');
      final parsedResponse = ticketResponseFromJson(response.toString());
      return parsedResponse.data;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return const [];
    }
  }
}
