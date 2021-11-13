import 'package:booking_yatch_agency/core/repositories/payment/payment_repo_impl.dart';
import 'package:booking_yatch_agency/features/payment/controller/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentRepoImpl());
    Get.put(PaymentController());
  }
}
