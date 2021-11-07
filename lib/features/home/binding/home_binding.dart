import 'package:booking_yatch_agency/core/repositories/tours/tours_repo_impl.dart';
import 'package:booking_yatch_agency/features/authen/controller/authen_controller.dart';
import 'package:booking_yatch_agency/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ToursRepoImpl());
    Get.put(HomeController());
    Get.put(AuthenController());
  }
}
