import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/core/repositories/business_tour/business_tour_repo.dart';
import 'package:booking_yatch_agency/core/repositories/business_tour/business_tour_repo_impl.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late BusinessTourRepo _businessToursRepo;

  HomeController() {
    _businessToursRepo = Get.find<BusinessTourRepoImpl>();
    loadBusinessTours();
  }

  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  RxList<BusinessTour> businessTours = RxList<BusinessTour>();
  RxString searchQuery = ''.obs;

  setSearchQuery(value) {
    searchQuery.value = value;
  }

  loadBusinessTours() async {
    isLoading.value = true;
    final result = await _businessToursRepo.getBusinessTours(searchQuery.value);
    isLoading.value = false;

    businessTours.value = result;
  }

  setIndex(value) {
    index.value = value;
  }
}
