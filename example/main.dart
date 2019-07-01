


import 'package:ddi/di.dart';
import 'package:ddi/module.dart';

import 'logger.dart';

void main(List<String> args) {
  DI.init([new ExampleModule()]);

  Logger logger = DI.get(Logger);
  logger.debug("Hello Dart Dependency Injection");  
  var logger2 = DI.get<Logger>(Logger);
  logger2.debug("Hello Dart Dependency Injection");
}

class ExampleModule extends AbstractModule{
  @override
  void init() {
    bind(Logger).to(new ConsoleLogger());
  }
  
}
