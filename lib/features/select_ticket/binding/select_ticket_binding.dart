import 'package:booking_yatch_agency/features/select_ticket/controller/select_ticket_controller.dart';
import 'package:get/get.dart';

class SelectTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectTicketController());
  }
}
