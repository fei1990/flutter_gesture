
@pragma('vm:entry-point')
void myOtherEntrypoint() => Mydart('hello world!');

class Mydart {

  var str = '123';

  Mydart(String str) {
    this.str = str;
    testFunc();
  }

  testFunc() {
    print(str);
  }

}