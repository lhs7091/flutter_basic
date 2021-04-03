# getx_exam

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Routing
 - 기본 페이지 라우팅
 - route 선언
 - named 페이지 라우팅
 - 페이지 전환 효과 적용
 - arguments 전달
 - 동적 링크 사용

## statement management

GetX Controller class
it's similar with Provider class.
```
import 'package:get/get.dart';

class CountControllerGetX extends GetxController {
  int count = 0;

  getCount() => count;

  void increase() {
    count++;
    update();
  }
}
```

if provider,
```
class CountControllerProvider extends ChangeNotifier {
  int count = 0;

  getCount() => count;

  void increase() {
    count++;
    notifyListeners();
  }
}
```


GetX do not need context. 
So don't need to make stateful or 'context' argument.
```
// getx(no context)
GetBuilder<CountControllerGetX>(
    builder: (controller) {
        return Text(
            '${controller.getCount()}',
            style: TextStyle(
            fontSize: 30,
            ),
        );
    },
),


// provider(using context)
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
```

## 반응형 상태관리(Reactive State Manager)

Reactive programming can alienate many people because it is said to be complicated. GetX turns reactive programming into something quite simple:

- You won't need to create StreamControllers.
- You won't need to create a StreamBuilder for each variable
- You will not need to create a class for each state.
- You will not need to create a get for an initial value.
- You will not need to use code generators

```
// Obx
Obx(
  () => Text(
    "${Get.find<CountControllerGetXReactive>().getCount().value}",
    style: TextStyle(
      fontSize: 30,
    ),
  ),
),

// GetX
GetX(builder: (_) {
  return Text(
    "${Get.find<CountControllerGetXReactive>().getCount().value}",
    style: TextStyle(
      fontSize: 30,
    ),
  );
}),
```

## 의존성 주입(Dependency Injection)
Get has a simple and powerful dependency manager that allows you to retrieve the same class as your Bloc or Controller with just 1 lines of code, no Provider context, no inheritedWidget:

```
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
  child: Text("Put")
),

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
  child: Text("lazy put")
),

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
```