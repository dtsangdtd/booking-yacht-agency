import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  Rx<BusinessTour> selectedBusinessTour = BusinessTour().obs;
  Rx<Trip> selectedTrip = Trip().obs;

  setBusinessTour(BusinessTour value) {
    selectedBusinessTour.value = value;
  }

  setTrip(Trip value) {
    selectedTrip.value = value;
  }
}
