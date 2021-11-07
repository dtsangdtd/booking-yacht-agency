import 'package:booking_yatch_agency/core/repositories/business_tour/business_tour_repo_impl.dart';
import 'package:booking_yatch_agency/features/authen/controller/authen_controller.dart';
import 'package:booking_yatch_agency/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BusinessTourRepoImpl());
    Get.put(HomeController());
    Get.put(AuthenController());
  }
}
