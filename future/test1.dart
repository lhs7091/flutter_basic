import 'dart:io';

Future<String> download() {
  //sleep(Duration(seconds: 5));
  Future<String> value = Future.delayed(Duration(seconds: 5), () {
    return "apple";
  });
  //print("download complete");
  return value;
}

// main() async {
//   String value = await download();
//   print(value);
//   print("main finish");
// }

main() {
  download().then((value) {
    print(value);
  });
  print("main finish");
}
