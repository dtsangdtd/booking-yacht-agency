import 'package:booking_yatch_agency/features/confirm/controller/confirm_controller.dart';
import 'package:get/get.dart';

class ConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ConfirmController());
  }
}
