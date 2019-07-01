import 'package:ddi/di.dart';
import 'package:ddi/module.dart';
import 'package:flutter_test/flutter_test.dart';

class TestClass {
  var _x;
  TestClass(String x) {
    _x = x;
  }
  @override
  String toString() {
    return _x;
  }
}

class TestModule extends AbstractModule {
  @override
  void init() {
    bind(String).to("A String Instance");
    bind(int).to(404);
    bind(TestClass).to(new TestClass(this.get(String)));
    bind("AnotherTestClass").to(new TestClass("AnotherTestClass"));
  }
}

void main() {
  group('Dependency Injection', () {
    test("Init Module & Inject data", () {
      DI.init([new TestModule()]);
      String str = DI.get(String);
      expect(str, equals("A String Instance"));

      int i = DI.get(int);
      expect(i, equals(404));

      TestClass cls = DI.get(TestClass);
      expect(cls.toString(), equals(str));

      TestClass anotherTestClass = DI.get("AnotherTestClass");
      expect(anotherTestClass.toString(), equals("AnotherTestClass"));
    });
  });
}
