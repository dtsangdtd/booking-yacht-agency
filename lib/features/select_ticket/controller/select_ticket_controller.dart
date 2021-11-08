import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectTicketController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final formKey = GlobalKey<FormState>();

  setSelectedIndex(value) {
    selectedIndex.value = value;
  }
}
