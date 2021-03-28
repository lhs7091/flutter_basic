import 'package:flutter/cupertino.dart';

class CountControllerProvider extends ChangeNotifier {
  int count = 0;

  getCount() => count;

  void increase() {
    count++;
    notifyListeners();
  }
}
