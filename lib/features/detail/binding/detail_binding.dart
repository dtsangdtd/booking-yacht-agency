import 'package:booking_yatch_agency/core/repositories/tour_detail/tour_detail_repo_impl.dart';
import 'package:booking_yatch_agency/features/detail/controller/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TourDetailRepoImpl());
    Get.put(DetailController());
  }
}
