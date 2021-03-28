import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exam/controller/count_controller_getx.dart';
import 'package:getx_exam/controller/count_controller_provider.dart';
import 'package:provider/provider.dart';

class SimpleStateManageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // instantiate
    Get.put(CountControllerGetX());

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple State Management"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: WithGetX(),
              ),
              Expanded(
                child: ChangeNotifierProvider<CountControllerProvider>(
                  create: (context) => CountControllerProvider(),
                  child: WithProvider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
 * StateManagement
 * with GetX
 * 
 */

class WithGetX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "GetX",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        GetBuilder<CountControllerGetX>(
          id: "first",
          builder: (controller) {
            return Text(
              '${controller.getCount()}',
              style: TextStyle(
                fontSize: 30,
              ),
            );
          },
        ),
        GetBuilder<CountControllerGetX>(
          id: "second",
          builder: (controller) {
            return Text(
              '${controller.getCount()}',
              style: TextStyle(
                fontSize: 30,
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Get.find<CountControllerGetX>().increase("first");
          },
          child: Text(
            "+",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Get.find<CountControllerGetX>().increase("second");
          },
          child: Text(
            "+",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}

/*
 * StateManagement
 * with Provider
 * 
 */

class WithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Provider",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Consumer<CountControllerProvider>(
          builder: (context, value, child) {
            return Text(
              '${value.getCount()}',
              style: TextStyle(
                fontSize: 30,
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<CountControllerProvider>(context, listen: false)
                .increase();
          },
          child: Text(
            "+",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}
