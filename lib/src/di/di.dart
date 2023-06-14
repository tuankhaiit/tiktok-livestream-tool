import 'package:get_it/get_it.dart';

class XDI {
  const XDI._();

  static XDI get instance => _instance;

  static XDI get I => _instance;
  static const XDI _instance = XDI._();

  bool isRegistered<T extends Object>(
      {Object? instance, String? instanceName}) {
    return _getIt.isRegistered<T>(
        instance: instance, instanceName: instanceName);
  }

  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _getIt.get<T>(
        instanceName: instanceName, param1: param1, param2: param1);
  }

  T call<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _getIt.call<T>(
        instanceName: instanceName, param1: param1, param2: param2);
  }

  Future<T> getAsync<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _getIt.getAsync<T>(
        instanceName: instanceName, param1: param1, param2: param2);
  }

  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    return _getIt.registerFactory<T>(factoryFunc);
  }

  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? dispose,
  }) {
    _getIt.registerSingleton<T>(instance,
        instanceName: instanceName,
        signalsReady: signalsReady,
        dispose: dispose);
  }

  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? dispose,
  }) {
    _getIt.registerLazySingleton<T>(factoryFunc,
        instanceName: instanceName, dispose: dispose);
  }

  GetIt get _getIt => GetIt.I;
}
