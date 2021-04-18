import 'package:connectivity/connectivity.dart';
import '../src.dart';
import 'logger.dart';

class ConnectivityService {
  static late ConnectivityService instance;
  ConnectivityResult _connectivity = ConnectivityResult.none;
  ConnectivityResult get connectivity => _connectivity;

  ConnectivityService.init() {
    Connectivity().onConnectivityChanged.listen((event) {
      _connectivity = event;
      LoggerService.instance.logger
          .i('Connectivity status changed to ${event.getString}');
    });

    LoggerService.instance.logger.i(
      'Connectivity Service started and listening to the Connectivity().onConnectivityChanged stream',
    );
    instance = this;
  }
}
