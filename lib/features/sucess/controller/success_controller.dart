import 'package:get/get.dart';

class SuccessController extends GetxController {
  RxInt selectedIndex = 0.obs;

  setSelectedIndex(value) {
    selectedIndex.value = value;
  }
}
