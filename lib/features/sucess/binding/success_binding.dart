import 'package:booking_yatch_agency/features/sucess/controller/success_controller.dart';
import 'package:get/get.dart';

class SuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SuccessController());
  }
}
