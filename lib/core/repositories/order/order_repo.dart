import 'package:booking_yatch_agency/core/models/data_response_model.dart';
import 'package:booking_yatch_agency/core/models/order_request_model.dart';
import 'package:booking_yatch_agency/core/models/ticket_request_model.dart';

abstract class OrderRepo {
  Future<DataResponse> createOrder(OrderRequest model);
  Future<DataResponse> createTicket(TicketRequest model);
}
