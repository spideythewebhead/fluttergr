import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:demo/models/track.dart';

@DataClass()
class HomePageState {
  /// Shorthand constructor
  const HomePageState({
    this.query = '',
    this.loadingState = const LoadingState(),
    this.tracks = const <Track>[],
    this.hasQueriedAtLeastOnce = false,
  });

  final String query;
  final LoadingState loadingState;
  final ListOfTracks tracks;
  final bool hasQueriedAtLeastOnce;

  /// Returns a string with the properties of [HomePageState]
  @override
  String toString() {
    String value = 'HomePageState{<optimized out>}';
    assert(() {
      value =
          'HomePageState@<$hexIdentity>{query: $query, loadingState: $loadingState, tracks: $tracks, hasQueriedAtLeastOnce: $hasQueriedAtLeastOnce}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      query,
      loadingState,
      tracks,
      hasQueriedAtLeastOnce,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is HomePageState &&
            query == other.query &&
            loadingState == other.loadingState &&
            deepEquality(tracks, other.tracks) &&
            hasQueriedAtLeastOnce == other.hasQueriedAtLeastOnce;
  }

  /// Creates a new instance of [HomePageState] with optional new values
  HomePageState copyWith({
    final String? query,
    final LoadingState? loadingState,
    final List<Track>? tracks,
    final bool? hasQueriedAtLeastOnce,
  }) {
    return HomePageState(
      query: query ?? this.query,
      loadingState: loadingState ?? this.loadingState,
      tracks: tracks ?? this.tracks,
      hasQueriedAtLeastOnce: hasQueriedAtLeastOnce ?? this.hasQueriedAtLeastOnce,
    );
  }
}

@DataClass()
class LoadingState {
  /// Shorthand constructor
  const LoadingState({
    this.isLoadingResults = false,
    this.failedToLoadResults = false,
  });

  final bool isLoadingResults;
  final bool failedToLoadResults;

  /// Returns a string with the properties of [LoadingState]
  @override
  String toString() {
    String value = 'LoadingState{<optimized out>}';
    assert(() {
      value =
          'LoadingState@<$hexIdentity>{isLoadingResults: $isLoadingResults, failedToLoadResults: $failedToLoadResults}';
      return true;
    }());
    return value;
  }

  /// Returns a hash code based on [this] properties
  @override
  int get hashCode {
    return Object.hashAll(<Object?>[
      runtimeType,
      isLoadingResults,
      failedToLoadResults,
    ]);
  }

  /// Compares [this] with [other] on identity, class type, and properties
  /// *with deep comparison on collections*
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is LoadingState &&
            isLoadingResults == other.isLoadingResults &&
            failedToLoadResults == other.failedToLoadResults;
  }

  /// Creates a new instance of [LoadingState] with optional new values
  LoadingState copyWith({
    final bool? isLoadingResults,
    final bool? failedToLoadResults,
  }) {
    return LoadingState(
      isLoadingResults: isLoadingResults ?? this.isLoadingResults,
      failedToLoadResults: failedToLoadResults ?? this.failedToLoadResults,
    );
  }
}
