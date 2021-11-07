import 'package:booking_yatch_agency/core/models/business_tours_response.dart';

abstract class BusinessTourRepo {
  Future<List<BusinessTour>> getBusinessTours(String query);
}
