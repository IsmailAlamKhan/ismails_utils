part of motion;

class TickerMan {
  static final _instance = TickerMan();

  static TickerMan get instance => _instance;

  late final _ticker = Ticker(_onTick);
  final _motions = <MotionVal>{};

  TickerMan();

  void isActive() => _ticker.isActive;

  void stop() {
    if (_ticker.isActive) _ticker.stop();
  }

  void start() {
    if (!_ticker.isActive) _ticker.start();
  }

  void _onTick(Duration t) {
    final remover = <MotionVal>{};
    for (final motion in _motions) {
      motion.tick(t);
      if (motion.completed) {
        remover.add(motion);
      }
    }
    for (final motion in remover) {
      _motions.remove(motion);
    }

    if (_motions.isEmpty) {
      stop();
    }
  }

  void remove<T>(MotionVal<T> euler) {
    _motions.remove(euler);
  }

  void activate<T>(MotionVal<T> euler) {
    if (!euler.completed) {
      _motions.add(euler);
      start();
    }
  }
}
