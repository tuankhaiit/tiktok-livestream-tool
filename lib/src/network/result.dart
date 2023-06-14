import 'package:equatable/equatable.dart';

export 'handler.dart';

class XApiSnapshot<T> extends Equatable {
  const XApiSnapshot._(this.data, this.error, this.errorCode, this.errorMessage,
      this.stackTrace);

  const XApiSnapshot.nothing() : this._(null, null, null, null, null);

  const XApiSnapshot.withData(T data) : this._(data, null, null, null, null);

  const XApiSnapshot.withError(
    Object error,
    String? errorCode,
    String? errorMessage, [
    StackTrace stackTrace = StackTrace.empty,
  ]) : this._(null, error, errorCode, errorMessage, stackTrace);

  const XApiSnapshot.withErrorCode(
    Object? error,
    String errorCode, [
    StackTrace stackTrace = StackTrace.empty,
  ]) : this._(null, error, errorCode, null, stackTrace);

  const XApiSnapshot.withErrorMessage(
    Object? error,
    String errorMessage, [
    StackTrace stackTrace = StackTrace.empty,
  ]) : this._(null, error, null, errorMessage, stackTrace);

  final T? data;
  final Object? error;
  final String? errorCode;
  final String? errorMessage;
  final StackTrace? stackTrace;

  bool get hasData => data != null;

  bool get isError =>
      error != null || errorCode != null || errorMessage != null;

  @override
  List<Object?> get props => [data, error, errorCode, errorMessage, stackTrace];
}
