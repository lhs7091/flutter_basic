void main() {
  // String의 경우 immutable 속성을 가짐
  // 값을 변경할 경우, 또 다른 메모리 공간에 저장을 함.
  // 기존 값은 메모리 손실이 일어나기 때문에 garbage collector가 발생하여 지움
  var a = "test";
  print(a.hashCode);
  a = "t";
  print(a.hashCode);
}
