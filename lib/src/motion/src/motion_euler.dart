part of motion;

abstract class EulerBase<T> extends MotionVal<T> {
  late double minDistance, ease;

  EulerBase(
    T value, {
    T? target,
    this.minDistance = .01,
    this.ease = 10,
  }) : super(value) {
    log("Super value is: $value");
    this.target = target ?? value;
  }

  /// todo: should it have accessor (get/set)
  /// on MotionVal?
  @override
  set target(T v) {
    if (target == v) return;
    super.target = v;
    _updateTarget();
    activate();
  }

  @override
  set value(T v) {
    if (value == v) return;
    super.value = v;
    _updateValue();
    notifyListeners();
  }

  /// Must be overwritten in custom subclasses
  /// like `EulerColor`.
  void _updateTarget() {}

  void _updateValue() {}
}

class EulerVal extends EulerBase<double> {
  EulerVal(
    double value, {
    double? target,
    double minDistance = .1,
    double ease = 10,
  }) : super(
          value,
          target: target,
          minDistance: minDistance,
          ease: ease,
        );

  @override
  void tick(Duration t) {
    if (isDelayed) return;
    final double distance = target - value;
    if (distance.abs() <= minDistance) {
      value = target;
    } else {
      value += distance / ease;
    }
  }
}

class EulerInt extends EulerBase<int> {
  final EulerVal _value;

  EulerInt(
    int value, {
    int? target,
    double minDistance = .1,
    double ease = 10,
  })  : _value = EulerVal(
          value + .0,
          target: target?.toDouble(),
          minDistance: minDistance,
          ease: ease,
        ),
        super(
          value,
          target: target,
          minDistance: minDistance,
          ease: ease,
        );

  @override
  void _updateTarget() {
    _value(target + .0);
  }

  @override
  void _updateValue() {
    log("Value is: $value");
    _value.value = value + .0;
  }

  @override
  bool get completed => _value.completed;

  @override
  double get ease => _value.ease;

  @override
  set ease(double v) => _value.ease = v;

  @override
  double get minDistance => _value.minDistance;

  @override
  set minDistance(double v) => _value.minDistance = v;

  @override
  int get value => _value().round();

  @override
  void tick(Duration t) {
    if (isDelayed) return;
    if (!_value.completed) {
      _value.tick(t);
    }
    if (_value.completed) {
      value = target;
      notifyListeners();
    } else {
      notifyListeners();
    }
  }
}

class EulerAlignment extends EulerBase<Alignment> {
  EulerAlignment(
    Alignment value, {
    Alignment? target,
    double minDistance = .1,
    double ease = 10,
  }) : super(
          value,
          target: target,
          minDistance: minDistance,
          ease: ease,
        );

  @override
  void tick(Duration t) {
    final distance = target - value;
    if (distance.x.abs() <= minDistance && distance.y.abs() <= minDistance) {
      value = target;
    } else {
      value += distance / ease;
    }
  }
}

class EulerOffset extends EulerBase<Offset> {
  EulerOffset(
    Offset value, {
    Offset? target,
    double minDistance = .1,
    double ease = 10,
  }) : super(
          value,
          target: target,
          minDistance: minDistance,
          ease: ease,
        );

  @override
  void tick(Duration t) {
    final distance = target - value;
    if (distance.dx.abs() <= minDistance && distance.dy.abs() <= minDistance) {
      value = target;
    } else {
      value += distance / ease;
    }
  }
}

class EulerColor extends EulerBase<Color> {
  final r = EulerVal(0), g = EulerVal(0), b = EulerVal(0), a = EulerVal(0);

  EulerColor(
    Color value, {
    Color? target,
    double minDistance = 2,
    double ease = 20,
  }) : super(
          value,
          target: target,
          minDistance: minDistance,
          ease: ease,
        );

  @override
  double get ease => r.ease;

  @override
  set ease(double v) => r.ease = g.ease = b.ease = a.ease = v;

  @override
  double get minDistance => r.minDistance;

  @override
  set minDistance(double v) =>
      r.minDistance = g.minDistance = b.minDistance = a.minDistance = v;

  @override
  bool get completed => value.value == target.value;

  @override
  void _updateTarget() {
    r(target.red + .0);
    g(target.green + .0);
    b(target.blue + .0);
    a(target.alpha + .0);
  }

  @override
  void _updateValue() {
    r.value = value.red + .0;
    g.value = value.green + .0;
    b.value = value.blue + .0;
    a.value = value.alpha + .0;
  }

  @override
  Color get value =>
      Color.fromARGB(a().round(), r().round(), g().round(), b().round());

  @override
  void tick(Duration t) {
    if (isDelayed) return;
    if (!r.completed) r.tick(t);
    if (!g.completed) g.tick(t);
    if (!b.completed) b.tick(t);
    if (!a.completed) a.tick(t);
    if (r.completed && g.completed && b.completed && a.completed) {
      value = target;
    } else {
      notifyListeners();
    }
  }
}
