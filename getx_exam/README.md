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