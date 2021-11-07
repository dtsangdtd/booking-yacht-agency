import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/features/select_time/controller/select_time_controller.dart';
import 'package:get/get.dart';

class SelectTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
    Get.put(SelectTimeController());
  }
}
