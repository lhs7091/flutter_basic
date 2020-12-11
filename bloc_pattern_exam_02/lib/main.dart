Stream<int> boatStream() async* {
  for (int i = 1; i <= 5; i++) {
    print("Sent Boat No. " + i.toString());
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatStream();

  stream.listen((event) {
    print('Received boat No. ' + event.toString());
  });
}
