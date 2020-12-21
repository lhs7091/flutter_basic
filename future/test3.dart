import 'dart:io';

import 'dart:isolate';

import 'test1.dart';

void download(var msg) {
  Future(() {
    for (int i = 0; i < 5; i++) {
      sleep(Duration(seconds: 1));
      print("download function : $i");
    }
  });
}

main() {
  Isolate.spawn(download, "hello");
  for (int i = 0; i < 5; i++) {
    sleep(Duration(seconds: 1));
    print("main function : $i");
  }
}
