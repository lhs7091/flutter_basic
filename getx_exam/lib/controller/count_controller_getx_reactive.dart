import 'package:get/get.dart';

class CountControllerGetXReactive extends GetxController {
  RxInt count = 0.obs;

  getCount() => count;

  increase() {
    count++;
  }

  putNumber(int num) {
    count(num);
  }

  /*
   * Event Trigger
   * extends GetxController
   */
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(count, (_) => print('call every time'));
    once(count, (_) => print("call one time"));
    debounce(count, (_) => print("call last one"), time: Duration(seconds: 1));
    interval(count, (_) => print("call every 1sec"),
        time: Duration(seconds: 1));
  }
}
