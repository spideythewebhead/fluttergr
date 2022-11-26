import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:data_class_plugin_fluttergr/models/track.dart';

@DataClass()
class SearchResponse {
  /// Shorthand constructor
  SearchResponse({
    this.tracks,
  });

  final SearchTypeResult<Track>? tracks;

  /// Creates an instance of [SearchResponse] from [json]
  factory SearchResponse.fromJson(Map<dynamic, dynamic> json) {
    return SearchResponse(
      tracks: json['tracks'] == null ? null : SearchTypeResult.fromJson(json['tracks']),
    );
  }
}

@DataClass()
class SearchTypeResult<T> {
  /// Shorthand constructor
  SearchTypeResult({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<DataWrapper<T>> items;

  /// Creates an instance of [SearchTypeResult] from [json]
  factory SearchTypeResult.fromJson(Map<dynamic, dynamic> json) {
    return SearchTypeResult(
      totalCount: json['totalCount'] as int,
      items: <DataWrapper<T>>[
        for (final dynamic i0 in (json['items'] as List<dynamic>)) DataWrapper.fromJson(i0),
      ],
    );
  }
}

@DataClass()
class DataWrapper<T> {
  /// Shorthand constructor
  DataWrapper({
    required this.data,
  });

  final T data;

  /// Creates an instance of [DataWrapper] from [json]
  factory DataWrapper.fromJson(Map<dynamic, dynamic> json) {
    return DataWrapper(
      data: jsonConverterRegistrant.find(T).fromJson(json['data']) as T,
    );
  }
}
