import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exam/screens/get_x.dart';
import 'package:getx_exam/screens/normal.dart';
import 'package:getx_exam/screens/reactive_state_manage.dart';
import 'package:getx_exam/screens/simple_state_manage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Manage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FirstPage(),
                  ),
                );
              },
              child: Text('Normal First Button'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(GetXFirstPage());
              },
              child: Text('Getx First Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(SimpleStateManageScreen());
              },
              child: Text('simple state management'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(ReactiveStateManageScreen());
              },
              child: Text('Reactive state management'),
            ),
          ],
        ),
      ),
    );
  }
}
