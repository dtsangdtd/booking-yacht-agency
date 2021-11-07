import 'package:booking_yatch_agency/core/repositories/authen/authen_repo_impl.dart';
import 'package:booking_yatch_agency/features/authen/controller/authen_controller.dart';
import 'package:get/get.dart';

class AuthenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenRepoImpl());
    Get.put(AuthenController());
  }
}
