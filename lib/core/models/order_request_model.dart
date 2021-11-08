import 'package:booking_yatch_agency/core/constants/app_constants.dart';

class OrderRequest {
  OrderRequest({
    this.idAgency = AppConstants.defaultGuid,
    this.idTrip = AppConstants.defaultGuid,
    this.orderDate,
    this.totalPrice = AppConstants.defaultDouble,
    this.quantityOfPerson = AppConstants.defaultInt,
  });

  String idAgency;
  String idTrip;
  DateTime? orderDate;
  double totalPrice;
  int quantityOfPerson;
}
