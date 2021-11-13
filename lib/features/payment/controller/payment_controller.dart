import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/repositories/payment/payment_repo.dart';
import 'package:booking_yatch_agency/core/repositories/payment/payment_repo_impl.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  late PaymentRepo _paymentRepo;
  late GlobalController _globalController;

  PaymentController() {
    _paymentRepo = Get.find<PaymentRepoImpl>();
    _globalController = Get.find<GlobalController>();
    loadPaymentUrl();
  }

  RxString paymentUrl = ''.obs;
  RxBool isReady = false.obs;

  loadPaymentUrl() async {
    String orderId = _globalController.orderId.value;
    String ip = await Ipify.ipv4();
    paymentUrl.value = await _paymentRepo.getPayment(orderId, ip);
    isReady.value = true;
  }
}
