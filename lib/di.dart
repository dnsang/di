library ddi;

import 'injector.dart';
import 'module.dart';

/// A facade class to work with your DI
class DI {
  static Injector _injector;

  /// Init Injector with your Module
  static void init(List<Module> modules) {
    _injector = Injector.builder()
        .withBinder(new BinderImpl())
        .withModules(modules)
        .build();
  }

  static T get<T>(dynamic key) {
    return _injector.get<T>(key);
  }
}
