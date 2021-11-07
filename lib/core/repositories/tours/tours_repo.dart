import 'package:booking_yatch_agency/core/models/tours_response_model.dart';

abstract class ToursRepo {
  Future<List<Tour>> getTour();
}
