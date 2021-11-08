import 'package:booking_yatch_agency/core/constants/app_constants.dart';

class TicketRequest {
  TicketRequest({
    this.idOrder = AppConstants.defaultGuid,
    this.idTrip = AppConstants.defaultGuid,
    this.customerNames = const [],
    this.phones = const [],
    this.idTicketTypes = const [],
  });

  String idOrder;
  String idTrip;
  List<String> customerNames;
  List<String> phones;
  List<String> idTicketTypes;
}
