import 'dart:developer';

class LoggerService {
  factory LoggerService([String name = 'Ismail Util']) {
    _instance._name = name;
    return _instance;
  }
  LoggerService._();
  static final LoggerService _instance = LoggerService._();
  String _name = 'Ismail Util';

  void logToConsole(String msg, {StackTrace? stackTrace}) {
    log(msg, name: _name, time: DateTime.now(), stackTrace: stackTrace);
  }
}
