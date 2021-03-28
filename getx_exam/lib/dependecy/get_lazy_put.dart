import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exam/controller/dependency_controller.dart';

class GetLazyPut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed: () {
          Get.find<DependencyController>().increase();
        },
        child: Text("initialize"),
      ),
    );
  }
}
