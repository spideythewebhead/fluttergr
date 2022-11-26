import 'package:demo/models/track.dart';

class SearchResponse {
  final SearchTypeResult<Track>? tracks;
}

class SearchTypeResult<T> {
  final int totalCount;
  final List<DataWrapper<T>> items;
}

class DataWrapper<T> {
  final T data;
}
