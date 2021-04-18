import 'package:logger/logger.dart';

class LoggerService {
  static late LoggerService instance;

  late Logger logger;

  LoggerService() {
    logger = Logger(printer: PrettyPrinter());
    logger.i('Logger service started');
    instance = this;
  }
}
