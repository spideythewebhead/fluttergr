import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:demo/models/track.dart';

@DataClass()
class SearchResponse {
  final SearchTypeResult<Track>? tracks;
}

@DataClass()
class SearchTypeResult<T> {
  final int totalCount;
  final List<DataWrapper<T>> items;
}

@DataClass()
class DataWrapper<T> {
  final T data;
}
