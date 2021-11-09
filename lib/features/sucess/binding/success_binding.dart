import 'package:booking_yatch_agency/core/repositories/ticket/ticket_repo_impl.dart';
import 'package:booking_yatch_agency/features/sucess/controller/success_controller.dart';
import 'package:get/get.dart';

class SuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TicketRepoImpl());
    Get.put(SuccessController());
  }
}
