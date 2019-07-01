library di;

import 'injector.dart';
import 'module.dart';


class DI {
  static Injector _injector;

  static void init(List<Module> modules) {
    _injector = Injector.builder()
        .withBinder(new BinderImpl())
        .withModules(modules)
        .build();
  }

  static T get<T>(dynamic key) {
    return _injector.get(key);
  }
}
