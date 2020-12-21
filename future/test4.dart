import 'dart:isolate';

// isolate는 다른 언어의 스레드와 똑같다.
// 다른점은 heap을 공유하지 않는다.
// 이벤트를 기다려야 함 : future
// 동시실행이 필요 : isolate

int num = 10;

void change(var value) {
  num = value;
  print("change : $num");
}

void check(var msg) {
  print("check : $num");
}

void main() {
  Isolate.spawn(change, 20);
  Isolate.spawn(check, "");
  //Isolate.spawn(change, 30);
  //change(50);
}
