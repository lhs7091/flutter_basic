import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exam/controller/count_controller_getx_reactive.dart';

class ReactiveStateManageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // instantiate
    Get.put(CountControllerGetXReactive());

    return Scaffold(
      appBar: AppBar(
        title: Text("Reactive State Management"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "GetX",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Obx(() {
                print("update number !!");
                return Text(
                  "${Get.find<CountControllerGetXReactive>().getCount().value}",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                );
              }),
              // GetX(builder: (_) {
              //   return Text(
              //     "${Get.find<CountControllerGetXReactive>().getCount().value}",
              //     style: TextStyle(
              //       fontSize: 30,
              //     ),
              //   );
              // }),
              ElevatedButton(
                onPressed: () {
                  Get.find<CountControllerGetXReactive>().increase();
                },
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),

              /*
              * if there is no change value, state also is not changed.(No Update call)
              */
              ElevatedButton(
                onPressed: () {
                  Get.find<CountControllerGetXReactive>().putNumber(5);
                },
                child: Text(
                  "Change 5",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
