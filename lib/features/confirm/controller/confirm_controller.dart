import 'package:get/get.dart';

class ConfirmController extends GetxController {
  RxInt selectedIndex = 0.obs;

  setSelectedIndex(value) {
    selectedIndex.value = value;
  }
}
