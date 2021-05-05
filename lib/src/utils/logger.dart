import 'dart:developer';

class LoggerService {
  static late LoggerService instance;
  String _name = 'Ismail Util';

  LoggerService.init([String? name]) {
    if (name != null) {
      _name = name;
    }
    instance = this;
  }
  void logToConsole(String msg, {StackTrace? stackTrace}) {
    log(msg, name: _name, time: DateTime.now(), stackTrace: stackTrace);
  }
}
