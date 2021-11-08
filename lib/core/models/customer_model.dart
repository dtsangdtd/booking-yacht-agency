import 'package:booking_yatch_agency/core/constants/app_constants.dart';

class Customer {
  Customer({
    this.name = AppConstants.defaultString,
    this.phone = AppConstants.defaultString,
  });
  String name;
  String phone;
}
