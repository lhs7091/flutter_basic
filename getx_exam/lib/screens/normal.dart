import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exam/home.dart';
import 'package:getx_exam/screens/get_x.dart';
import 'package:getx_exam/screens/normal.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('back'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAll(Home());

                // befor
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (_) => Home()),
                //     (route) => false);
              },
              child: Text('to home'),
            ),
          ],
        ),
      ),
    );
  }
}
