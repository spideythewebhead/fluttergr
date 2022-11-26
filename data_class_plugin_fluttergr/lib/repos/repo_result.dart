import 'package:data_class_plugin/data_class_plugin.dart';

@Union(
  fromJson: false,
  toJson: false,
)
class RepoResult<T> {
  const RepoResult._();

  const factory RepoResult.data({
    required T data,
  }) = _RepoResultData<T>;

  const factory RepoResult.error({
    Object? error,
    StackTrace? stackTrace,
  }) = _RepoResultError<T>;

  /// Executes one of the provided callbacks based on a type match
  R when<R>({
    required R Function(_RepoResultData<T> value) data,
    required R Function(_RepoResultError<T> value) error,
  }) {
    if (this is _RepoResultData<T>) {
      return data(this as _RepoResultData<T>);
    }
    if (this is _RepoResultError<T>) {
      return error(this as _RepoResultError<T>);
    }
    throw UnimplementedError('Unknown instance of $this used in when(..)');
  }

  /// Executes one of the provided callbacks if a type is matched
  ///
  /// If no match is found [orElse] is executed
  R maybeWhen<R>({
    R Function(_RepoResultData<T> value)? data,
    R Function(_RepoResultError<T> value)? error,
    required R Function() orElse,
  }) {
    if (this is _RepoResultData<T>) {
      return data?.call(this as _RepoResultData<T>) ?? orElse();
    }
    if (this is _RepoResultError<T>) {
      return error?.call(this as _RepoResultError<T>) ?? orElse();
    }
    throw UnimplementedError('Unknown instance of $this used in maybeWhen(..)');
  }
}

class RepoResultData<T> extends RepoResult<T> {
  const RepoResultData({
    required this.data,
  }) : super._();

  final T data;

  /// Creates a new instance of [RepoResultData] with optional new values
  RepoResultData<T> copyWith({
    final T? data,
  }) {
    return RepoResultData<T>(
      data: data ?? this.data,
    );
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      data,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is RepoResultData<T> && data == other.data;
  }

  /// Returns a string with the properties of [RepoResultData]
  @override
  String toString() {
    String value = 'RepoResultData{<optimized out>}';
    assert(() {
      value = 'RepoResultData<$T>@<$hexIdentity>{data: $data}';
      return true;
    }());
    return value;
  }
}

class RepoResultError<T> extends RepoResult<T> {
  const RepoResultError({
    this.exception,
    this.stackTrace,
  }) : super._();

  final Exception? exception;
  final StackTrace? stackTrace;

  /// Creates a new instance of [RepoResultError] with optional new values
  RepoResultError<T> copyWith({
    final Exception? exception,
    final StackTrace? stackTrace,
  }) {
    return RepoResultError<T>(
      exception: exception ?? this.exception,
      stackTrace: stackTrace ?? this.stackTrace,
    );
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      exception,
      stackTrace,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is RepoResultError<T> &&
            exception == other.exception &&
            stackTrace == other.stackTrace;
  }

  /// Returns a string with the properties of [RepoResultError]
  @override
  String toString() {
    String value = 'RepoResultError{<optimized out>}';
    assert(() {
      value = 'RepoResultError<$T>@<$hexIdentity>{exception: $exception, stackTrace: $stackTrace}';
      return true;
    }());
    return value;
  }
}

class _RepoResultData<T> extends RepoResult<T> {
  const _RepoResultData({
    required this.data,
  }) : super._();

  final T data;

  /// Creates a new instance of [_RepoResultData] with optional new values
  _RepoResultData<T> copyWith({
    final T? data,
  }) {
    return _RepoResultData<T>(
      data: data ?? this.data,
    );
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      data,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is _RepoResultData<T> && data == other.data;
  }

  /// Returns a string with the properties of [_RepoResultData]
  @override
  String toString() {
    String value = '_RepoResultData{<optimized out>}';
    assert(() {
      value = '_RepoResultData<$T>@<$hexIdentity>{data: $data}';
      return true;
    }());
    return value;
  }
}

class _RepoResultError<T> extends RepoResult<T> {
  const _RepoResultError({
    this.error,
    this.stackTrace,
  }) : super._();

  final Object? error;
  final StackTrace? stackTrace;

  /// Creates a new instance of [_RepoResultError] with optional new values
  _RepoResultError<T> copyWith({
    final Object? error,
    final StackTrace? stackTrace,
  }) {
    return _RepoResultError<T>(
      error: error ?? this.error,
      stackTrace: stackTrace ?? this.stackTrace,
    );
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      error,
      stackTrace,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _RepoResultError<T> && error == other.error && stackTrace == other.stackTrace;
  }

  /// Returns a string with the properties of [_RepoResultError]
  @override
  String toString() {
    String value = '_RepoResultError{<optimized out>}';
    assert(() {
      value = '_RepoResultError<$T>@<$hexIdentity>{error: $error, stackTrace: $stackTrace}';
      return true;
    }());
    return value;
  }
}
