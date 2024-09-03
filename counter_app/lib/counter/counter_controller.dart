import 'package:get/get.dart';

class CounterController extends GetxController {
  int count = 0;
  inc() {
    count++;
    update();
  }

  dec() {
    --count;
    update();
  }

  reset() {
    count = 0;
    update();
  }
}
