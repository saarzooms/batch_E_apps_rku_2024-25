import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  inc() {
    count.value += 1;
  }

  dec() {
    if (count.value > 0) count.value -= 1;
  }

  reset() {
    count.value = 0;
  }
}
