import 'package:flutter_test/flutter_test.dart';

void main() async {
  test("testFuture", () {

    Future.delayed(Duration(milliseconds:1000),(){
      print("delayed");
    });

    Future f2 = new Future(() => null);

    f2.then((_) {
          print("我是真正的f2");
          Future f1 = new Future(() => null);
          f1.then((value) => print("我是f1"));
          return new Future(() => {print("全新的Future")});
        })
        .then((value) => print("我还是f2吗"))
        .then((value) => print("我不是了"));

  });
}
