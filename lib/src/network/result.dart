import 'package:equatable/equatable.dart';

export 'handler.dart';

class XApiSnapshot<T> extends Equatable {
  const XApiSnapshot._(this.data, this.error, this.errorMessage,
      this.stackTrace);

  const XApiSnapshot.nothing() : this._(null, null, null, null);

  const XApiSnapshot.withData(T data) : this._(data, null, null, null);

  const XApiSnapshot.withError(
    Object error,
    String? errorMessage, [
    StackTrace stackTrace = StackTrace.empty,
  ]) : this._(null, error, errorMessage, stackTrace);

  final T? data;
  final Object? error;
  final String? errorMessage;
  final StackTrace? stackTrace;

  bool get hasData => data != null;

  bool get hasError =>
      error != null || errorMessage != null;

  T get requireData {
    if (hasData) {
      return data!;
    }
    if (hasError) {
      Error.throwWithStackTrace(error!, stackTrace!);
    }
    throw StateError('Snapshot has neither data nor error');
  }

  @override
  List<Object?> get props => [data, error, errorMessage, stackTrace];
}
