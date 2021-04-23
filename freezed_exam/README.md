# freezed_exam

A new Flutter project.

## Getting Started

- dependency install
    - [freezed](https://pub.dev/packages/freezed)
    - [freezed-annotation](https://pub.dev/packages/freezed_annotation)
    - [build_runner](https://pub.dev/packages/build_runner)

- make Person class
```
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  factory Person({
    required int id,
    required String name,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
```

- run command
```
aaa@aaa-MacBookAir freezed_exam % flutter pub run build_runner build
```

## Advantage

- the toString, hashCode and '==' methods are overridden as you would expect
- simply apply from-to json 
- for using function in model class
```
  Person._();

  get nameLength => this.name.length;

  void hello() {
    print('Hello Freezed Exam');
  }
```
- copy object
```
final person3 = person1.copyWith(age: 40);
final person4 = person1.copyWith.group.school(name: 'TaiZhung');
```

- Unions/Sealed classes(or internal class)  
 
Coming from other languages, you may be used with features like "tagged union types" / sealed classes/pattern matching.
These are powerful tools in combination with a type system, but Dart currently does not support them.

But fear not, Freezed supports them all, by using a syntax similar to Kotlin.
```
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
```
The when method is the equivalent to pattern matching with destructing.
Its prototype depends on the constructors defined.
```
  mapWhen(Person person) {
    return person.when(
      (id, name, age, group, statusCode) =>
          'id: $id, name: $name, age: $age, group:$group, statuscode: $statusCode',
      loading: (int? statusCode) => 'Loading....',
      error: (String message, int? statusCode) => message,
    );
  }
```