typedef InstanceCreator<T> = T Function();

class DependencyInjector {
  DependencyInjector._();
  static final _singleton = DependencyInjector._();

  factory DependencyInjector() => _singleton;

  final _instanceMap = <Type, _InstanceController<Object>>{};

  void register<T extends Object>(
    InstanceCreator<T> instance, {
    bool isSingleton = true,
  }) =>
      _instanceMap[T] = _InstanceController(
        instance,
        isSingleton,
      );

  T get<T extends Object>() {
    final instance = _instanceMap[T]?.getInstance();
    if (instance != null && instance is T) return instance;
    throw Exception("[ERROR] -> Instance ${T.toString()} not found");
  }
}

class _InstanceController<T> {
  T? _instance;
  bool _isFirstGet = false;

  final InstanceCreator<T> _instanceGenerator;

  _InstanceController(this._instanceGenerator, bool isSingleton)
      : _isFirstGet = isSingleton;

  T? getInstance() {
    if (_isFirstGet) {
      _instance = _instanceGenerator();
      _isFirstGet = false;
    }
    return _instance ?? _instanceGenerator();
  }
}
