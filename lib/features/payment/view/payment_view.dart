import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/features/payment/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final globalController = Get.find<GlobalController>();
  final controller = Get.find<PaymentController>();
  late BusinessTour businessTour;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    businessTour = globalController.selectedBusinessTour.value;
    final flutterWebviewPlugin = FlutterWebviewPlugin();
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      debugPrint(url);
      if (url.contains(
          'booking-yacht.azurewebsites.net/api/v1.0/agency/vn-pay/PaymentConfirm')) {
        if (url.contains('vnp_ResponseCode=00')) {
          Get.offAllNamed('/success');
        } else {
          Get.toNamed('/confirm');
        }
      }
    });
    return Scaffold(
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Obx(
      () {
        if (controller.isReady.value) {
          return WebviewScaffold(
            url: controller.paymentUrl.value,
            initialChild: const Center(
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
