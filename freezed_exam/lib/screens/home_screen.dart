import 'package:flutter/material.dart';
import 'package:freezed_exam/model/person.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  renderText(String title, String text) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('freezed exam'),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    final school1 = School(id: 3, name: 'Taipei');
    final group1 = Group(id: 2, name: 'Software Engineer', school: school1);
    // final person1 = Person(
    //     id: 1, name: 'Freezed Exam', age: 30, group: group1, statusCode: 200);

    // final personLoading = Person.loading();
    // final personError = Person.error('deny', statusCode: 400);
    // final person2 = Person(id: 1, name: 'Freezed Exam', age: 30, group: group1);

    // person1.hello();

    // final person3 = person1.copyWith(age: 20);
    // final person4 = person1.copyWith.group.school(name: 'TaiZhung');
    //
    final person = Person(
        id: 1, name: 'Freezed Exam', age: 52, statusCode: 200, group: group1);
    final personLoading = Person.loading();
    final personError = Person.error('server deny', statusCode: 400);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // renderText('person1.id', person1.id.toString()),
            // renderText('person1.name', person1.name.toString()),
            // renderText('person1.age', person1.age.toString()),
            // renderText('toString()', person1.toString()),
            // renderText('toJson()', person1.toJson().toString()),
            // renderText('==', (person1 == person2).toString()),
            // renderText('nameLength', person1.nameLength.toString()),
            // renderText('person3.toString()', person3.toString()),
            // renderText('person4.toString()', person4.toString()),
            renderText('person.toString()', person.toString()),
            renderText('personLoading', personLoading.toString()),
            renderText('personError', personError.toString()),
            renderText('person.statusCode', person.statusCode.toString()),
            renderText('person.when', mapWhen(person)),
            renderText('personLoading.when', mapWhen(personLoading)),
            renderText('personError.when', mapWhen(personError)),
          ],
        ),
      ),
    );
  }

  mapWhen(Person person) {
    return person.when(
      (id, name, age, group, statusCode) =>
          'id: $id, name: $name, age: $age, group:$group, statuscode: $statusCode',
      loading: (int? statusCode) => 'Loading....',
      error: (String message, int? statusCode) => message,
    );
  }
}
