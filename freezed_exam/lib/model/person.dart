import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  factory Person({
    required int id,
    required String name,
    required int age,
    required Group group,
    int? statusCode,
  }) = _Person;

  factory Person.loading({int? statusCode}) = _Loading;
  factory Person.error(String message, {int? statusCode}) = _Error;
  // part 'person.g.dart';
  // factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  // custom property
  // if you want to add some of functions,
  // please input classname._();
  // Person._();

  // get nameLength => this.name.length;

  // void hello() {
  // print('Hello Freezed Exam');
  // }
}

@freezed
class Group with _$Group {
  factory Group(
      {required int id, required String name, required School school}) = _Group;
}

@freezed
class School with _$School {
  factory School({
    required int id,
    required String name,
  }) = _School;
}
