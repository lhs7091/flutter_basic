import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exam/controller/dependency_controller.dart';
import 'package:getx_exam/dependecy/get_lazy_put.dart';
import 'package:getx_exam/dependecy/get_put.dart';

class DependencyManageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dependency Injection"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /**
             * 페이지 이동시, controller를 주입.
             * GetPut클래스 안에서는 controller를 인스턴스화 할 필요가 없음.
             * 페이지에서 나올때, 메모리상에서도 자동으로 삭제해줌.
             */
            ElevatedButton(
                onPressed: () {
                  Get.to(GetPut(), binding: BindingsBuilder(() {
                    Get.put(DependencyController());
                  }));
                },
                child: Text("Put")),

            /**
             * 페이지 이동시, controller를 주입
             * 최초 인스턴스화는 되지 않음
             * 이동상 페이지에서 사용할때 인스턴스화
             */
            ElevatedButton(
                onPressed: () {
                  Get.to(GetLazyPut(), binding: BindingsBuilder(() {
                    Get.lazyPut<DependencyController>(
                        () => DependencyController());
                  }));
                },
                child: Text("lazy put")),

            /**
             * 페이지 이동시, controller 주입
             * 주입전 비동기 처리가 있을 경우 사용
             */
            ElevatedButton(
              onPressed: () {
                Get.to(
                  GetPut(),
                  binding: BindingsBuilder(() {
                    Get.putAsync<DependencyController>(() async {
                      await Future.delayed(Duration(seconds: 2));
                      return DependencyController();
                    });
                  }),
                );
              },
              child: Text("put async"),
            ),
            /**
             * 페이지 이동시, controller 주입
             * 페이지 이동후 인스턴스화 되지 않음
             * 인스턴스화 할 경우 계속 생성 가능
             * put의 경우 처음 1번만 생성
             */
            ElevatedButton(
              onPressed: () {
                Get.to(GetPut(), binding: BindingsBuilder(() {
                  Get.create<DependencyController>(() {
                    return DependencyController();
                  });
                }));
              },
              child: Text("Get Create"),
            ),
          ],
        ),
      ),
    );
  }
}
