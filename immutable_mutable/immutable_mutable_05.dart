void main() async {
  final String nameFinal;
  const String nameConst = "const test";

  nameFinal = 'final test';

  // 이때 const는 올 수 없음.
  final bool result = await Future.delayed(Duration(seconds: 1), () {
    return true;
  });
  print(result);

  // 이때도 const는 올 수 없음.
  final DateTime nowTime = DateTime.now();
  print(nowTime);
}
