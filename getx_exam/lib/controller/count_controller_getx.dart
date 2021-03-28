import 'package:get/get.dart';

class CountControllerGetX extends GetxController {
  int count = 0;

  getCount() => count;

  void increase(String id) {
    count++;
    update([id]);
  }
}
