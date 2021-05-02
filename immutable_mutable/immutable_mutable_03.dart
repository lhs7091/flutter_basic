void main() {
  // login
  User userInfo = User(name: "test", age: 33);
  // 수정할 경우
  User modifyUserInfo = userInfo;
  // 사용자가 이름 변경
  modifyUserInfo.name = "modify";
  // 사용자가 서보로 저장하지 않고 취소할 경우
  print(userInfo.toString());
  print(modifyUserInfo.toString());
  print(userInfo.hashCode);
  print(modifyUserInfo.hashCode);
  print(userInfo.hashCode == modifyUserInfo.hashCode);

  print('');

  // 다른 메모리로 복사할경우
  modifyUserInfo = User(name: userInfo.name, age: userInfo.age);
  print(modifyUserInfo.toString());
  print(userInfo.hashCode);
  print(modifyUserInfo.hashCode);
  print(userInfo.hashCode == modifyUserInfo.hashCode);
}

// 클래스의 경우 mutable의 속성을 갖고 있음
class User {
  String? name;
  int? age;
  User({this.name, this.age});
  toString() => 'name=$name, age=$age';
}
