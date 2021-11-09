import 'package:booking_yatch_agency/core/models/ticket_response_model.dart';

abstract class TicketRepo {
  Future<List<Ticket>> getTickets(String orderId, String ticketTypeId);
}
