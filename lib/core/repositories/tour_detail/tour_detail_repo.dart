import 'package:booking_yatch_agency/core/models/destination_tours_response_model.dart';

abstract class TourDetailRepo {
  Future<List<DestinationTour>> getDestinationTours(String idTour);
}
