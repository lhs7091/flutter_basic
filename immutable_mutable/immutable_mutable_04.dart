void main() {
  User userInfo = User(name: 'test', age: 33);
  print(userInfo.toString());
  print(userInfo.hashCode);
  // if various declare final, it's immutable type
  // it will be occured error.
  userInfo.age = 44;

  // if you want to edit,
  User modifyUserInfo = userInfo.copyWith(name: "aaaa");
  print(modifyUserInfo.toString());
  print(modifyUserInfo.hashCode);
}

class User {
  final String? name;
  final int? age;
  User({this.name, this.age});
  String toString() => 'name=$name, age=$age';
  copyWith({String? name, int? age}) {
    return User(name: name ?? this.name, age: age ?? this.age);
  }
}
