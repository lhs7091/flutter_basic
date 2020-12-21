import 'dart:io';

void download() {
  Future(() {
    for (int i = 0; i < 5; i++) {
      sleep(Duration(seconds: 1));
      print("download function : $i");
    }
  });
}

main() {
  download();
  for (int i = 0; i < 5; i++) {
    sleep(Duration(seconds: 1));
    print("main function : $i");
  }
}
