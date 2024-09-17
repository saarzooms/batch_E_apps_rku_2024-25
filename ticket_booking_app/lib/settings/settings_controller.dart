import 'package:get/get.dart';

class SettingsController extends GetxController {
  var limit = 0.obs;
  var price = 0.obs;
  setValues(int l, int p) {
    limit.value = l;
    price.value = p;
  }
}
