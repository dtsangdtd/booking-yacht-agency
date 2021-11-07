import 'package:get/get.dart';

class SelectTimeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  setSelectedIndex(value) {
    selectedIndex.value = value;
  }
}
