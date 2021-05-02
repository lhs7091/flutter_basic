void main() {
  // mutable의 경우 동일한 메모리에서 값만 변경됨
  // 리스트가 대표적인 예
  var c = [1, 2, 3];
  print(c.hashCode);
  c.add(4);
  print(c.hashCode);
}
