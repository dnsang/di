abstract class Logger {
  void debug(String log);
}

class ConsoleLogger extends Logger {
  @override
  void debug(String log) {
    print(log);
  }
}
