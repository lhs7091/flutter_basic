## Immutable

### 장점
 - 데이터에 대한 신뢰가 높아진다.
 - 방어적 대응을 고려하지 않아도 된다.
 - 멀티 스레드에 동기화 처리없이 객체를 사용할 수 있다.

### 단점
 - mutable사용보다 진입장벽이 있다.
 - 메모리 사용이 많아져 메모리 누수 이슈가 있을 수 있다.

## fianl vs const

 - final과 const 모두 한번 초기화 하면 값을 변경할 수 없음.
 - final은 변수 선언과 초기화를 각각 수행할 수 있으나,
 - const는 변수 선언과 동시에 초기화가 반드시 이루어 져야하는 차이가 있음.