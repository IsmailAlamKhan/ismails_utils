part of motion;

mixin MotionDelay {
  Timer? _delay;

  bool get isDelayed => _delay?.isActive ?? false;

  void cancelDelay() {
    _delay?.cancel();
    _delay = null;
  }

  void delay(double seconds) {
    cancelDelay();
    _delay = Timer(
      Duration(milliseconds: (seconds * 1000).round()),
      onDelayComplete,
    );
  }

  void onDelayComplete() {
    cancelDelay();
  }

  void dispose() {
    cancelDelay();
  }
}

enum MotionState { idle, target, start, moving }

abstract class MotionVal<T> with ChangeNotifier, MotionDelay {
  late T target, value;
  MotionState state = MotionState.idle;

  MotionVal(this.value) : target = value;

  bool get completed => target == value;

  void tick(Duration t);

  @override
  void delay(double seconds) {
    if (!completed) deactivate();
    super.delay(seconds);
  }

  @override
  void onDelayComplete() {
    super.onDelayComplete();
    if (!completed) {
      state = MotionState.start;
      activate();
    }
  }

  @override
  void dispose() {
    cancelDelay();
    deactivate();
    target = value;
    super.dispose();
  }

  void activate() {
    if (!completed && !isDelayed) {
      TickerMan.instance.activate(this);
    }
  }

  void deactivate() {
    TickerMan.instance.remove(this);
  }

  void set(T val) {
    value = target = val;
  }

  T call([T? v, double? delay]) {
    if (v != null) {
      target = v;
    }
    return value;
  }
}
