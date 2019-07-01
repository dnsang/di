import 'injector.dart';

abstract class Module {
  void configure(Binder binder);
}

abstract class AbstractModule implements Module {
  Binder _binder;
  Binder binder() {
    return _binder;
  }

  void init();

  void configure(Binder binder) {
    _binder = binder;
    init();
  }

  Binding bind(dynamic key) {
    return binder().bind(key);
  }

  T get<T>(dynamic key) {
    return binder().get(key);
  }
}
