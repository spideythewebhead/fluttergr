import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:demo/common/search_type.dart';

@DataClass()
class SearchRequest {
  /// Shorthand constructor
  SearchRequest({
    required this.query,
    this.type = SearchType.tracks,
    this.offset = 0,
    this.limit = 15,
    this.numberOfTopResults = 15,
  });

  @JsonKey(name: 'q')
  final String query;
  final SearchType type;
  final int offset;
  final int limit;
  final int numberOfTopResults;

  /// Converts [SearchRequest] to a [Map] json
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'q': query,
      'type': type.toJson(),
      'offset': offset,
      'limit': limit,
      'numberOfTopResults': numberOfTopResults,
    };
  }
}
